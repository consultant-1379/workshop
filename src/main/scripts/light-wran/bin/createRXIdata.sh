#!/bin/bash

# Created by  : unknown
# Created in  : unknown
##
### VERSION HISTORY
# Ver2        : Moddified for TERE 10.2
# Purpose     :
# Description :
# Date        : 10 Feb 2010
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


SIM=$1
ENV=$2
COUNT=$3


echo "//"
echo "//..$SIM:$0 started at `date`" | tee -a $LOGFILE


. ../dat/$ENV
. utilityFunctions.sh


cd $SIMDIR/bin/$RXIDIR


#1 sh : no transport
#2 sh : AAl2 switched
#3 sh : Cross Connected

./runScripts.sh $SIM $ENV $COUNT 1 | tee -a $SIMDIR"/log/"$SIM"-RXI-1.log"

#### Transport will be inserted here
#
#if [ "$TRANSPORT" == "YES" ]
#then
#
#  if [ "$COUNT" -ge 4 ] && [ "$COUNT" -le 22 ]
#  then
#    ./runScripts1.sh $SIM $ENV $COUNT  | tee -a $SIMDIR"/log/"$SIM"-RXI-2.log"
#  else if [ "$COUNT" -ge 23 ] && [ "$COUNT" -le 42 ] 
#  then
#    #echo "pass2"
#    ./runScripts2.sh $SIM $ENV $COUNT | tee -a $SIMDIR"/log/"$SIM"-RXI-3.log"
#  fi
#  fi
#
#fi

#cd $SIMDIR/bin
#./stopNEs.sh $SIM '.*RXI.*' | tee -a $SIMDIR"/log/"$SIM"-RXI-1.log"

echo "//"
echo "//..$SIM:$0 ended at `date`" | tee -a $LOGFILE

