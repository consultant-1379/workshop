#!/bin/sh

# Created by  : unknown
# Created in  : unknown
##
### VERSION HISTORY
# Ver1        : Moddified for TERE 10.2
# Purpose     : 
# Description : LA and SA increased to 534
# Date        : 10 02 2010
# Who         : Fatih ONUR
##############################################
# Ver2        : Moddified for TERE 10.2
# Purpose     : Req id: 3425
# Description : RAC decreased to 256
# Date        : 18 03 2010
# Who         : Fatih ONUR
##############################################
# Ver3        : Modified for WRAN deployment O.10.2.4, req id:3922
# Purpose     :
# Description : RAC decreased to 255
# Date        : 29.05.2010
# Who         : Fatih ONUR
##############################################
# Ver4        : Modified for WRAN deployment O.10.3
# Purpose     :
# Description : Minor changes for LAC. It was starting froim 2 now starts from 1
# Date        : 29.05.2010
# Who         : Fatih ONUR
##############################################
# Ver5        : Modified for WRAN deployment O12.0
# Purpose     :
# Description : RAC to become max 255
# Date        : 06.01.2012
# Who         : Fatih ONUR
##############################################



if [ "$#" -ne 3  ]
then
cat<<HELP

####################
# HELP
####################

Usage  : $0 <sim name> <env file> <rnc num>

Example: $0 RNCL130-ST-RNC01 R7-ST-G-N.env 1

HELP

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


MOSCRIPT=$0${NOW}:$$:$RNCNAME".mo"
MMLSCRIPT=$0${NOW}:$$:$RNCNAME".mml"

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

#echo "//"
#echo "//MAKING MO SCRIPT"
#echo "//"

# Num of cell has sharing same LA/RA
# values come from env file
#SHARE1
#SHARE2


TOTALCELLS=`getTotalCells $RNCCOUNT $RNCRBSARRAY $RBSCELLARRAY`
echo "//TOTALCELLS="$TOTALCELLS

START_CUMTOTALCELLS=`getCumulativeTotalCells $RNCCOUNT 1 $RNCRBSARRAY $RBSCELLARRAY`
echo "//START_CUMTOTALCELLS="$START_CUMTOTALCELLS

STOP_CUMTOTALCELLS=`getCumulativeTotalCells $RNCCOUNT $TOTALCELLS $RNCRBSARRAY $RBSCELLARRAY`
echo "//STOP_CUMTOTALCELLS="$STOP_CUMTOTALCELLS
echo "//*************"

LASTART=`getLAStart $RNCCOUNT $SHARE1 $RNCRBSARRAY $RBSCELLARRAY`

#Max LA per RNC is 48, RNC109 SHARE is 111
if [ $RNCCOUNT -eq 109 ]
then
  SHARE1=$SHARE2
fi

NUMOFLAS=`getGroup $TOTALCELLS $SHARE1`
LASTOP=`expr $LASTART + $NUMOFLAS - 1`


SACOUNT=$START_CUMTOTALCELLS

LACOUNT=$LASTART
echo "//LACOUNT=$LACOUNT"
while [ "$LACOUNT" -le "$LASTOP" ] 
do
  
  MOD=`expr $LACOUNT % 255`
  if [ $MOD -eq 0 ]
  then
    RAC=255
  else
    RAC=`expr $LACOUNT % 255 + 0`
  fi
  
  LAC=$LACOUNT
  RA=$RAC
  LA=$LACOUNT
  

  echo -n "//RA="${LACOUNT}" LA="${LACOUNT}" RAC="${RAC}" LAC="${LAC}" URA="${LAC}" " 

  ######################
  # LocationArea
  ######################

  echo 'CREATE' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo '  parent "ManagedElement=1,RncFunction=1"' >> $MOSCRIPT
  echo ' identity '$LACOUNT >> $MOSCRIPT
  echo ' moType LocationArea' >> $MOSCRIPT
  echo ' exception none' >> $MOSCRIPT
  echo ' nrOfAttributes 2' >> $MOSCRIPT
  echo ' lac Integer '$LAC >> $MOSCRIPT
  echo ' userLabel String LOCATIONAREA'$LACOUNT >> $MOSCRIPT
  echo ')' >> $MOSCRIPT



  ######################
  # URA
  ######################

  URAID=$LACOUNT

  echo 'CREATE' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo '  parent "ManagedElement=1,RncFunction=1"' >> $MOSCRIPT
  echo '   identity '$URAID >> $MOSCRIPT
  echo '   moType Ura' >> $MOSCRIPT
  echo '   exception none' >> $MOSCRIPT
  echo '   nrOfAttributes 2' >> $MOSCRIPT
  echo '   uraIdentity Integer '$URAID >> $MOSCRIPT
  echo '   userLabel String "Ura'$URAID'"' >> $MOSCRIPT
  echo ')' >> $MOSCRIPT
  

  ######################
  # RoutingArea
  ######################

    echo 'CREATE' >> $MOSCRIPT
    echo '(' >> $MOSCRIPT
    echo '  parent "ManagedElement=1,RncFunction=1,LocationArea='$LACOUNT'"' >> $MOSCRIPT
    echo ' identity '$RAC >> $MOSCRIPT
    echo ' moType RoutingArea' >> $MOSCRIPT
    echo ' exception none' >> $MOSCRIPT
    echo ' nrOfAttributes 2' >> $MOSCRIPT
    echo ' rac Integer '$RAC >> $MOSCRIPT
    echo ' userLabel String ROUTINGAREA'$RAC >> $MOSCRIPT
    echo ')' >> $MOSCRIPT


  ######################
  # ServiceArea
  ######################


  echo -n "SA="${SACOUNT}
  
  COUNT=1
  STOP=$SHARE1
  while [ "$COUNT" -le "$STOP" ]
  do

    if [ "$SACOUNT" -gt "$STOP_CUMTOTALCELLS" ]
    then
      break
    fi

    #echo  "SA="${SACOUNT} # not requred for common output

    echo 'CREATE' >> $MOSCRIPT
    echo '(' >> $MOSCRIPT
    echo '  parent "ManagedElement=1,RncFunction=1,LocationArea='$LACOUNT'"' >> $MOSCRIPT
    echo ' identity '$SACOUNT >> $MOSCRIPT
    echo ' moType ServiceArea' >> $MOSCRIPT
    echo ' exception none' >> $MOSCRIPT
    echo ' nrOfAttributes 2' >> $MOSCRIPT
    echo ' sac Integer '$SACOUNT >> $MOSCRIPT
    echo ' userLabel String SERVICEAREA'$SACOUNT >> $MOSCRIPT
    echo ')' >> $MOSCRIPT
    
    SACOUNT=`expr $SACOUNT + 1`
    COUNT=`expr $COUNT + 1`
  done
  echo "-"$(($SACOUNT - 1))"//"

  LACOUNT=`expr $LACOUNT + 1`
done
 
cat $PWD/$MOSCRIPT
rm $PWD/$MOSCRIPT
exit

#########################################
#
# Make MML Script
#
#########################################

echo "//"
echo "//MAKING MML SCRIPT"
echo "//"


echo '.open '$SIMNAME >> $MMLSCRIPT
echo '.select '$RNCNAME >> $MMLSCRIPT
echo '.start ' >> $MMLSCRIPT
echo 'useattributecharacteristics:switch="off";' >> $MMLSCRIPT
echo 'kertayle:file="'$PWD'/'$MOSCRIPT'",commit_freq=operation;' >> $MMLSCRIPT



 $NETSIMDIR/$NETSIMVERSION/netsim_pipe < $MMLSCRIPT


rm $PWD/$MOSCRIPT
rm $PWD/$MMLSCRIPT

