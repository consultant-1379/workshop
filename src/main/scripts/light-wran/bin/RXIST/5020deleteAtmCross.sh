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

COUNT=1


while [ "$COUNT" -le "85" ]
do

 COUNT2=1
 while [ "$COUNT2" -le 13 ]
 do

 echo 'SET' >> $MOSCRIPT
 echo '(' >> $MOSCRIPT
 echo ' mo "ManagedElement=1,TransportNetwork=1,AtmCrossConnection=RBS-'$COUNT'-'$COUNT2'"' >> $MOSCRIPT
 echo ' exception none' >> $MOSCRIPT
 echo ' nrOfAttributes 2' >> $MOSCRIPT
 echo ' vclTpAId Ref null' >> $MOSCRIPT
 echo ' vclTpBId Ref null' >> $MOSCRIPT
 echo ')' >> $MOSCRIPT

 echo 'DELETE' >> $MOSCRIPT
 echo '(' >> $MOSCRIPT
 echo ' mo "ManagedElement=1,TransportNetwork=1,AtmCrossConnection=RBS-'$COUNT'-'$COUNT2'"' >> $MOSCRIPT
 echo ')' >> $MOSCRIPT

 COUNT2=`expr $COUNT2 + 1`
 done



 COUNT=`expr $COUNT + 1`
done



##########################################
#
# AtmPort for RBSs
#
##########################################



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





































