#!/bin/bash


START=1
END=106

REPORTFILENAME="rbs6KReportForO13-ST-13A-40K.txt"
if [ -f $REPORTFILENAME ]
then
  rm $REPORTFILENAME
  echo "Existing $REPORTFILENAME deleted!!!"
fi

SIMNAME="RNCS1100-ST-RNC01"
ENV="O13-ST-13A-40K.env"

COUNT=$START
while [ "$COUNT" -le $END ]
do

  ./test_aOut1240createCabinet.sh $SIMNAME $ENV $COUNT >> $REPORTFILENAME

  COUNT=`expr $COUNT + 1`
done


