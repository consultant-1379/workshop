#!/bin/sh


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

. ../utilityFunctions.sh


PWD=`pwd`
NOW=`date +"%Y_%m_%d_%T:%N"`

max=1000000
RANDOM=$((`cat /dev/urandom|od -N1 -An -i` % $max))

MOSCRIPT=$0${NOW}:$$${RANDOM}".mo"
MMLSCRIPT=$0${NOW}:$$${RANDOM}".mml"

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

NUMOFRBS=`getNumOfRBS $RNCCOUNT $RNCRBSARRAY $RBSCELLARRAY`

COUNT=1
TEMP=1
X=25
Y=1
while [ "$COUNT" -le "$NUMOFRBS" ]
do

if [ "$Y" -eq 9 ]
then
Y=1
X=`expr $X + 1`
fi


 COUNT2=1
 while [ "$COUNT2" -le 10 ]
 do

 ID=RBS-"$COUNT"-"$COUNT2"

 RBSATM='ManagedElement=1,TransportNetwork=1,AtmPort=MS-'$X'-'$Y',VplTp=Vp'$COUNT',VpcTp=1'
 RNCATM='ManagedElement=1,TransportNetwork=1,AtmPort=MS-24-'$TEMP',VplTp=Vp'$COUNT',VpcTp=1'

 case "$COUNT2" 
 in 
  1) VCLAID='"'$RNCATM',VclTp=vc31-RNC-RBS'$COUNT'"' ; VCLBID='"'$RBSATM',VclTp=vc31-RBS'$COUNT'"' ;;
  2) VCLAID='"'$RNCATM',VclTp=vc32-RNC-RBS'$COUNT'"' ; VCLBID='"'$RBSATM',VclTp=vc32-RBS'$COUNT'"' ;; 
  3) VCLAID='"'$RNCATM',VclTp=vc33-RNC-RBS'$COUNT'"' ; VCLBID='"'$RBSATM',VclTp=vc33-RBS'$COUNT'"' ;;
  4) VCLAID='"'$RNCATM',VclTp=vc34-RNC-RBS'$COUNT'"' ; VCLBID='"'$RBSATM',VclTp=vc34-RBS'$COUNT'"' ;;
  5) VCLAID='"'$RNCATM',VclTp=vc35-RNC-RBS'$COUNT'"' ; VCLBID='"'$RBSATM',VclTp=vc35-RBS'$COUNT'"' ;;
  6) VCLAID='"'$RNCATM',VclTp=vc36-RNC-RBS'$COUNT'"' ; VCLBID='"'$RBSATM',VclTp=vc36-RBS'$COUNT'"' ;;
  7) VCLAID='"'$RNCATM',VclTp=vc37-RNC-RBS'$COUNT'"' ; VCLBID='"'$RBSATM',VclTp=vc37-RBS'$COUNT'"' ;;
  8) VCLAID='"'$RNCATM',VclTp=vc38-RNC-RBS'$COUNT'"' ; VCLBID='"'$RBSATM',VclTp=vc38-RBS'$COUNT'"' ;;
  9) VCLAID='"'$RNCATM',VclTp=vc39-RNC-RBS'$COUNT'"' ; VCLBID='"'$RBSATM',VclTp=vc39-RBS'$COUNT'"' ;;
  10) VCLAID='"'$RNCATM',VclTp=vc42-RNC-RBS'$COUNT'"' ; VCLBID='"'$RBSATM',VclTp=vc42-RBS'$COUNT'"' ;;
 esac


echo 'SET' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  mo "ManagedElement=1,TransportNetwork=1,AtmCrossConnection='$ID'"' >> $MOSCRIPT
echo '   identity '$ID >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 2' >> $MOSCRIPT
echo '   vclTpAId Ref '$VCLAID >> $MOSCRIPT
echo '   vclTpBId Ref '$VCLBID >> $MOSCRIPT
echo ')' >> $MOSCRIPT

COUNT2=`expr $COUNT2 + 1`
done

Y=`expr $Y + 1`


REM=`expr $COUNT % 126`
if [ "$REM" -eq 0 ]
then
 TEMP=`expr $TEMP + 1`
fi


COUNT=`expr $COUNT + 1`
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

