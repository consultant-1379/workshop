#!/bin/sh

# Created by  : unknown
# Created in  : unknown
##
### VERSION HISTORY
###########################################
# Ver2        : Moddified for TERE 10.2
# Purpose     :
# Description :
# Date        : 10 02 2010
# Who         : Fatih ONUR
###########################################
# Ver3        : Moddified for TERE 11.2
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

Usage  : $0 <env file>

Example: $0 R7-ST-N-N.env 

HELP

exit
fi

ENV=$1

. ../dat/$ENV


COUNT=$RNCSTART

while [ "$COUNT" -le "$RNCEND" ]
do

if [ "$COUNT" -le 9 ]
then
 SIM=$SIMBASE"-RNC0"$COUNT
else
 SIM=$SIMBASE"-RNC"$COUNT
fi

 ./createRNCdata.sh $SIM $ENV $COUNT 
 ./createRBSdata.sh $SIM $ENV $COUNT 

 if !(([ $COUNT -ge 23 ] && [ $COUNT -le 82 ]) || [ $COUNT -eq 83 ]) # Modified for TERE 10.2 changed from 23 to 21
 then
  ./createRXIdata.sh SIM $ENV $COUNT 
 fi


 ./saveAndCompressSimulation.sh $SIM $ENV 
 ./ftp.sh $SIM $ENV 

COUNT=`expr $COUNT + 1`
done
