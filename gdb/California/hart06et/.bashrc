test -z  && . /etc/profile
test -r ~/.alias && . ~/.alias
umask 022
PROMPT_COMMAND='if test -f /home/quinn/projects/cimis/doc/hart06et/gdb/California/hart06et/cell/MASK ; then echo [Raster MASK present] ; fi'
PS1='GRASS 6.0.1 (California):\w > '
export GRASS_ADDON_PATH=/home/goes/bin
PATH=$PATH:$GRASS_ADDON_PATH

function cdm {
    eval `g.gisenv | sed -e 's/^/local /'`
    cd $GISDBASE/$LOCATION_NAME/$MAPSET;
}

#
# mapset changes your mapset withut leaving grass
#
function mapset { perl -i -p -e "s/^MAPSET:.*/MAPSET: $1/" ~/.grassrc5; }

#
# new_mapset - Adds a new mapset to the current location, and moves there
#
function new_mapset {
	local mapset=$1;
	local gisdbase=`g.gisenv GISDBASE`;
	local location=`g.gisenv LOCATION_NAME`;
	if [ -e $gisdbase/$location/$mapset ]; then
	    echo "mapset $mapset or something like it exists";
	else 
	    mkdir  $gisdbase/$location/$mapset;
	    cp $gisdbase/$location/PERMANENT/DEFAULT_WIND \
		$gisdbase/$location/$mapset/WIND;
	fi
	mapset $mapset;
}

#
# These are CIMIS specific site files.
#
function cimis.sites.pg { 
    eval `g.gisenv | sed -e 's/^/local /'`
    local sdir=$GISDBASE/$LOCATION_NAME/$MAPSET/site_lists
    [ -d $sdir ] || mkdir $sdir;
    local parm=$1;
    if [ -z $2 ]; then
	local date=`g.gisenv MAPSET`;
    else
	local date=$2;
    fi;
    psql -A -F'|' -t -c "select x(st_casil83),y(st_casil83),st_elevation*12/2.54/100,\
 '#'||st_number||' %'||$parm \
from station join daily using (st_number) \
where d_date='$date' and $parm is not null and ${parm}_qc is null \
order by st_number;" -h $PG_HOST -d $PG_DBASE > $sdir/$parm;
}


# End of grass.bashrc


export PATH="/usr/lib/grass/bin:/usr/lib/grass/scripts:/usr/local/bin:/usr/bin:/bin:/usr/bin/X11:/usr/games:"
export HOME="/home/quinn"
