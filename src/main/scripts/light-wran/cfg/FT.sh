#!/bin/sh

CFG=FT.cfg


START=1
STOP=26

COUNT=$START


while [ "$COUNT" -le "$STOP" ]
do

 if [ "$COUNT" -le 9 ]
 then
  RNC="IPRNC0"$COUNT
  RBS="IPRBS0"$COUNT
  RXI="IPRXI0"$COUNT
 else
  RNC="IPRNC"$COUNT
  RBS="IPRBS"$COUNT
  RXI="IPRXI"$COUNT
 fi

 RNCOFFSET=`expr $COUNT \* 104 - 103`
 RBSOFFSET=`expr $COUNT \* 104 - 102`
 RXIOFFSET=`expr $COUNT \* 104 - 2`  

echo $RNC"="$RNCOFFSET >> $CFG
echo $RBS"="$RBSOFFSET >> $CFG
echo $RXI"="$RXIOFFSET >> $CFG


COUNT=`expr $COUNT + 1`
done
