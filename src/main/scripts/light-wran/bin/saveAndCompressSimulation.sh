#!/bin/sh


if [ "$#" -ne 2  ]
then
 echo
 echo "Usage: ./saveAndCompressSimulation.sh <sim name> <env file>"
 echo
 echo "Example: ./saveAndCompressSimulation.sh WegaC5LargeRNC14 WendyF.env"
 echo 
 exit 1
fi

. ../dat/$2

SIM=$1
STOP=$3

NOW=`date +"%Y_%m_%d_%T:%N"`

MMLSCRIPT=$0:${NOW}:$SIM".mml"


PWD=`pwd`

if [ -f $PWD/$MMLSCRIPT ]
then
rm -r  $PWD/$MMLSCRIPT
echo "old "$PWD/$MMLSCRIPT " removed"
fi


#########################################
# 
# Make MML Script
#
#########################################


echo '.open '$SIM >> $MMLSCRIPT

if [ "$STOP" == "STOP" ]
then
  echo '.select network' >> $MMLSCRIPT
  echo '.stop' >> $MMLSCRIPT
fi
#echo '.saveandcompress force' >> $MMLSCRIPT

echo '.saveandcompress force nopmdata' >> $MMLSCRIPT

#########################################
# 
# Run MML Script
#
#########################################

#echo ""
#echo "RUNNING MML SCRIPT"
#echo ""

 /netsim/inst/netsim_shell < $MMLSCRIPT

rm $PWD/$MMLSCRIPT
