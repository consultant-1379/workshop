#!/bin/sh

####################################
#
# Ver1: Created for R6.2 TERE.
#
####################################

if [ "$#" -ne 3  ]
then
cat<<HELP

#######################################################################
#                                                                     #
#                             HELP                                    #
#                                                                     #
#######################################################################

Usage  : $0 <sim name> <env file> <rnc num>

Example: $0 WegaC5LargeRNC14 SIM1.env 9 (to create RNC09)

CREATE :-

SET    :-

DELETE :-

HELP
 exit 1
fi

SIMNAME=$1
ENV=$2

if [ "$3" -le 9 ]
then
RNCNAME="RNC0"$3
RNCCOUNT="0"$3
else
RNCNAME="RNC"$3
RNCCOUNT=$3
fi

. ../../dat/$ENV

. utilityFunctions.sh


PWD=`pwd`

MOSCRIPT=$0$$".mo"
MMLSCRIPT=$0$$".mml"

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


RBSVERSION=`getMimType $RNCCOUNT $RBSVERSIONARRAY`


RBSNES='.*RBS.*'

cat >> $MMLSCRIPT << MMLSCT

.open $SIMNAME 
.selectregexp simne $RBSNES
.start  
useattributecharacteristics:switch="off"; 
.restorenedatabase $NETSIMDIR/netsimdir/RBS-$RBSVERSION/saved/dbs/SAVE_RBS01 

MMLSCT

$NETSIMDIR/$NETSIMVERSION/netsim_pipe < $MMLSCRIPT

rm $PWD/$MMLSCRIPT

