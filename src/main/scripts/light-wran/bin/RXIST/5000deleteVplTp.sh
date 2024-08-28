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

 case "$COUNT2"
 in 
 1)   VCLTPREF=vc32-x-RNC-RBS$COUNT;;
 2)   VCLTPREF=vc33-x-RNC-RBS$COUNT;;
 3)   VCLTPREF=vc34-RNC-RBS$COUNT;;
 4)   VCLTPREF=vc34-x-RNC-RBS$COUNT;;
 5)   VCLTPREF=vc35-RNC-RBS$COUNT;;
 6)   VCLTPREF=vc35-x-RNC-RBS$COUNT;;
 7)   VCLTPREF=vc36-RNC-RBS$COUNT;;
 8)   VCLTPREF=vc37-RNC-RBS$COUNT;;
 9)   VCLTPREF=vc38-RNC-RBS$COUNT;;
 10)  VCLTPREF=vc39-RNC-RBS$COUNT;;
 11)  VCLTPREF=vc43-RNC-RBS$COUNT;;
 12)  VCLTPREF=vc44-RNC-RBS$COUNT;;
 13)  VCLTPREF=vc45-RNC-RBS$COUNT;;
 esac

 echo 'SET' >> $MOSCRIPT
 echo '(' >> $MOSCRIPT
 echo ' mo "ManagedElement=1,TransportNetwork=1,AtmPort=MS-24-1,VplTp=Vp'$COUNT',VpcTp=1,VclTp='$VCLTPREF'"' >> $MOSCRIPT
 echo ' exception none' >> $MOSCRIPT
 echo ' nrOfAttributes 1' >> $MOSCRIPT
 echo ' reservedBy Ref null' >> $MOSCRIPT
 echo ')' >> $MOSCRIPT

 COUNT2=`expr $COUNT2 + 1`
done

 echo 'DELETE' >> $MOSCRIPT
 echo '(' >> $MOSCRIPT
 echo 'mo "ManagedElement=1,TransportNetwork=1,AtmPort=MS-24-1,VplTp=Vp'$COUNT'"' >> $MOSCRIPT
 echo ')' >> $MOSCRIPT

COUNT=`expr $COUNT + 1`
done


##########################################
#
# AtmPort for RBSs
#
##########################################




RBSCOUNT=1
X=25
Y=1
NUMOFRBS=85

while [ "$RBSCOUNT" -le "$NUMOFRBS" ]
do

if [ "$Y" -eq 9 ]
then
Y=1
X=`expr $X + 1`
fi


echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,TransportNetwork=1,AtmPort=MS-'$X'-'$Y'"' >> $MOSCRIPT
echo '   identity Vp'$RBSCOUNT >> $MOSCRIPT
echo '   moType VplTp' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,TransportNetwork=1,AtmPort=MS-'$X'-'$Y',VplTp=Vp'$RBSCOUNT'"' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   moType VpcTp' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

COUNT2=1
while [ "$COUNT2" -le 13 ]
do

case "$COUNT2"
in
 1)   VCLTPREF=vc32-x-RNC-RBS$COUNT;;
 2)   VCLTPREF=vc33-x-RNC-RBS$COUNT;;
 3)   VCLTPREF=vc34-RNC-RBS$COUNT;;
 4)   VCLTPREF=vc34-x-RNC-RBS$COUNT;;
 5)   VCLTPREF=vc35-RNC-RBS$COUNT;;
 6)   VCLTPREF=vc35-x-RNC-RBS$COUNT;;
 7)   VCLTPREF=vc36-RNC-RBS$COUNT;;
 8)   VCLTPREF=vc37-RNC-RBS$COUNT;;
 9)   VCLTPREF=vc38-RNC;;
 10)  VCLTPREF=vc39-RNC;;
 11)  VCLTPREF=vc43-RNC-RBS$COUNT;;
 12)  VCLTPREF=vc44-RNC-RBS$COUNT;;
 13)  VCLTPREF=vc45-RNC;;
esac

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,TransportNetwork=1,AtmPort=MS-'$X'-'$Y',VplTp=Vp'$RBSCOUNT',VpcTp=1"' >> $MOSCRIPT
echo '   identity '$VCLTPREF >> $MOSCRIPT
echo '   moType VclTp' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT


COUNT2=`expr $COUNT2 + 1`
done



Y=`expr $Y + 1`

RBSCOUNT=`expr $RBSCOUNT + 1`
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





































