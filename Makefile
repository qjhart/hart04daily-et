http:=http://goes.casil.ucdavis.edu/cimis
# First setup a SSH pipe with 
# ssh -L 9000:localhost:5432 qjhart@casil.ucdavis.edu
PSQL := psql --port=9000 --host=localhost --username=qjhart -P footer=off -P fieldsep=" " -A -d cimis

report:=hart06et
report_TEX:=../cimis.bib ../cimis_acronyms.tex
report_CRUFT:=$(patsubst %,$(report).%,aux bbl blg dvi log pdf ps toc)

# Pre figure writers
atds:=figs/process
ssds:=$(atds)

# Xfigs
xfigs:= insolation $(ssds) figs/stations figs/rms 2005/06/18/et0

# Should be able to build stuff from
dates:=2005/06/18 2005/12/21
parms:=nd_max_at_lr5_t10_s0.03 U2 Rso et0 Rs d_max_at_dme d_max_at_ns
fig_dates_PNG:=$(foreach date,$(dates),$(patsubst %,$(date)/%.png,$(parms)))
fig_dates:=$(patsubst %,%.eps,$(fig_dates_PNG))

# Winter PNGS
winter_PNG := 2005-01-06/vis1200.png 2005-01-06/p1200.png \
	2005-01-11/vis1200.png 2005-01-15/vis1200.png \
	2005-01-21/vis1200.png 2005-01-19/p1200.png \
	2005-01-21/p1200.png 2005-01-23/p1200.png \
	2005-01-25/p1200.png

# Cloud cover example
k_PNG := $(patsubst %,2006-03-06/vis%00.png,09 12 15) $(patsubst %,2006-03-06/p%00.png,09 12 15) 2006-03-06/K.png 2006-03-06/Rso.png  2006-03-06/Rs.png 2006-03-06/et0.png

# G-compare
fig_R :=Rs K Rnl winter_Rs winter_fog_Rs
fig_R_SRC:=$(patsubst %,%.dat,$(fig_R))
fig_R_DAT:=$(patsubst %,%.dat,$(fig_R_SRC))
fig_R_PDF:=$(patsubst %,%_R.pdf,$(fig_R))

###########################################
# Xfig from SSD files
###########################################
define ssd
$(1).fig: $(1).$(2)
	t$(2) -toFig $$@ -latex $$<
endef

$(foreach s,$(atds),$(eval $(call ssd,$(s),atd)))

###########################################
# Data Files
##########################################
# use this to get the data for the sr picture of Rs errors
# This goes in ArcMap thingy,
# Or could be read with 
#v.in.ascii out=rms x=2 y=3 cat=1  columns='cat int, x double, y double, rms double' input=sr.dat
sr.dat:
	$(PSQL) -F'|' -P tuples_only -q -c "select s.st_number,x(st_casil83),y(st_casil83),avg.rms as rms from station s, (select st_number,(sqrt(sum((d_sr_avg*24*0.0036-g.g*0.0036)^2))/count(*))::decimal(6,3) as rms from station s join daily c using (st_number) JOIN goes_daily g using (st_number,d_date) where c.d_sr_avg is not null and c.d_sr_avg_qc is null and g.g is not null and d_sr_avg>0 group by st_number) as avg where (s.st_number=avg.st_number) order by st_number" > $@


# Comparison of Heliosat and ASCE Rso at stations.
# I used this and summary((GOES-ASCE)/GOES) to get the average difference
# in the predictions.
Heliosat.R.dat:
	$(PSQL) -c " select st_number,d_date,gc*0.0036 as GOES,asce_rso as ASCE from goes_daily where asce_rso is not null and gc is not null" | sed -e 's/goes/GOES/;s/asce/ASCE/' > $@

Rs.R.dat:
	$(PSQL) -c "select d_sr_avg*24*0.0036 as station,g.g*0.0036 as GOES from daily c JOIN goes_daily g USING (st_number,d_date) where c.d_sr_avg is not null and c.d_sr_avg_qc is null and g.g is not null" > $@


K.R.dat:
	$(PSQL) -c "select d_sr_avg*24*0.0036/asce_rso as Station,k as GOES from daily c JOIN goes_daily go USING (st_number,d_date) where c.d_sr_avg is not null and c.d_sr_avg_qc is null and go.k is not null and go.asce_rso is not null" > $@

# Need a summary for smaller plot files.
Rs.R.dat.summary Rnl.R.dat.summary: %.summary: %
	echo "Station GOES" > $@
	perl -n -a -e 'printf "%.1f %.1f\n",$$F[0],$$F[1]' $< | sort -n | sort -u  >> $@

Rnl.R.dat:
	$(PSQL) -c "select -rnl(c,d_sr_avg*24*0.0036/asce_rso) as station,-rnl(go) as goes from daily c JOIN goes_daily go USING (st_number,d_date)  where rnl(c,d_sr_avg*24*0.0036/asce_rso) is not null and c.d_sr_avg_qc is null and c.d_avg_nr_qc is null  and rnl(go) is not null" > $@
	perl -n -a -e 'printf "%.1f %.1f\n",$F[0],$F[1]' $@ | sort -u > $@.summary

winter_fog_Rs.R.dat:
	$(PSQL) -c "select d_sr_avg*24*0.0036 as station,g.g*0.0036 as goes from daily c JOIN goes_daily g USING (st_number,d_date) where c.d_sr_avg is not null and c.d_sr_avg_qc is null and g.g is not null and g.d_date in('2005-01-21','2005-01-22','2005-01-23','2005-01-24')" > $@

winter_Rs.R.dat:
	$(PSQL) -c "select d_sr_avg*24*0.0036 as station,g.g*0.0036 as goes from daily c JOIN goes_daily g USING (st_number,d_date) where c.d_sr_avg is not null and c.d_sr_avg_qc is null and g.g is not null and extract(month from g.d_date)=1 and extract(year from g.d_date)=2005" > $@


%_R.pdf: %.R %.R.dat
	(echo 'pdf("$@", horizontal=FALSE, onefile=FALSE,height=4.5,width=4,pointsize=8)'; cat $<; echo 'dev.off()') | R --vanilla

%.R.eps: %.R %.R.dat
	(echo 'postscript("$@", horizontal=FALSE, onefile=FALSE,height=4,width=4, pointsize=10)'; cat $<; echo 'dev.off()') | R --vanilla

clean::
	rm $(fig_R_PDF) $(fig_R_DAT)

# Here's some information on the elevation histograms for
# the CIMIS stations.

clean::
	rm elevation.pdf

Z.pdf: Z.R Z.stations Z.image
	(echo 'pdf("$@", horizontal=FALSE, onefile=FALSE,height=3.5,width=4,pointsize=8)'; cat $<; echo 'dev.off()') | R --vanilla

Z.stations:
	$(PSQL) -c " select st_number as st_number,st_elevation/3.2808399 as elevation from station where st_end is NULL" > $@

Z.image:
	@echo "Z.image is from:";
	@echo " g.region=rast=Z@2km; g.copy rast=state@2km,MASK;"
	@echo "r.stats -1 Z@2km | grep -v '*' > ~/Z.image"

# read into grass with
#v.in.ascii out=stations x=2 y=3 z=5 cat=1  columns='station int, x double, y double, name char(40)' input=stations.asc
figs/stations.asc:
	$(PSQL) -P tuples_only -F'|' -c " select st_number as st_number,x(st_casil83),y(st_casil83),st_name,st_elevation/3.2808399 as elevation from station where st_end is NULL order by elevation asc;" > $@


# Here's a method to calculate the Daymet Style prediction of lapse
# rates, which is done for different regions and times.  The data is 
# all stored in these single docs, we could add to these fairly easily
# $(1) = lapse rate regions (select region from lapse_rate) NAPA is bad
# $(2) = month (1-12)

define lapse_rate_data_all_months

lapse_rate:: lapse_rate/$(1).dat

clean:: 
	rm -f lapse_rate/$(1).dat

lapse_rate/$(1).dat:
	$(PSQL) -c "select d1.d_date,g1.k as k,g2.k as k2,(s1.st_elevation-s2.st_elevation)/3280.8399 as delta_Z,(d1.d_max_at-d2.d_max_at) as delta_max_at,(d1.d_min_at-d2.d_min_at) as delta_min_at,(d1.d_dewp-d2.d_dewp) as delta_dewp from station s1 join daily d1 using (st_number) join goes_daily g1 using (st_number,d_date), station s2 join daily d2 using (st_number) join goes_daily g2 using (st_number,d_date), lapse_rate_regions lr where s1.st_casil83 && lr.the_geom and s2.st_casil83 && lr.the_geom and s1.st_number != s2.st_number and d1.d_date=d2.d_date and lr.region='$(1)' and d1.d_max_at is not null and d1.d_min_at is not null and d1.d_dewp is not null and d2.d_max_at is not null and d2.d_min_at is not null and d2.d_dewp is not null order by (s1.st_elevation-s2.st_elevation) desc" > $$@
lapse_rate/$(1)_K.dat: lapse_rate/$(1).dat
	perl -n -a -e 'print if (($F[0]=~/[a-z]/) or ($F[1]>0.85 and $F[2]>0.85))' < $$< > $$@

endef

$(foreach z,sacramento southvalley southcoast northvalley,\
	    $(eval $(call lapse_rate_data_all_months,$(z))))


define lapse_rate_all_months_pdf

lapse_rate:: lapse_rate/$(1)_$(2).pdf lapse_rate/$(1)_$(2)_K.pdf

lapse_rate/$(1)_$(2).pdf: lapse_rate/$(1).dat
	echo 'pdf("$$@", horizontal=FALSE, onefile=FALSE,height=3,width=4, pointsize=10); \
	T<- read.table("$$<",header=TRUE); \
	attach(T); \
	fm <- lm(delta_$(2) ~ 0 + delta_z ); \
	dz<-coef(fm); cat(dz);\
	plot(delta_z,delta_$(2),main=append("$(1): $(2)",dz),type="p",pch=".",col="gray"); \
	abline(fm,col="black",lty=3,lwd=2);' | R --vanilla --slave > $$@.lr

lapse_rate/$(1)_$(2)_K.pdf: lapse_rate/$(1)_K.dat
	echo 'pdf("$$@", horizontal=FALSE, onefile=FALSE,height=3,width=4, pointsize=10); \
	T<- read.table("$$<",header=TRUE); \
	attach(T); \
	fm <- lm(delta_$(2) ~ 0 + delta_z ); \
	dz<-coef(fm); cat(dz);\
	plot(delta_z,delta_$(2),main=append("$(1): $(3) (Month $(2))",dz),type="p",pch=".",col="gray"); \
	abline(fm,col="black",lty=3,lwd=2);' | R --vanilla --slave > $$@.lr

endef

$(foreach z,sacramento southvalley southcoast northvalley,\
  $(foreach T,max_at min_at dewp,\
    $(eval $(call lapse_rate_all_months_pdf,$(z),$(T)))))


define lapse_rate_data

lapse_rate:: lapse_rate/$(1)_$(2).dat

clean:: 
	rm -f lapse_rate/$(1)_$(2).dat

lapse_rate/$(1)_$(2).dat:
	$(PSQL) -c "select d1.d_date,g1.k as k1,g2.k as k2,(s1.st_elevation-s2.st_elevation)/3280.8399 as delta_Z,(d1.d_max_at-d2.d_max_at) as delta_max_at,(d1.d_min_at-d2.d_min_at) as delta_min_at,(d1.d_dewp-d2.d_dewp) as delta_dewp from station s1 join daily d1 using (st_number) join goes_daily g1 using (st_number,d_date), station s2 join daily d2 using (st_number) join goes_daily g2 using (st_number,d_date), lapse_rate_regions lr where s1.st_casil83 && lr.the_geom and s2.st_casil83 && lr.the_geom and s1.st_number != s2.st_number and d1.d_date=d2.d_date and lr.region='$(1)' and extract(month from d2.d_date)=$(2) and d1.d_max_at is not null and d1.d_min_at is not null and d1.d_dewp is not null and d2.d_max_at is not null and d2.d_min_at is not null and d2.d_dewp is not null order by (s1.st_elevation-s2.st_elevation) desc" > $$@

lapse_rate/$(1)_$(2)_K.dat: lapse_rate/$(1)_$(2).dat
	perl -n -a -e 'print if (($F[0]=~/[a-z]/) or ($F[1]>0.85 and $F[2]>0.85))' < $$< > $$@

endef

$(foreach m,1 2 3 4 5 6 7 8 9 10 11 12,\
  $(foreach z,sacramento southvalley southcoast northvalley,\
    $(eval $(call lapse_rate_data,$(z),$(m)))))


# Here's a method to calculate the Daymet Style prediction of lapse
# rates, which can be done for each:
# $(1) = lapse rate regions (select region from lapse_rate) NAPA is bad
# $(2) = month (1-12)
# $(3) = Temp (max_at,min_at,dewp)

define lapse_rate_pdf

lapse_rate:: lapse_rate/$(1)_$(2)_$(3).pdf lapse_rate/$(1)_$(2)_$(3)_K.pdf

lapse_rate/$(1)_$(2)_$(3).pdf: lapse_rate/$(1)_$(2).dat
	echo 'pdf("$$@", horizontal=FALSE, onefile=FALSE,height=3,width=4, pointsize=10); \
	T<- read.table("$$<",header=TRUE); \
	attach(T); \
	fm <- lm(delta_$(3) ~ 0 + delta_z ); \
	dz<-coef(fm); cat(dz);\
	plot(delta_z,delta_$(3),main=append("$(1): $(3) (Month $(2))",dz),type="p",pch=".",col="gray"); \
	abline(fm,col="black",lty=3,lwd=2);' | R --vanilla --slave > $$@.lr

lapse_rate/$(1)_$(2)_$(3)_K.pdf: lapse_rate/$(1)_$(2)_K.dat
	echo 'pdf("$$@", horizontal=FALSE, onefile=FALSE,height=3,width=4, pointsize=10); \
	T<- read.table("$$<",header=TRUE); \
	attach(T); \
	fm <- lm(delta_$(3) ~ 0 + delta_z ); \
	dz<-coef(fm); cat(dz);\
	plot(delta_z,delta_$(3),main=append("$(1): $(3) (Month $(2))",dz),type="p",pch=".",col="gray"); \
	abline(fm,col="black",lty=3,lwd=2);' | R --vanilla --slave > $$@.lr

endef

$(foreach m,1 2 3 4 5 6 7 8 9 10 11 12,\
  $(foreach z,sacramento southvalley southcoast northvalley,\
   $(foreach T,max_at min_at dewp,\
    $(eval $(call lapse_rate_pdf,$(z),$(m),$(T))))))

#######################
# You can summarize the Lapse rate results with this:
#
######################

lapse_rate.tex lapse_rate_K.tex: lapse_rate%.tex: lapse_rate
	month=(FOO Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec); \
	for m in 1 2 3 4 5 6 7 8 9 10 11 12; do \
	 echo -n "$${month[$$m]}"; \
	 for z in southcoast southvalley sacramento; do \
	  for t in max_at min_at dewp; do \
	   lr=`cat lapse_rate/$${z}_$${m}_$${t}$*.pdf.lr | perl -n -e 'printf("%1.2f",$$_)'`; \
	   echo -n "& $$lr"; \
	  done; \
         done; \
	 echo '\\'; \
	done > $@


# Here's a method to calculate the Daymet Style prediction of lapse
# rates, which can be done for each:
# $(1) = Temp (max_at,min_at,dewp)
# $(2) = lapse rate regions (select region from lapse_rate) NAPA is bad
# $(3) = month (1-12)
define lapse_rate_old

clean::
	rm -f lapse_rate/$(1)_$(2)_$(3).dat lapse_rate/$(1)_$(2)_$(3).pdf

lapse_rate/$(1)_$(2)_$(3).dat:
	$(PSQL) -c "select (s1.st_elevation-s2.st_elevation)/3280.8399 as delta_Z,(d1.d_$(1)-d2.d_$(1)) as delta_$(1) from station s1 join daily d1 using (st_number), station s2 join daily d2 using (st_number), lapse_rate_regions lr where s1.st_casil83 && lr.the_geom and s2.st_casil83 && lr.the_geom and s1.st_number != s2.st_number and d1.d_date=d2.d_date and d1.d_$(1) is not null and d2.d_$(1) is not null and lr.region='$(2)' and extract(month from d2.d_date)=$(3) order by (s1.st_elevation-s2.st_elevation) desc" > $$@

lapse_rate.tex lapse_rate_K.tex: lapse_rate%.tex: lapse_rate

lapse_rate/$(1)_$(2)_$(3).pdf lapse_rate/$(1)_$(2)_$(3)_K.pdf: %.pdf: %.dat
	echo 'pdf("$$@", horizontal=FALSE, onefile=FALSE,height=3,width=4, pointsize=10); \
	T<- read.table("$$<",header=TRUE); \
	options(digits=1); \
	attach(T); \
	fm <- lm(delta_$(1) ~ 0 + delta_z ); \
	dz<-coef(fm); cat(dz);\
	plot(delta_z,delta_$(1),main=append("$(2): $(1) (Month $(3))",dz),type="p",pch=".",col="gray"); \
	abline(fm,col="black",lty=3,lwd=2);' | R --vanilla --slave > $$<.lr

lapse_rate/$(1)_$(2)_$(3)_K.dat:
	$(PSQL) -c "select (s1.st_elevation-s2.st_elevation)/3280.8399 as delta_Z,(d1.d_$(1)-d2.d_$(1)) as delta_$(1) from station s1 join daily d1 using (st_number) join goes_daily g1 using (st_number,d_date), station s2 join daily d2 using (st_number) join goes_daily g2 using (st_number,d_date), lapse_rate_regions lr where s1.st_casil83 && lr.the_geom and s2.st_casil83 && lr.the_geom and s1.st_number != s2.st_number and d1.d_date=d2.d_date and d1.d_$(1) is not null and d2.d_$(1) is not null and lr.region='$(2)' and extract(month from d2.d_date)=$(3) and g1.k>0.8 and g2.k>0.8 order by (s1.st_elevation-s2.st_elevation) desc" > $$@

lapse_rate/$(1)_$(2)_$(3)_K.pdf: lapse_rate/$(1)_$(2)_$(3)_K.dat
	echo 'pdf("$$@", horizontal=FALSE, onefile=FALSE,height=3,width=4, pointsize=10); \
	T<- read.table("$$<",header=TRUE); \
	attach(T); \
	fm <- lm(delta_$(1) ~ 0 + delta_z ); \
	dz<-coef(fm); cat(dz);\
	plot(delta_z,delta_$(1),main=append("$(2): $(1) (Month $(3))",dz),type="p",pch=".",col="gray"); \
	abline(fm,col="black",lty=3,lwd=2);' | R --vanilla --slave > $$<.lr

endef

$(foreach m,1 2 3 4 5 6 7 8 9 10 11 12,\
  $(foreach z,napa sacramento southvalley southcoast northvalley,\
   $(foreach T,max_at min_at dewp,\
     $(eval $(call lapse_rate,$(T),$(z),$(m))))))

#
# Here's a common way to build tex files from fig documents
#
define xfig
.PHONY: pdf eps figs
pdf:: $(1).pdf.tex
eps:: $(1).eps.tex 
$(1).eps.tex: $(1).eps
	fig2dev -L pstex_t -p $(1).fig.eps $(1).fig $(1).eps.tex
clean::
	rm -f $(1).eps.tex
$(1).eps: $(1).fig
	fig2dev -L pstex $(1).fig $(1).fig.eps
clean::
	rm -f $(1).fig.eps
# Section for PDF files
$(1).pdf.tex: $(1)_fig.pdf
	fig2dev -L pdftex_t -p $(1)_fig.pdf $(1).fig $(1).pdf.tex
$(1)_fig.pdf: $(1).fig
	fig2dev -L pdftex $(1).fig $(1)_fig.pdf
clean::
	rm -f $(1).pdf.tex $(1)_fig.pdf
endef
$(foreach f,$(xfigs),$(eval $(call xfig,$(f))))

report_FIGURES:=$(fig_dates_PNG) $(fig_Rs) $(fig_insolation)

.PHONY: figs info report

info:
	@echo FIGURES: $(report_FIGURES)

figs:: $(report_FIGURES)
report: $(report).pdf

%.png:
	wget -O $@ $(http)/$@ 

%.png.eps: %.png
	pngtopnm $< | pnmtops > $@

$(fig_insolation): $(fig_insolation_SRC)
	@echo "Need to rerun xfig" && exit(1);

$(report).pdf: $(report).tex $(report_TEX) $(report_FIGURES)
	pdflatex $(report)

clean:: 
	rm -f $(report_CRUFT) *~


############################################################
# This figure is for the location overview
############################################################
figs/CA-overview.pdf: %.pdf: %.eps
	ps2pdf $< $@

figs/CA-overview.eps:
	GMT pscoast -R-200/-60/-70/70 -JG-130/35/2c -Dc -A50000 -P -G75 -S200 --PAPER_MEDIA=letter+ > $@


gp.fig:=set terminal fig monochrome solid textspecial; set size 0.65,0.65
gp.pdf:=set terminal pdf monochrome solid 8; set size 0.65,0.65
gp.eps:=set terminal epslatex monochrome solid 8; set size 0.65,0.65

graphs:= monthly/pca
graphs.tex:=$(addsuffix .tex,$(graphs))
graphs.fig:=$(addsuffix .fig,$(graphs))
graphs.pdf:=$(addsuffix .pdf,$(graphs))


$(graphs.fig): %.fig: %.gp %.gp.dat
	echo '$(gp.fig); set output "$@";' | cat - $< | gnuplot

#$(graphs.pdf): %.pdf: %.gp %.gp.dat
#	echo '$(gp.pdf); set output "$@";' | cat - $< | gnuplot

$(foreach f,$(graphs),$(eval $(call xfig,$(f))))

#######################################################
# formatting for Elsevier
#######################################################
elsevier/cimis_acronyms.tex: ../cimis_acronyms.tex
	cp $< $@

define el-pdf

.PHONY: elsevier

elsevier: elsevier/$(2)_fig.pdf elsevier/$(2).pdf.tex

elsevier/$(2)_fig.pdf: $(1)_fig.pdf
	cp $< $@

elsevier/$(2).pdf.tex: $(1).pdf.tex
	cp $< $@
endef

$(eval $(call el-pdf,figs/process,process))
$(eavl $(call el-pdf,2005/06/18/et0,et0)

.PHONY: elsevier
elsevier: elsevier/cimis_acronyms.tex
