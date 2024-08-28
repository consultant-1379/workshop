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
# AtmPort for RBSs
#
##########################################


RBSCOUNT=1
X=25
Y=1

VC12COUNT=1

while [ "$RBSCOUNT" -le "$NUMOFRBS" ]
do

if [ "$Y" -eq 9 ]
then
Y=1
X=`expr $X + 1`
fi

if [ "$VC12COUNT" -eq 64 ]
then
 VC12COUNT=1 
fi


echo 'SET' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '   mo "ManagedElement=1,TransportNetwork=1,AtmPort=MS-'$X'-'$Y'"' >> $MOSCRIPT
echo '   identity MS-'$X'-'$Y >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 1' >> $MOSCRIPT
echo '   uses Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=4,PlugInUnit=1,ExchangeTerminal=ET-MC41,Os155SpiTtp=1,Vc4Ttp=1,Vc12Ttp='$VC12COUNT',E1Ttp=1"' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

Y=`expr $Y + 1`

VC12COUNT=`expr $VC12COUNT + 1`



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

