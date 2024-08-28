#!/bin/sh

# Created by  : Fatih ONUR
# Created in  : 18.07.2012
##
### VERSION HISTORY
# Ver1        : Created for WRAN TERE 13A
# Purpose     : ICON configuration
# Description : Assume that simulation is no transport and some dependent MOs are already created during radio n/w setup
#                 Script is tested against no transport simulation (after 1's series script run against nodes)
#		  In the case of error please check 1's series script run properly
# Date        : 19 JUL 2012
# Who         : Fatih ONUR

if [ "$#" -ne 3  ]
then
cat<<HELP

####################
# HELP
####################

Usage  : $0 <sim name> <env file> <rnc num>

Example: $0 RNCL130-ST-RNC01 R7-ST-G-N.env 1

HELP

exit
fi

################################
# MAIN
################################

SIMNAME=$1
ENV=$2
RNCIDCOUNT=$3


if [ "$RNCIDCOUNT" -le 9 ]
then
  RNCNAME="RNC0"$RNCIDCOUNT
  RNCCOUNT="0"$RNCIDCOUNT
else
  RNCNAME="RNC"$RNCIDCOUNT
  RNCCOUNT=$RNCIDCOUNT
fi

if [ "$RNCIDCOUNT" -eq 0 ]
then
  RNCNAME=
fi

echo "//...$0:$SIMNAME script started running at "`date`
echo "//"

echo "//..$0:$SIMNAME This is a placeholder script do nothing"

echo "//"
echo "//...$0:$SIMNAME script ended at "`date`
echo "//"

exit


. ../../dat/$ENV
. ../utilityFunctions.sh

FILE=../$ICONCONFIGFILE


PWD=`pwd`
NOW=`date +"%Y_%m_%d_%T:%N"`

max=1000000
RANDOM=$((`cat /dev/urandom|od -N1 -An -i` % $max))

MOSCRIPT=$0${NOW}:$$${RANDOM}".mo"
MMLSCRIPT=$0${NOW}:$$${RANDOM}".mml"


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
# Make MO Script
#
#########################################



