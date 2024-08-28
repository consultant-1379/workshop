#!/bin/sh

####################################
#
# Ver1: Created for R6.2 TERE.
#
####################################

if [ "$#" -ne 1  ]
then
cat<<HELP

Usage: $0  <env file>"
 
Example: $0 SIM1.env  (to create RNC09)"

HELP
 exit 1
fi

ENV=$1

. ../../dat/$ENV


. utilityFunctions.sh


RBSVERSION=`getMimType $RNCCOUNT $RBSVERSIONARRAY`

SIMNAME=RBS-"$RBSVERSION"

PWD=`pwd`

MOSCRIPT=$0$".mo"
MMLSCRIPT=$0$".mml"

if [ -f $PWD/$MOSCRIPT ]
then
rm -r  $PWD/$MOSCRIPT
echo "old "$PWD/$MOSCRIPT " removed"
fi

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

echo ""
echo "MAKING MML SCRIPT"
echo ""

cat >> $MMLSCRIPT << MMLSCT

.open $SIMNAME 
.select RBS01 
.start  
useattributecharacteristics:switch="off"; 
.savenedatabase SAVE force 

MMLSCT

$NETSIMDIR/$NETSIMVERSION/netsim_pipe < $MMLSCRIPT

rm $PWD/$MMLSCRIPT

