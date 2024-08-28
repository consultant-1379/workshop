#!/bin/sh

if [ "$#" -ne 3 ]
then
 echo
 echo "Usage: $0 <sim name> <env file> <count>"
 echo
 echo "Example: $0 RNCJ30-ST-RNC01 SIM1.env 1"
 echo
 exit 1
fi

SIM=$1
ENV=$2
COUNT=$3

# Initilize the allBGP
#echo "" &
#allBGP=$!

. ../dat/$ENV
. utilityFunctions.sh

echo "//"
echo "//..$SIM:$0 started at `date`" | tee -a $LOGFILE


cd $SIMDIR/bin/$PICODIR


#1 sh: no transport
#2 sh: IP transport
#3 sh: ATM transport

./runScripts.sh $SIM $ENV $COUNT 1 | tee -a $SIMDIR"/log/"$SIM"-PICO-1.log"

#### Transport will be inserted here
#
#if [ "$TRANSPORT" == "YES" ]
#then
#  echo "" 
#  echo "$SIM:RBS TRANSPORT LAYER CREATION STARTED at "`date` | tee -a $SIMDIR"/log/"$SIM"-RBS-Transport.log"
#  echo ""  | tee -a $SIMDIR"/log/"$SIM"-RBS-Transport.log"
#
#  cd $SIMDIR/bin/
#  ./createRBS_Transport_Data.sh $SIM $ENV $COUNT | tee -a $SIMDIR"/log/"$SIM"-RBS-Transport.log"
#  cd $SIMDIR/bin/$RBSDIR
#
#  echo "" | tee -a $SIMDIR"/log/"$SIM"-RBS-Transport.log"
#  echo "  $SIM: RBS TRANSPORT LAYER CREATION ENDED at "`date` | tee -a $SIMDIR"/log/"$SIM"-RBS-Transport.log"
#  echo "" | tee -a $SIMDIR"/log/"$SIM"-RBS-Transport.log"
#fi

#cd $SIMDIR/bin
#./stopNEs.sh $SIM '.*RBS.*'  | tee -a $SIMDIR"/log/"$SIM"-RBS-1.log"

echo "//"
echo "//..$SIM:$0 ended at `date`" | tee -a $LOGFILE

