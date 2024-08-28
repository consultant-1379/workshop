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

if [ "$#" -ne 1  ]
then
cat<<HELP

####################
# HELP
####################

Usage  : $0 <sim name> 

Example: $0 RNCM180-ST-RNC01 

HELP

exit
fi

SIM=$1

MMLSCRIPT=$0:$SIM".mml"

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
echo '.select network' >> $MMLSCRIPT
echo '.start -parallel' >> $MMLSCRIPT

#########################################
# 
# Run MML Script
#
#########################################

#echo ""
#echo "RUNNING MML SCRIPT"
#echo ""

CmdResult=`cat $MMLSCRIPT | /netsim/inst/netsim_pipe | tail -n1`

    if [ "$CmdResult" == "OK" ]
    then
      echo "$SIM:\".start -parallel\" command executed successfully."
    else
      echo -e "$SIM:WARNING!!\n"\
           #"No new simulation is created \n"\
           #"...exiting!! on `date`\n"\
           #"See the output \n"\
           "$SIM:ERROR_OUTPUT: $CmdResult"
       rm $PWD/$MMLSCRIPT
       exit 123
    fi


#/netsim/inst/netsim_pipe < $MMLSCRIPT

rm $PWD/$MMLSCRIPT
