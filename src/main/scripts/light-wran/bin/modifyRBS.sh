#!/bin/sh

if [ "$#" -ne 1 ]
then
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

PWD="$SIMDIR/log/"

LOGFILE="$PROJECT-OverlaidCells.txt"

if [ -f $PWD/$LOGFILE ]
then
rm -r  $PWD/$LOGFILE
echo "old $PWD/$LOGFILE removed"
fi


RNCSTART=1
RNCEND=83

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
	
  echo "SIM="$SIM
  cd $SIMDIR/bin/$RBSDIR
   #./1201createCarrier.sh $SIM $ENV $COUNT |  tee -a $SIMDIR"/log/$LOGFILE"
   ./1240createCabinet.sh $SIM $ENV $COUNT |  tee -a $SIMDIR"/log/$LOGFILE"
  cd $SIMDIR/bin/


COUNT=`expr $COUNT + 1`
done

