#!/bin/sh


#
# Delete Northbound & Soundbound VplTp MOs (first 80 RBSs)
#



if [ "$#" -ne 3  ]
then
 echo
 echo "Usage: $0 <sim name> <env file> <rnc num>"
 echo
 echo "Example: $0 WegaC5LargeRNC14 SIM1.env 9 (to create RNC09)"
 echo
 exit 1
fi




SIMNAME=$1
ENV=$2


if [ "$3" -le 9 ]
then
RNCNAME="RNC0"$3
RNCCOUNT="0"$3
else
RNCNAME="RNC"$3
RNCCOUNT=$3
fi


. ../../dat/$ENV


PWD=`pwd`
NOW=`date +"%Y_%m_%d_%T:%N"`


MOSCRIPT=$0${NOW}".mo"
MMLSCRIPT=$0${NOW}".mml"

if [ -f $PWD/$MOSCRIPT ]
then
rm -r  $PWD/$MOSCRIPT
echo "old "$PWD/$MOSCRIPT " removed"
fi


if [ -f $PWD/$MMLSCRIPT ]
then
rm -r  $PWD/$MMLSCRIPT
echo "old "$PWD/$MMLSCRIPT " removed"
fi



#########################################
# 
# Make MO Script
#
#########################################

echo ""
echo "MAKING MO SCRIPT"
echo ""


##########################################
#
# AtmPort for RNC
#
##########################################


COUNT1=25
COUNTER=1

while [ "$COUNT1" -le "34" ]
do


 COUNT2=1
 while [ "$COUNT2" -le "8" ]
 do


 COUNT3=1
 while [ "$COUNT3" -le "17" ]
 do


 case "$COUNT3"
 in 
  1) VCLTPREF="vc32-x-RBS"$COUNTER ;;
  2) VCLTPREF="vc32-x-RNC-RBS"$COUNTER ;;
  3) VCLTPREF="vc33-x-RBS"$COUNTER ;;
  4) VCLTPREF="vc33-x-RNC-RBS"$COUNTER ;;
  5) VCLTPREF="vc34-RBS"$COUNTER ;;
  6) VCLTPREF="vc34-x-RBS"$COUNTER ;;
  7) VCLTPREF="vc34-x-RNC-RBS"$COUNTER ;;
  8) VCLTPREF="vc35-RBS"$COUNTER ;;
  9) VCLTPREF="vc35-x-RBS"$COUNTER ;;
 10) VCLTPREF="vc35-x-RNC-RBS"$COUNTER ;;
 11) VCLTPREF="vc36-RBS"$COUNTER ;;
 12) VCLTPREF="vc37-RBS"$COUNTER ;;
 13) VCLTPREF="vc38-RBS"$COUNTER ;;
 14) VCLTPREF="vc39-RBS"$COUNTER ;;
 15) VCLTPREF="vc43-RBS"$COUNTER ;;
 16) VCLTPREF="vc44-RBS"$COUNTER ;;
 17) VCLTPREF="vc45-RBS"$COUNTER ;;
 esac

 echo 'SET' >> $MOSCRIPT
 echo '(' >> $MOSCRIPT
 echo ' mo "ManagedElement=1,TransportNetwork=1,AtmPort=MS-'$COUNT1'-'$COUNT2',VplTp=Vp'$COUNTER',VpcTp=1,VclTp='$VCLTPREF'"' >> $MOSCRIPT
 echo ' exception none' >> $MOSCRIPT
 echo ' nrOfAttributes 1' >> $MOSCRIPT
 echo ' reservedBy Ref null' >> $MOSCRIPT
 echo ')' >> $MOSCRIPT


 COUNT3=`expr $COUNT3 + 1`
 done

 echo 'DELETE' >> $MOSCRIPT
 echo '(' >> $MOSCRIPT
 echo 'mo "ManagedElement=1,TransportNetwork=1,AtmPort=MS-'$COUNT1'-'$COUNT2',VplTp=Vp'$COUNTER'"' >> $MOSCRIPT
 echo ')' >> $MOSCRIPT

 COUNT2=`expr $COUNT2 + 1`
 COUNTER=`expr $COUNTER + 1`
 done


COUNT1=`expr $COUNT1 + 1`
done



#########################################
#
# Make MML Script
#
#########################################

echo ""
echo "MAKING MML SCRIPT"
echo ""


COUNT=1

while [ "$COUNT" -le "$NUMOFRXI"  ]
do
echo '.open '$SIMNAME >> $MMLSCRIPT
echo '.select '$RNCNAME'RXI0'$COUNT >> $MMLSCRIPT
echo '.start ' >> $MMLSCRIPT
echo 'useattributecharacteristics:switch="off";' >> $MMLSCRIPT
echo 'kertayle:file="'$PWD'/'$MOSCRIPT'";' >> $MMLSCRIPT
COUNT=`expr $COUNT + 1`
done





$NETSIMDIR/$NETSIMVERSION/netsim_pipe < $MMLSCRIPT



rm $PWD/$MOSCRIPT
rm $PWD/$MMLSCRIPT





































