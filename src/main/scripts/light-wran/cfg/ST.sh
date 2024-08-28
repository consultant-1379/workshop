#!/bin/sh

CFG=ST.cfg


START=1
STOP=70

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

 if [ "$COUNT" -le 32 ]
 then
  RNCOFFSET=`expr $COUNT \* 190 - 189`
  RBSOFFSET=`expr $COUNT \* 190 - 188`
  RXIOFFSET=`expr $COUNT \* 190 - 1`
 else
  RNCOFFSET=`expr $COUNT \* 771 - 19362`
  RBSOFFSET=`expr $COUNT \* 771 - 19361`
  RXIOFFSET=`expr $COUNT \* 771 - 18593`
 fi 

 if [ "$COUNT" -gt 34 ]
 then
  RNCOFFSET=`expr $COUNT \* 190 + 973`
  RBSOFFSET=`expr $COUNT \* 190 + 974`
  RXIOFFSET=`expr $COUNT \* 190 + 1161`
 fi


echo $RNC"="$RNCOFFSET >> $CFG
echo $RBS"="$RBSOFFSET >> $CFG
echo $RXI"="$RXIOFFSET >> $CFG


COUNT=`expr $COUNT + 1`
done
