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





COUNT=1
while [ "$COUNT" -le 28 ]
do

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,Equipment=1,Subrack=4,Slot='$COUNT',PlugInUnit=1"' >> $MOSCRIPT
echo '   identity ET-M4' >> $MOSCRIPT
echo '   moType ExchangeTerminal' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,Equipment=1,Subrack=4,Slot='$COUNT',PlugInUnit=1,ExchangeTerminal=ET-M4"' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   moType Os155SpiTtp' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,Equipment=1,Subrack=4,Slot='$COUNT',PlugInUnit=1,ExchangeTerminal=ET-M4,Os155SpiTtp=1"' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   moType Sts3CspeTtp' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

COUNT=`expr $COUNT + 1`
done


echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot=4"' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   moType PlugInUnit' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT


echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot=4,PlugInUnit=1"' >> $MOSCRIPT
echo '   identity ET-MC41' >> $MOSCRIPT
echo '   moType ExchangeTerminal' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot=4,PlugInUnit=1,ExchangeTerminal=ET-MC41"' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   moType Os155SpiTtp' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot=4,PlugInUnit=1,ExchangeTerminal=ET-MC41,Os155SpiTtp=1"' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   moType Vc4Ttp' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

VC12COUNT=1
while [ "$VC12COUNT" -lt 64 ]
do
	echo 'CREATE' >> $MOSCRIPT
	echo '(' >> $MOSCRIPT
	echo '  parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot=4,PlugInUnit=1,ExchangeTerminal=ET-MC41,Os155SpiTtp=1,Vc4Ttp=1"' >> $MOSCRIPT
	echo '   identity '$VC12COUNT >> $MOSCRIPT
	echo '   moType Vc12Ttp' >> $MOSCRIPT
	echo '   exception none' >> $MOSCRIPT
	echo '   nrOfAttributes 0' >> $MOSCRIPT
	echo ')' >> $MOSCRIPT
	
	echo 'CREATE' >> $MOSCRIPT
	echo '(' >> $MOSCRIPT
	echo '  parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot=4,PlugInUnit=1,ExchangeTerminal=ET-MC41,Os155SpiTtp=1,Vc4Ttp=1,Vc12Ttp='$VC12COUNT'"' >> $MOSCRIPT
	echo '   identity 1' >> $MOSCRIPT
	echo '   moType E1Ttp' >> $MOSCRIPT
	echo '   exception none' >> $MOSCRIPT
	echo '   nrOfAttributes 0' >> $MOSCRIPT
	echo ')' >> $MOSCRIPT

VC12COUNT=`expr $VC12COUNT + 1`
done

VAR=1

while [ "$VAR" -lt 9 ]
do
echo 'SET' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo ' mo "ManagedElement=1,TransportNetwork=1,AtmPort=MS-24-'$VAR'"' >> $MOSCRIPT
echo ' identity MS-24-'$VAR >> $MOSCRIPT
echo ' exception none' >> $MOSCRIPT
echo ' nrOfAttributes 1' >> $MOSCRIPT
echo ' uses Ref "ManagedElement=1,Equipment=1,Subrack=4,Slot='$VAR',PlugInUnit=1,ExchangeTerminal=ET-M4,Os155SpiTtp=1,Sts3CspeTtp=1"' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

VAR=`expr $VAR + 1`
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





































