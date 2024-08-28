#!/bin/sh


if [ "$#" -ne 1  ]
then
 echo
 echo "Usage: $0  <env file>"
 echo
 echo "Example: $0 SIM1.env  (to create RNC09)"
 echo
 exit 1
fi




ENV=$1


. ../../dat/$ENV

SIMNAME=RXI-"$RXIVERSION"


PWD=`pwd`


MOSCRIPT=$0".mo"
MMLSCRIPT=$0".mml"

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
# Make MML Script
#
#########################################

echo ""
echo "MAKING MML SCRIPT"
echo ""



echo '.open '$SIMNAME >> $MMLSCRIPT
echo '.select 'RXI01 >> $MMLSCRIPT
echo '.start ' >> $MMLSCRIPT
echo 'useattributecharacteristics:switch="off";' >> $MMLSCRIPT
echo '.savenedatabase SAVE force' >> $MMLSCRIPT




$NETSIMDIR/$NETSIMVERSION/netsim_pipe < $MMLSCRIPT



rm $PWD/$MMLSCRIPT





































