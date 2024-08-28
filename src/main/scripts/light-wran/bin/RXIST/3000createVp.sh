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

##########################################
#
# AtmPort for RNC
#
##########################################

RBSCOUNT=1
TEMP=1

while [ "$RBSCOUNT" -le "$NUMOFRBS" ]
do

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,TransportNetwork=1,AtmPort=MS-24-'$TEMP'"' >> $MOSCRIPT
echo '   identity Vp'$RBSCOUNT >> $MOSCRIPT
echo '   moType VplTp' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT


echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,TransportNetwork=1,AtmPort=MS-24-'$TEMP',VplTp=Vp'$RBSCOUNT'"' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   moType VpcTp' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

VAR=1
while [ "$VAR" -le 3 ]
do

 case "$VAR"
 in
 1) VCLTPID="vc38-RNC-RBS"$RBSCOUNT ;;
 2) VCLTPID="vc45-RNC-RBS"$RBSCOUNT ;;
 3) VCLTPID="vc39-RNC-RBS"$RBSCOUNT ;;
 esac

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,TransportNetwork=1,AtmPort=MS-24-'$TEMP',VplTp=Vp'$RBSCOUNT',VpcTp=1"' >> $MOSCRIPT
echo '   identity '$VCLTPID >> $MOSCRIPT
echo '   moType VclTp' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

VAR=`expr $VAR + 1`
done


#COUNT1=1
#while [ "$COUNT1" -le "$NUMOFRBS" ]
#do

COUNT2=1
while [ "$COUNT2" -le 10 ]
do

case "$COUNT2"
in
 1) VCLTPID=vc32-x-RNC-RBS$RBSCOUNT;;
 2) VCLTPID=vc33-x-RNC-RBS$RBSCOUNT;;
 3) VCLTPID=vc34-RNC-RBS$RBSCOUNT;;
 4) VCLTPID=vc34-x-RNC-RBS$RBSCOUNT;;
 5) VCLTPID=vc35-RNC-RBS$RBSCOUNT;;
 6) VCLTPID=vc35-x-RNC-RBS$RBSCOUNT;;
 7) VCLTPID=vc36-RNC-RBS$RBSCOUNT;;
 8) VCLTPID=vc37-RNC-RBS$RBSCOUNT;;
 9) VCLTPID=vc43-RNC-RBS$RBSCOUNT;;
 10) VCLTPID=vc44-RNC-RBS$RBSCOUNT;;
esac

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,TransportNetwork=1,AtmPort=MS-24-'$TEMP',VplTp=Vp'$RBSCOUNT',VpcTp=1"' >> $MOSCRIPT
echo '   identity '$VCLTPID >> $MOSCRIPT
echo '   moType VclTp' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT


COUNT2=`expr $COUNT2 + 1`
done


REM=`expr $RBSCOUNT % 126`
if [ "$REM" -eq 0 ]
then
 TEMP=`expr $TEMP + 1`
fi

RBSCOUNT=`expr $RBSCOUNT + 1`
done


##########################################
#
# AtmPort for RBSs
#
##########################################




RBSCOUNT=1
X=25
Y=1

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
 1) VCLTPID=vc32-x-RBS$RBSCOUNT;;
 2) VCLTPID=vc33-x-RBS$RBSCOUNT;;
 3) VCLTPID=vc34-RBS$RBSCOUNT;;
 4) VCLTPID=vc34-x-RBS$RBSCOUNT;;
 5) VCLTPID=vc35-RBS$RBSCOUNT;;
 6) VCLTPID=vc35-x-RBS$RBSCOUNT;;
 7) VCLTPID=vc36-RBS$RBSCOUNT;;
 8) VCLTPID=vc37-RBS$RBSCOUNT;;
 9) VCLTPID=vc38-RBS$RBSCOUNT;;
 10) VCLTPID=vc39-RBS$RBSCOUNT;;
 11) VCLTPID=vc43-RBS$RBSCOUNT;;
 12) VCLTPID=vc44-RBS$RBSCOUNT;;
 13) VCLTPID=vc45-RBS$RBSCOUNT;;
esac

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,TransportNetwork=1,AtmPort=MS-'$X'-'$Y',VplTp=Vp'$RBSCOUNT',VpcTp=1"' >> $MOSCRIPT
echo '   identity '$VCLTPID >> $MOSCRIPT
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

