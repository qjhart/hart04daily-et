doc:=hart06et

define make-fig
figs:: fig_$(1).pdf
clean::
	rm -f fig_$(1).pdf fig_$(1).log

fig_$(1).pdf:
	texexec  --pdfselect --selection=$(2) $(doc) --result=fig_$(1).pdf
endef

$(eval $(call make-fig,1,22))
$(eval $(call make-fig,2,23))
$(eval $(call make-fig,3,24))
$(eval $(call make-fig,4,25))
$(eval $(call make-fig,5,26))
$(eval $(call make-fig,6,27))
$(eval $(call make-fig,7,28))
$(eval $(call make-fig,8,29))
$(eval $(call make-fig,9,30))
$(eval $(call make-fig,10,31))
$(eval $(call make-fig,11,32))
$(eval $(call make-fig,12,33))
$(eval $(call make-fig,13,34))


define make-tab
tabs:: tab_$(1).pdf
clean::
	rm -f tab_$(1).pdf tab_$(1).log

tab_$(1).pdf:
	texexec  --pdfselect --selection=$(2) $(doc) --result=tab_$(1).pdf
endef

$(eval $(call make-tab,1,36))
$(eval $(call make-tab,2,37))
$(eval $(call make-tab,3,38))

files:= Rnl_R.pdf Rs_R.pdf Z.pdf calm.pdf dme.pdf errors.png et0.pdf.tex et0_fig.pdf insolation.pdf.tex insolation_fig.pdf ns.pdf process.pdf.tex process_fig.pdf rms.pdf.tex rms_fig.pdf rst_el.pdf rst_norm.pdf sacramento_dewp.pdf sacramento_max_at.pdf sacramento_min_at.pdf southcoast_dewp.pdf southcoast_max_at.pdf southcoast_min_at.pdf southvalley_dewp.pdf southvalley_max_at.pdf southvalley_min_at.pdf stations.pdf.tex stations_fig.pdf windy.pdf

hart05et-anc.zip:
	zip $@ $(files)