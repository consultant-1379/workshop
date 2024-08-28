#!/bin/sh


if [ "$#" -ne 2  ]
then
cat << HELP

#######################################################################
#                                                                     #
#                             HELP                                    #
#                                                                     #
#######################################################################

Usage: ./saveAndCompressSimulation.sh <sim name> <env file>

Example: ./saveAndCompressSimulation.sh WegaC5LargeRNC14 WendyF.env

HELP
 
 exit 1
fi

. ../dat/$2

SIM=$1

MMLSCRIPT=$0$$".mml"

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

cat >> $MMLSCRIPT << MMLSCT

.open $SIM 
.select network
.stop
.saveandcompress $SIM force

MMLSCT

#########################################
# 
# Run MML Script
#
#########################################

echo ""
echo "RUNNING MML SCRIPT"
echo ""

$NETSIMDIR/$NETSIMVERSION/netsim_shell < $MMLSCRIPT

rm $PWD/$MMLSCRIPT
