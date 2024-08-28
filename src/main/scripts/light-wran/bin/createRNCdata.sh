#!/bin/sh

# Created by  : unknown
# Created in  : unknown
##
### VERSION HISTORY
# Ver2        : Moddified for TERE 10.2
# Purpose     :
# Description :
# Date        : 10 02 2010
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

. ../dat/$ENV
. utilityFunctions.sh

echo "//"
echo "//..$SIM:$0 started at `date`" | tee -a $LOGFILE


# Initilize the allBGP
echo "" &
allBGP=$!


cd $SIMDIR/bin/$RNCDIR


if [ "$COUNT" -le 9 ]
then
 RNCNAME="RNC0"$3
else
 RNCNAME="RNC"$3
fi


#1sh no transport
#2sh IP
#3sh ATM

#./runScripts.sh $SIM $ENV $COUNT 1 | tee -a $SIMDIR"/log/"$SIM"-RNC-1.log"  
./1000createRadioNetworkForRNC.sh $SIM $ENV $COUNT 2>&1 | tee -a $SIMDIR"/log/"$SIM"-RNC-1.log"  


#### Transport will be inserted here
#
#if [ "$TRANSPORT" == "YES" ]
#then
#  echo "" 
#  echo "$SIM: RNC TRANSPORT LAYER CREATION STARTED at "`date` | tee -a $SIMDIR"/log/"$SIM"-RNC-Transport.log"
#  echo "" | tee -a $SIMDIR"/log/"$SIM"-RNC-Transport.log"
#
#  cd $SIMDIR/bin/
#  ./createRNC_Transport_Data.sh $SIM $ENV $COUNT | tee -a $SIMDIR"/log/"$SIM"-RNC-Transport.log"
#  cd $SIMDIR/bin/$RNCDIR
#
#  echo "" | tee -a $SIMDIR"/log/"$SIM"-RNC-Transport.log"
#  echo "$SIM: RNC TRANSPORT LAYER CREATION ENDED at "`date` | tee -a $SIMDIR"/log/"$SIM"-RNC-Transport.log"
#  echo "" | tee -a $SIMDIR"/log/"$SIM"-RNC-Transport.log"
#fi



#cd $SIMDIR/bin
#./stopNEs.sh $SIM $RNCNAME | tee -a $SIMDIR"/log/"$SIM"-RNC-1.log"

echo "//"
echo "//..$SIM:$0 end at `date`" | tee -a $LOGFILE

