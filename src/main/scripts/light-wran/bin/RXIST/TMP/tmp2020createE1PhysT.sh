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


if [ "$3" -eq 0 ]
then
RNCNAME=
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
while [ "$COUNT" -le 14 ]
do

  echo 'CREATE' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo '  parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot='$COUNT'"' >> $MOSCRIPT
  echo '   identity 1' >> $MOSCRIPT
  echo '   moType PlugInUnit' >> $MOSCRIPT
  echo '   exception none' >> $MOSCRIPT
  echo ')' >> $MOSCRIPT

    if [ "$COUNT" -ne 4 ]
    then
       echo 'CREATE' >> $MOSCRIPT
       echo '(' >> $MOSCRIPT
       echo '  parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot='$COUNT',PlugInUnit=1"' >> $MOSCRIPT
       echo '   identity 1' >> $MOSCRIPT
       echo '   moType ExchangeTerminal' >> $MOSCRIPT
       echo '   exception none' >> $MOSCRIPT
       echo ')' >> $MOSCRIPT
    fi


   COUNT2=1
   while [ "$COUNT2" -le 8 ]
   do

   if [ "$COUNT" -ne 4 ]
   then

   echo 'CREATE' >> $MOSCRIPT
   echo '(' >> $MOSCRIPT
   echo '  parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot='$COUNT',PlugInUnit=1,ExchangeTerminal=1"' >> $MOSCRIPT
   echo '   identity '$COUNT2 >> $MOSCRIPT
   echo '   moType E1PhysPathTerm' >> $MOSCRIPT
   echo '   exception none' >> $MOSCRIPT
   echo ')' >> $MOSCRIPT

   fi

   COUNT2=`expr $COUNT2 + 1`
   done


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





































