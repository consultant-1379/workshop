#!/bin/sh

if [ "$#" -ne 1 ]
then
 echo "This will create a simulation and the NEs as defined in the env file"
 echo
 echo "Usage: $0  <env file>"
 echo
 echo "Example: $0  SIM1.env"
 echo
 exit 1
fi


ENV=$1

. ../dat/$ENV
. utilityFunctions.sh

COUNT=$RNCSTART

while [ "$COUNT" -le "$RNCEND" ]
do

  RNCVERSION=`getMimType $COUNT $RNCVERSIONARRAY`
  SIMBASE="RNC"$(echo $RNCVERSION | awk -F"-" '{print $1}')"-ST"

  if [ "$COUNT" -le 9 ]
  then
    SIM=$SIMBASE"-RNC0"$COUNT
  else
    SIM=$SIMBASE"-RNC"$COUNT
  fi


  ./createSim.sh $SIM $ENV
  ./createRNCip.sh $SIM $ENV $COUNT 

  if [ "$CREATERBSNODES" == "YES" ]
  then 
    ./createRBSip.sh $SIM $ENV $COUNT 
  fi

  if [ "$CREATERXINODES" == "YES" ]  
  then
    if [ $COUNT -ge 1 ] && [ $COUNT -le 42 ]      
    then
      ./createRXIip.sh $SIM $ENV $COUNT 
    fi
  fi

  ./relateNEs.sh $SIM $ENV $COUNT


COUNT=`expr $COUNT + 1`
done
