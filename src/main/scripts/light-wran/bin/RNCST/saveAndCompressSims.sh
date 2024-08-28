#!/bin/sh

# Created by  : qfatonu
# Created in  : 02 Mar 10
##
### VERSION HISTORY
# Ver1        : Created for WRAN deployment o.10.2.4, req id:3425
# Purpose     : 
# Description : 
# Date        : 02.03.2010
# Who	      : Fatih ONUR

if [ "$#" -ne 1  ]
then
cat<<HELP

Usage: $0 <rnc num>

Example: $0 9 (run script for RNC09-ST-...)

DESC   :

CONFIG : Following variables can be set within scripts
         

HELP
 exit 1
fi


if [ "$1" -le 9 ]
then
RNCNAME="RNC0"$1
RNCCOUNT="0"$1
else
RNCNAME="RNC"$1
RNCCOUNT=$1
fi

#if [ "$RNCCOUNT" -eq 33 ] || [ "$RNCCOUNT" -eq 34 ]
#then
#NUMOFRBS=768
#echo "NUMOFRBS=768"
#else
#NUMOFRBS=187
#echo "NUMOFRBS=187"
#fi

PWD=`pwd`

if [ ! -f $PWD/$0 ]
then
PWD=""
fi
NOW=`date +"%Y_%m_%d_%T:%N"`

max=1000000
RANDOM=$((`cat /dev/urandom|od -N1 -An -i` % $max))

MMLSCRIPT=$0${NOW}:$$:${RANDOM}:$RNCNAME".mml"


if [ -f $PWD/$MMLSCRIPT ]
then
rm -r  $PWD/$MMLSCRIPT
echo "old "$PWD/$MMLSCRIPT " removed"
fi

SIMNAME=`ls /netsim/netsimdir | egrep ${RNCNAME} | grep ST | grep -m1 -v zip`


echo ""
echo "MAKING MO SCRIPT"
echo ""


#########################################
#
# Make MML Script
#
#########################################

echo ""
echo "MAKING MML SCRIPT"
echo ""


echo '.open '$SIMNAME >> $MMLSCRIPT
#echo '.saveandcompress '$SIM' force' >> $MMLSCRIPT
echo '.saveandcompress '$SIM' noforce nopmdata' >> $MMLSCRIPT

 /netsim/inst/netsim_shell < $MMLSCRIPT

rm $PWD/$MMLSCRIPT

