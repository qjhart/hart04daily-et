d.rast state
d.rast Z@2km
r.shaded.relief --help
r.shaded.relief map=Z@2km shadedmap=shade
d.rast shate
d.rast shade
d.vect map=rms icon=basic/circle size=14 where="rms>0.2"
d.vect map=rms icon=basic/circle size=14 where="rms>0.2" color=black
d.vect map=rms icon=basic/circle size=14 where="rms>0.2" color=black bg=black
d.vect map=rms icon=basic/circle size=14 where="rms>0.2" color=black bcolor=black
d.vect map=rms icon=basic/circle size=14 where="rms>0.2" color=black bgcolor=black
d.vect map=rms icon=basic/circle size=10 where="rms>0.1" color=black bgcolor=black
d.vect map=rms icon=basic/circle size=6  color=black bgcolor=black
cd ../../../
ls
cd ..
cd ..
ls
ls -lrt 
make stations.asc
head stations.asc
rm stations.asc 
make stations.asc
head stations.asc
v.in.ascii out=stations x=2 y=3 z=5 cat=1  columns='station int, x double, y double, name char(40)' input=stations.asc
v.in.ascii out=stations x=2 y=3 z=5 cat=1  columns='station int, x double, y double, name char(40) elev double' input=stations.asc
g.remove vectd=stations
g.remove vect=stations
v.in.ascii out=stations x=2 y=3 z=5 cat=1  columns='station int, x double, y double, name char(40) elev double' input=stations.asc
v.in.ascii out=stations x=2 y=3 z=5 cat=1  columns='station int, x double, y double, name char(40), elev double' input=stations.asc
g.remove vect=stations
v.in.ascii out=stations x=2 y=3 z=5 cat=1  columns='station int, x double, y double, name char(40) elev double' input=stations.asc
v.in.ascii out=stations x=2 y=3 z=5 cat=1  columns='station int, x double, y double, name char(40), elev double' input=stations.asc
g.remove vect=stations
v.in.ascii out=stations x=2 y=3 z=5 cat=1  columns='station int, x double, y double, name char(40), elev double' input=stations.asc
v.in.ascii out=stations x=2 y=3 z=5 cat=1  columns='station int, x double, y double, name varchar(40), elev double' input=stations.asc
g.remove vect=stations
v.in.ascii out=stations x=2 y=3 z=5 cat=1  columns='station int, x double, y double, name varchar(40), elev double' input=stations.asc
d.erase
d.rast share
d.rast shade
d.vect stations where="elev>1000" icon=basic/circle size=14
d.vect stations where="elev>500" icon=basic/circle size=10
d.vect stations where="elev>250" icon=basic/circle size=6
d.vect stations icon=basic/circle size=2
d.vect stations icon=basic/circle size=4
d.vect stations where="elev>250" icon=basic/circle size=8
gqview station.png
ls 
ls -F
cd figs
ls
ls -lrt
ls
cd ..
ls
ls Z*
less elevation.pdf 
acroread elevation.pdf 
make Z.pdf
acroread Z>pdf
acroread Z.pdf
file Z.pdf
ls
rm Z.pdf
make Z.pdf
acroread Z.pdf
make 2003-06-18/nd_max_at_lr5_t10_s0_03.png
make 2003-06-18/nd_max_at_lr5_t10_s0_03.png
rm 2003-06-18/nd_max_at_lr* 
rm 2003-06-18/d_max_at_ns.png 
make -n figs
make figs
ls -lrt 2003-06-18/
gqview 2003-06-18/
rm 2003-06-18/d_max_at_ns.png 
make figs
gqview 2003-06-18/
mkdir -p 2003/06
mv 2003-06-18 2003/06/18
ls
mkdir -p 2003/12
mv 2003-12-21 2003/12/21
ls
ls
mkdir -p 2005/06/18
make figs
make figs
make figs
ls 2005/06/18
ls d_max_at_ns.png
ls 2005/06/18/nd_max_at_lr5_t10_s0_03.png
ls -l 2005/06/18/nd_max_at_lr5_t10_s0.03.png
ls -l 2005/06/18/nd_max_at_lr5_t10_s0.03.png

ls -l 2005/06/18/nd_max_at_lr5_t10_s0.03.png 
mv 2005/06/18/nd_max_at_lr5_t10_s0.03.png 2005/06/18/nd_max_at_lr5_t10_s0_03.png
rm -rf 2003*
ls
make 2005/12/21
mkdir 2005/12/21
mkdir -p 2005/12/21
make figs
xpdf print_lapse_rate.pdf
d.vect map=stations type=point display=shape icon=basic/x size=8 layer=1 color=black fcolor=gray llayer=1 lcolor=red bgcolor=none bcolor=none lsize=8 font=romans xref=left yref=center
d.vect map=stations type=point display=shape icon=basic/circle size=14 color=black fcolor=gray llayer=1 lcolor=red bgcolor=none bcolor=none lsize=8 font=romans where="elevation > 1000" xref=left yref=center
select * from stations | db.select
echo "select * from stations" | db.select
echo "select * from stations" | db.select | less
d.vect map=stations type=point display=shape icon=basic/circle size=14 color=black fcolor=gray llayer=1 lcolor=red bgcolor=none bcolor=none lsize=8 font=romans where="elev > 1000" xref=left yref=center
d.vect map=stations type=point display=shape icon=basic/circle size=14 color=black fcolor=white llayer=1 lcolor=red bgcolor=none bcolor=none lsize=8 font=romans where="elev > 1000" xref=left yref=center
d.vect map=stations type=point display=shape icon=basic/circle size=10 color=black fcolor=white llayer=1 lcolor=red bgcolor=none bcolor=none lsize=8 font=romans where="elev > 1000" xref=left yref=center
d.vect map=stations type=point display=shape icon=basic/circle size=14 color=black fcolor=white llayer=1 lcolor=red bgcolor=none bcolor=none lsize=8 font=romans where="elev > 1000" xref=left yref=center
d.vect map=stations type=point display=shape icon=basic/circle size=10 color=black fcolor=white llayer=1 lcolor=red bgcolor=none bcolor=none lsize=8 font=romans where="elev > 500" xref=left yref=center
d.vect map=stations type=point display=shape icon=basic/circle size=8 color=black fcolor=white llayer=1 lcolor=red bgcolor=none bcolor=none lsize=8 font=romans where="elev > 250" xref=left yref=center
d.vect map=stations type=point display=shape icon=basic/circle size=4 color=black fcolor=white llayer=1 lcolor=red bgcolor=none bcolor=none lsize=8 font=romans  xref=left yref=center
ls
ls -lrt
less stations.dm
ps.map --help
ps.map input=stations.dm scale=4in output=stations.eps
ps.map input=stations.dm  output=stations.eps
ls -lrt
mv staions.ps stations.ps
head stations.ps
xfig figs/stations.fig
bg 
ls -lrt sta*
rm stations.png
head stations.asc
ls
ls -lrt
ps2epsi --help
ps2ps --help
man ps2ps
man ps2epsi
ps2epsi stations.ps
ls -lrt
ls
make figs/stations.pdf_t
make figs/stations.pdf
make figs/stations_fig.pdf
make figs/stations.pdf.tex
acroread figs/stations_fig.pdf 
make Z.pdf
rm Z.pdf
make Z>pdf
make Z.pdf
rm pdf 
xpdf Z.pdf
less sr.dat
g.m
d.m
bg
g.list type=rast mapset=2006-03
r.info mc_et0_err_3
r.info mc_et0_err_3@2006-03
d.rast mc_et0_err_3@2006-03
d.what.rast
r.mapcalc 2006-03-err='if(mc_et0_err_3 < 100,mc_et0_err_3,null)'
r.mapcalc 2006_03_err='if(mc_et0_err_3 < 100,mc_et0_err_3,null)'
r.mapcalc 2006_03_err="if(mc_et0_err_3@'2006-03' < 100,mc_et0_err_3@'2006-03',null)"
r.mapcalc 2006_03_err="if('mc_et0_err_3@2006-03' < 100,mc_et0_err_3@'2006-03',null)"
r.mapcalc 2006_03_err="if('mc_et0_err_3@2006-03' < 100,'mc_et0_err_3@2006-03',null)"
r.mapcalc 2006_03_err="if('mc_et0_err_3@2006-03' < 100,'mc_et0_err_3@2006-03',NULL)"
r.mapcalc 2006_03_err="if('mc_et0_err_3@2006-03' < 100,'mc_et0_err_3@2006-03',null())"
d.rast 2006_03_err
d.what.rast
r.contour input=2006_03_err output=2006_03_err steps=0.5
r.contour input=2006_03_err output=2006_03_err step=0.5
r.contour input=2006_03_err output=err_2006_03 step=0.5
d.vect err_2006_03
select * from err_2006_03 | db.select | less
echo "select * from err_2006_03" | db.select | less
g.manual v.extract
v.info err_2006_03
v.clean
g.manual r.contour
bg
cd gdb
ls
cd California/
ls
scp qjhart@casil.ucdavis.edu:2005-06.tgz .
scp qjhart@casil.ucdavis.edu:2005-06.tgz .
ls
tar -tzf 2005-06.tgz 
tar -xzf 2005-06.tgz 
rm 2005-06.tgz 
g.list 
mapset 2005-06
g.list rast
g.mapset --help
g.mapset mapset=2005-06
g.list rast
d.mon start=x21
d.mon start=x1
d.rast et0
d.mon select=x0
d.rast mc_et0_err_3
r.info mc_et0_err_3
r.info et0
r.contour --help
r.contour input=mc_et0_err_3 output=err step=.5 cut=100
d.mon select=x1
d.vect err
v.clean --help
v.clean input=err output=foo tool=rmsa thres=1
v.clean input=err output=foo tool=rmsa thres=0
g.remove vect=foo
v.clean input=err output=foo tool=rmsa thres=0.1
g.remove vect=foo
v.clean input=err output=foo tool=rmsa 
g.remove vect=foo
v.clean input=err output=foo tool=rmsa thres=10
g.remove vect=foo
v.clean input=err output=foo tool=rmsa thres=-1
g.remove vect=foo
v.clean input=err output=foo tool=rmsa thres=0,-1
g.remove vect=foo
v.clean input=err output=foo tool=rmsa thres=0,0
v.clean input=err output=foo tool=rmsa thres=-0.4
v.clean
bg
g.remove vect=foo
g.remove vect=foo
g.remove vect=foo

v.clean input=err output=foo tool=rmsa thres=-0.4 type=line
v.clean input=err output=foo tool=rmsa thres=100 type=line
g.remove vect=foo
v.clean input=err output=foo tool=rmsa thres=100 type=line
echo "select * from err" | db.select
r.info mc_et0_err_3
r.contour input=mc_et0_err_3 output=err minlevel=0 step=.5 cut=100
g.remove vect=err
r.contour input=mc_et0_err_3 output=err minlevel=0 step=.5 cut=100
r.contour input=mc_et0_err_3 output=err minlevel=0 step=.25 cut=100
g.remove vect=err
r.contour input=mc_et0_err_3 output=err minlevel=0 step=.25 cut=100
v.label --help
d.vect err
d.vect width=2  err
d.m
ls-lrt
ls -lrt
v.label --help
v.label -a name=err type=line layer=level
v.label -a name=err type=line labels=level
v.label -a name=err type=line labels=level column=1
v.label -a map=err type=line coloumn=1 labels=level
v.label -a map=err type=line column=1 labels=level
v.label -a map=err type=line column=level labels=level
bg
gv ../../figs/errors.ps 
v.label  map=err type=line column=level labels=levels
d.labels --help
d.paint.labels --help
d.paint.labels labels=levels
d.paint.labels labels=levels minreg=2 maxreg=1000
d.paint.labels labels=levels minreg=2 maxreg=10000
d.paint.labels labels=levels minreg=2 maxreg=1000000

cdm
ls
cd paint/ls
cd paint/
ls
cd labels/
ls
file levels
less levels
less level
v.label  --help map=err type=line column=level labels=levels
v.label  --help map=err type=line column=level labels=levels size=1000
v.label map=err type=line column=level labels=levels size=1000
d.paint.labels labels=levels minreg=2 maxreg=1000000
d.paint.labels labels=levels
d.mon select=x1
v.label map=err type=line column=level labels=levels size=100000
d.paint.labels labels=levels
v.label map=err type=line column=level labels=levels size=10000
d.paint.labels labels=levels
d.erase
v.label map=err type=line column=level labels=levels size=10000
d.paint.labels labels=levels
v.label map=err type=line column=level labels=levels size=50000
d.paint.labels labels=levels
v.label map=err type=line column=level labels=levels size=20000
d.paint.labels labels=levels
d.erase
d.paint.labels labels=levels
v.label --help map=err type=line column=level labels=levels size=20000
v.label --help map=err type=line column=level labels=levels size=20000 font=helvetica
v.label map=err type=line column=level labels=levels size=20000 font=helvetica
d.paint.labels labels=levels
pwd
ls
emacs -nw levels
v.label -a map=err type=line column=level labels=a_levels size=20000 font=helvetica
fg
fg
echo "select * from err" | db.select
v.label --help

v.label --help | less
v.label --help 2>&1 | less
db.describe err
echo "ALTER TABLE roads ADD COLUMN length double" | db.execute
echo "ALTER TABLE err ADD COLUMN err decimal(5,2)" | db.execute
echo "ALTER TABLE err ADD COLUMN err decimal(5,2)" | db.execute
db.drivers
db.drivers --help
db.drivers -p
pwd
cd ..
ls
cd ..
ls
ls dbf
echo "ALTER TABLE err ADD COLUMN err float(5,2)" | db.execute
echo "ALTER TABLE err ADD COLUMN error float" | db.execute
echo "ALTER TABLE err ADD COLUMN error integer" | db.execute
echo "ALTER TABLE err DROP COLUMN error" | db.execute
echo "select * from err" | db.select
echo "update err set error=level*100" | db.execute
echo "update err set error=100" | db.execute
echo "update err set error=level" | db.execute
echo "update err set error=100*level" | db.execute
echo "update err set error=0 where level=0" | db.execute
echo "update err set error=25 where level=0.25" | db.execute
echo "update err set error=50 where level=0.5" | db.execute
echo "update err set error=75 where level=0.75" | db.execute

echo "select * from err" | db.select
r.contour input=mc_et0_err_3 output=err minlevel=0 step=.25 cut=50
g.remove vect=err
r.contour input=mc_et0_err_3 output=err minlevel=0 step=.25 cut=50
d.vect err
echo "select * from err" | db.select
v.info err
echo "select * from err" | db.select

v.info err
g.remove vect=err; r.contour input=mc_et0_err_3 output=err minlevel=0 step=.25 cut=50
v.info err
g.remove vect=err; r.contour input=mc_et0_err_3 output=err minlevel=0 step=.25 cut=25
v.info err
g.remove vect=err; r.contour input=mc_et0_err_3 output=err minlevel=0 step=.25 cut=50
v.info err
g.remove vect=err; r.contour input=mc_et0_err_3 output=err minlevel=0 step=.25 cut=100
v.info err
g.remove vect=err; r.contour input=mc_et0_err_3 output=err minlevel=0 step=.25 cut=75
v.info err
g.remove vect=err; r.contour input=mc_et0_err_3 output=err minlevel=0 step=.25 cut=50
v.info err
d.erase
v.label -a map=err type=line column=level labels=a_levels size=20000 font=helvetica
v.label map=err type=line column=level labels=levels size=20000 font=helvetica
d.vect err
v.label levels
d.paint.labels levels
d.paint.labels a_levels
d.erase

cd paint/labels/
ls
rm level
emacs levels
fg
d.erase
d.paint.labels levels

emacs levels
bg
gv ../../figs/errors.ps 
gv ~/projects/cimis/doc/hart06et/figs/errors.ps 
gv ~/projects/cimis/doc/hart06et/figs/errors.ps 
gv ~/projects/cimis/doc/hart06et/figs/errors.ps 
v.label -a map=err type=line column=level labels=a_levels size=40000 font=helvetica --help
v.label -a map=err type=line column=level labels=a_levels size=40000 font=helvetica space=40000 background=white
gv ~/projects/cimis/doc/hart06et/figs/errors.ps 

v.label -a map=err type=line column=level labels=a_levels size=40000 font=helvetica space=40000 background=white --help
v.label -a map=err type=line column=level labels=a_levels size=40000 font=helvetica space=40000 background=white xoffset=20000
v.label -a map=err type=line column=level labels=a_levels size=40000 font=helvetica space=40000 background=white
v.label -a map=err type=line column=level labels=a_levels size=40000 font=helvetica space=40000 background=white xoffset=10
gv ~/projects/cimis/doc/hart06et/figs/errors.ps 
g.remove vect=err; r.contour input=mc_et0_err_3 output=err minlevel=0 step=.25 cut=100
g.remove vect=err; r.contour input=mc_et0_err_3 output=err minlevel=0 step=.25 cut=50
g.remove vect=err; r.contour input=mc_et0_err_3 output=err_100 minlevel=0 step=.25 cut=100
v.label map=err_100 column=level labels=levels size=40000 font=helvetica
d.paint.labels levels
ls
perl -p -e 's/text: 0\.(..).*/text: .$1/' levels
perl -p -e 's/text: 0\.(..).*/text: .$1/' levels | grep text
perl -p -e 's/text: 0\.(..).*/text: .$1/' -e 's/text: 1\.(..).*/text: 1.$1/' levels | grep text

perl -p -i -e 's/text: 0\.(..).*/text: .$1/;' -e 's/text: 1\.(..).*/text: 1.$1/' levels | grep text
grep text levels
g.list vect
r.contour input=mc_et0_err_3 output=err minlevel=0 step=.25 cut=50
g.mapset mapset=2005-08
r.contour input=mc_et0_err_3 output=err minlevel=0 step=.25 cut=50
r.contour input=mc_et0_err_3 output=err_100 minlevel=0 step=.25 cut=100
d.mon select=x0
d.rast et0
cdm
d.vect err
d.vect err_100
d.erase
d.rast et0
d.vect err_100
r.contour input=mc_et0_err_3 output=err_100 minlevel=0 step=.5 cut=100
d.erase
d.rast et0
d.vect err_100
r.contour input=mc_et0_err_3 output=err_100 minlevel=0 step=1 cut=100
g.remove vect=err_100; r.contour input=mc_et0_err_3 output=err_100 minlevel=0 step=1 cut=100
d.erase
d.vect err_100
d.rast et0
d.vect err_100
g.remove vect=err_100; r.contour input=mc_et0_err_3 output=err_100 minlevel=0 step=0.5 cut=100
d.vect err_100
g.remove vect=err_200; r.contour input=mc_et0_err_3 output=err_100 minlevel=0 step=0.5 cut=200
g.remove vect=err_200; r.contour input=mc_et0_err_3 output=err_200 minlevel=0 step=0.5 cut=200

perl -p -i -e 's/text: 0\.(..).*/text: .$1/;' -e 's/text: 1\.(..).*/text: 1.$1/' levels | grep text
cd paint/labels/
ls
perl -p -i -e 's/text: 0\.(..).*/text: .$1/;' -e 's/text: 1\.(..).*/text: 1.$1/' levels | grep text
d.paint.labels levels

grep text levels
perl -p -i -e 's/text: 0\.(..).*/text: .$1/;' -e 's/text: 1.0/text: 1/' levels | grep text
grep text levels
g.remove vect=err; r.contour input=mc_et0_err_3 output=err_200 minlevel=0 step=0.5 cut=100
g.remove vect=err; r.contour input=mc_et0_err_3 output=err minlevel=0 step=0.5 cut=100
fg
bg
d.text --help
d.text
FOO
d.text -b at=50,50 size=50
echo "bar" | d.text -b at=50,50 size=25
g.list type=rast mapset=2km
d.mon stop=x1
g.manual r.random
d.legend --help
g.manual ps.map
d.m
bg
ls
ls -lrt
ls
cd ../../../
cd ..
cd ..
ls
ls -lrt
find . -name \*.png
ls
ls -lrt
find . -name \*.png
cd figs/
cp .././gdb/California/2005-08/paint/labels/map.png errors-2005-08.png
gqview errors-2005-08.png 
d.mon --help
    GRASS_WIDTH=500         GRASS_HEIGHT=550         GRASS_TRUECOLOR=TRUE         GRASS_BACKGROUND_COLOR=FFFFFF         GRASS_PNGFILE=$1         d.mon start=PNG 
GRASS_WIDTH=500 GRASS_HEIGHT=550 GRASS_TRUECOLOR=TRUE GRASS_BACKGROUND_COLOR=FFFFFF GRASS_PNGFILE=errors-2005-08.png d.mon start=PNG 
d.mon stop=PNG
ls
ls -lrt
GRASS_WIDTH=1500 GRASS_HEIGHT=1650 GRASS_TRUECOLOR=TRUE GRASS_BACKGROUND_COLOR=FFFFFF GRASS_PNGFILE=errors-2005-08.png d.mon start=PNG 
d.mon stop=PNG
ls -lrt
gqview 
g.manual i.pca
bg
d.m
bg
g.mapset mapset=hart06et
cdm
ls
cd cats
ls
ls -lrt
cat et0_n6
cat et0_n8
grep Sierra *
cd cats
d.legend --help
GRASS_WIDTH=1500 GRASS_HEIGHT=1650 GRASS_TRUECOLOR=TRUE GRASS_BACKGROUND_COLOR=FFFFFF GRASS_PNGFILE=classes.png d.mon start=PNG 
d.mon stop=PNG
ls
ls
ls -lrt
pwd
mv classes.png ../../../../monthly/
