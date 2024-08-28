#!/bin/sh

# Created by  : Fatih ONUR
# Created in  : 07 04 2011
##
### VERSION HISTORY
###########################################
# Ver1        : Moddified for TERE 11.2
# Purpose     : To create sims faster
# Description :
# Date        : 07 04 2011
# Who         : Fatih ONUR
###########################################

if [ "$#" -ne 2 ]
then
cat<<HELP

####################
# HELP
####################

Usage  : $0 <sim name> <NesName_RegExpr>

Example: $0 RNCM180-ST-RNC01 '.*RBS.*'

HELP

exit
fi


SIM=$1
NESNAME_REGEXPR=$2

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


echo "//..$0:$SIM $NESNAME_REGEXPR started at `date` "
echo "//"

echo '.open '$SIM >> $MMLSCRIPT
echo '.selectregexp simne '$NESNAME_REGEXPR >> $MMLSCRIPT
echo '.stop' >> $MMLSCRIPT


#########################################
# 
# Run MML Script
#
#########################################


/netsim/inst/netsim_pipe < $MMLSCRIPT

rm $PWD/$MMLSCRIPT

echo "//..$0:$SIM $NESNAME_REGEXPR ended at `date` "
