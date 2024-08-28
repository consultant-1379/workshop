#!/bin/sh

if [ "$#" -ne 3  ]
then
 echo
 echo "Usage: $0 <sim name> <env file> <rnc num>"
 echo 
 echo "Example: $0 WegaC5LargeRNC14 SIM1.env 2 (for RNC02)"
 echo 
 exit 1
fi


SIMNAME=$1
ENV=$2


RBSSTART=1
RBSEND=85

MOSCRIPT=$0$$".mo"
MMLSCRIPT=$0$$".mml"

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

while [ "$COUNT" -le 8 ]
do

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-'$COUNT'"' >> $MOSCRIPT
echo '   identity vp1' >> $MOSCRIPT 
echo '   moType VplTp' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-'$COUNT',VplTp=vp1"' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT 
echo '   moType VpcTp' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

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




if [ "$RBSEND" -le 9 ]
then

while [ "$RBSSTART" -le "$RBSEND"  ]
do
echo '.open '$SIMNAME >> $MMLSCRIPT
echo '.select '$RNCNAME'RBS0'$RBSSTART >> $MMLSCRIPT
echo '.start ' >> $MMLSCRIPT
echo 'useattributecharacteristics:switch="off";' >> $MMLSCRIPT
echo 'kertayle:file="'$PWD'/'$MOSCRIPT'";' >> $MMLSCRIPT
RBSSTART=`expr $RBSSTART + 1`
done

fi


if [ "$RBSEND" -ge 9 ]
then

while [ "$RBSSTART" -le 9  ]
do
echo '.open '$SIMNAME >> $MMLSCRIPT
echo '.select '$RNCNAME'RBS0'$RBSSTART >> $MMLSCRIPT
echo '.start ' >> $MMLSCRIPT
echo 'useattributecharacteristics:switch="off";' >> $MMLSCRIPT
echo 'kertayle:file="'$PWD'/'$MOSCRIPT'";' >> $MMLSCRIPT
RBSSTART=`expr $RBSSTART + 1`
done

while [ "$RBSSTART" -le "$RBSEND" ]
do
echo '.open '$SIMNAME >> $MMLSCRIPT
echo '.select '$RNCNAME'RBS'$RBSSTART >> $MMLSCRIPT
echo '.start ' >> $MMLSCRIPT
echo 'useattributecharacteristics:switch="off";' >> $MMLSCRIPT
echo 'kertayle:file="'$PWD'/'$MOSCRIPT'";' >> $MMLSCRIPT
RBSSTART=`expr $RBSSTART + 1`
done

fi


#########################################
# 
# Run MML Script
#
#########################################

echo ""
echo "RUNNING MML SCRIPT"
echo ""



$NETSIMDIR/$NETSIMVERSION/netsim_pipe < $MMLSCRIPT


rm $PWD/$MOSCRIPT
rm $PWD/$MMLSCRIPT





































