#!/bin/sh


if [ "$#" -ne 3  ]
then
 echo
 echo "Usage: $0 <sim name> <env file> <nename>"
 echo
 echo "Example: $0 WegaC5LargeRNC14 SIM1.env RNC01"
 echo
 exit 1
fi



SIM=$1
ENV=$2
NENAME=$3

MMLSCRIPT=$0".mml"

PWD=`pwd`

. ../dat/$ENV


if [ -f $PWD/$MMLSCRIPT ]
then
rm   $PWD/$MMLSCRIPT
echo "old "$PWD/$MMLSCRIPT " removed"
fi

#########################################
# 
# Make MML Script
#
#########################################


echo '.open '$SIM >> $MMLSCRIPT
echo '.select '$NENAME >> $MMLSCRIPT
echo '.start' >> $MMLSCRIPT
echo 'e: mmldb:fold(fun({{mo,_},_},N)->N+1; (_,N) -> N end, 0).' >> $MMLSCRIPT
echo '.stop' >> $MMLSCRIPT

#########################################
# 
# Run MML Script
#
#########################################

echo ""
echo "RUNNING MML SCRIPT"
echo ""



$NETSIMDIR/$NETSIMVERSION/netsim_pipe < $MMLSCRIPT



rm $PWD/$MMLSCRIPT
