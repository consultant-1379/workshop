#!/bin/sh

# Created by  : Fatih ONUR
# Created in  : 18.11.2010
##
### VERSION HISTORY
##############################################
# Ver1        : Created for ST-IRATHOM , WRAN TERE:11.2
# Purpose     :
# Description :
# Date        : 18 NOV 2010
# Who         : Fatih ONUR
##############################################
# Ver2        : Modified for reqId:6925
# Purpose     : lac value is updated.
# Description :
# Date        : 26.05.2011
# Who         : Fatih ONUR
##############################################
# Ver3        : Modified for WRAN 12.0 TERE reqId:7237
# Purpose     : 
# Description :
# Date        : 26.07.2011
# Who         : Fatih ONUR
##############################################


if [ "$#" -ne 3  ]
then
cat<<HELP

####################
# HELP
####################

Usage  : $0 <sim name> <env file> <rnc num>

Example: $0  RNCM115-ST-RNC01 R7-ST-11.0.6-N.env 1

HELP

exit 1
fi


################################
# MAIN
################################


SIMNAME=$1
ENV=$2
RNC=$3

. ../../dat/$ENV
. ../utilityFunctions.sh

FILE=$INPUTFILENAME

if [ "$3" -le 9 ]
then
  RNCNAME="RNC0"$RNC
  RNCCOUNT="0"$RNC
else
  RNCNAME="RNC"$RNC
  RNCCOUNT=$RNC
fi

echo "//...$0:$RNCNAME script started running at "`date`
echo "//"

PWD=`pwd`
NOW=`date +"%Y_%m_%d_%T:%N"`

# *** Note ***
# Assuming ExternalGsmCell input file exist
if [ ! -f "$PWD/$FILE" ]
then
  echo "//File: "$PWD/$FILE" does not exist"
  echo "//Check the file and run again"
  exit
fi


MOSCRIPT=$0${NOW}:$RNCNAME".mo"
MMLSCRIPT=$0${NOW}:$RNCNAME".mml"

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

#RUN="YES"
#EXTGSMCELLS=$RUN

if [ "$EXTGSMCELLS" == "YES" ]
then

echo "//...$0:$RNCNAME MAKING MO SCRIPT started running at "`date` >> $MOSCRIPT
echo "//" >> $MOSCRIPT

#########################################
# 
# Make MO Script
#
#########################################

#echo ""
#echo "MAKING MO SCRIPT"
#echo ""

##############################################################
#
# ExternalGsmNetworks
#
##############################################################

echo "//"$RNCNAME" has the following ExternalGsmNetworks"

mnc=$GSMMNC; MCC=$GSMMCC; MNCLENGTH=$GSMMNCLENGTH 

    echo "// :: ExternalGsmNetwork="$mnc" ; mcc="$MCC", mnc="$mnc", mncLength="$MNCLENGTH

    echo 'CREATE' >> $MOSCRIPT
    echo '(' >> $MOSCRIPT
    echo '  parent "ManagedElement=1,RncFunction=1"' >> $MOSCRIPT
    echo ' identity '$GSMMNC >> $MOSCRIPT
    echo ' moType ExternalGsmNetwork' >> $MOSCRIPT
    echo ' exception none' >> $MOSCRIPT
    echo ' nrOfAttributes 3' >> $MOSCRIPT
    echo '   mcc Integer '$MCC >> $MOSCRIPT
    echo '   mnc Integer '$mnc >> $MOSCRIPT
    echo '   mncLength Integer '$MNCLENGTH >> $MOSCRIPT
    echo ')' >> $MOSCRIPT

    COUNT=`expr $COUNT + 1`


##############################################################
#
# ExternalGsmCell
#
##############################################################

#echo ""
#echo $RNCNAME" has the following ExternalGsmCells"


TOTALCELLS=`getTotalCells $RNCCOUNT $RNCRBSARRAY $RBSCELLARRAY`

if [ "$RNCCOUNT" -ge 1 ] && [ "$RNCCOUNT" -le 40 ] 
then
  EXTGSMCELL_RANGE=300
  PLUS=`expr 299 - 1`

  START_EXTGSMCELL_COUNT=`expr $RNCCOUNT \* $EXTGSMCELL_RANGE - \( $EXTGSMCELL_RANGE - 1 \)`
  STOP_EXTGSMCELL_COUNT=`expr $START_EXTGSMCELL_COUNT + $PLUS`

elif [ "$RNCCOUNT" -eq 41 ]
then
  EXTGSMCELL_RANGE=300
  PLUS=`expr 39 - 1`

  START_EXTGSMCELL_COUNT=`expr $RNCCOUNT \* $EXTGSMCELL_RANGE - \( $EXTGSMCELL_RANGE - 1 \)`
  STOP_EXTGSMCELL_COUNT=`expr $START_EXTGSMCELL_COUNT + $PLUS`

elif [ "$RNCCOUNT" -ge 42 ] && [ "$RNCCOUNT" -le 96 ] 
then
  EXTGSMCELL_RANGE=1520
  PLUS=`expr $EXTGSMCELL_RANGE - 1`
  INITIAL=20000
  DISCARDED_NUM_OF_RNC=41

  # Start from RNC40 to 94 see more detail in workingOnWRAN.xml
  NUM_OF_RNC_GROUP=11

  BELONGS_TO_GROUP=`getGroup $(( $RNCCOUNT - $DISCARDED_NUM_OF_RNC )) $NUM_OF_RNC_GROUP`

  START_EXTGSMCELL_COUNT=`expr $INITIAL + \( $BELONGS_TO_GROUP \) \* $EXTGSMCELL_RANGE - \( $EXTGSMCELL_RANGE - 1 \)`
  STOP_EXTGSMCELL_COUNT=`expr $START_EXTGSMCELL_COUNT + $PLUS`

elif [ "$RNCCOUNT" -ge 97 ] && [ "$RNCCOUNT" -le 103 ]
then
  EXTGSMCELL_RANGE=3872
  PLUS=`expr $EXTGSMCELL_RANGE - 1`
  INITIAL=27700
  DISCARDED_NUM_OF_RNC=96
  NUM_OF_RNC_GROUP=7
  BELONGS_TO_GROUP=`getGroup $(( $RNCCOUNT - $DISCARDED_NUM_OF_RNC )) $NUM_OF_RNC_GROUP`

  START_EXTGSMCELL_COUNT=`expr $INITIAL + \( $BELONGS_TO_GROUP \) \* $EXTGSMCELL_RANGE - \( $EXTGSMCELL_RANGE - 1 \)`
  STOP_EXTGSMCELL_COUNT=`expr $START_EXTGSMCELL_COUNT + $PLUS`

elif [ "$RNCCOUNT" -ge 104 ] && [ "$RNCCOUNT" -le 106 ] 
then

  EXTGSMCELL_RANGE=5055
  PLUS=`expr $EXTGSMCELL_RANGE - 1`
  INITIAL=32000
  DISCARDED_NUM_OF_RNC=103
  NUM_OF_RNC_GROUP=3
  BELONGS_TO_GROUP=`getGroup $(( $RNCCOUNT - $DISCARDED_NUM_OF_RNC )) $NUM_OF_RNC_GROUP`

  START_EXTGSMCELL_COUNT=`expr $INITIAL + \( $BELONGS_TO_GROUP \) \* $EXTGSMCELL_RANGE - \( $EXTGSMCELL_RANGE - 1 \)`
  STOP_EXTGSMCELL_COUNT=`expr $START_EXTGSMCELL_COUNT + $PLUS`

elif [ "$RNCCOUNT" -ge 107 ] && [ "$RNCCOUNT" -le 109 ]
then

  EXTGSMCELL_RANGE=9600
  PLUS=`expr $EXTGSMCELL_RANGE - 1`
  INITIAL=38000
  DISCARDED_NUM_OF_RNC=106
  NUM_OF_RNC_GROUP=3
  BELONGS_TO_GROUP=`getGroup $(( $RNCCOUNT - $DISCARDED_NUM_OF_RNC )) $NUM_OF_RNC_GROUP`

  START_EXTGSMCELL_COUNT=`expr $INITIAL + \( $BELONGS_TO_GROUP \) \* $EXTGSMCELL_RANGE - \( $EXTGSMCELL_RANGE - 1 \)`
  STOP_EXTGSMCELL_COUNT=`expr $START_EXTGSMCELL_COUNT + $PLUS`

#elif [ "$RNCCOUNT" -ge 183 ] 
#then
#  EXTGSMCELL_RANGE=1050
#  PLUS=`expr $EXTGSMCELL_RANGE - 1`
#  #INITIAL=129450
#  INITIAL=59450
#  BELONGS_TO_GROUP=1

#  START_EXTGSMCELL_COUNT=`expr $INITIAL + \( $BELONGS_TO_GROUP \) \* $EXTGSMCELL_RANGE - \( $EXTGSMCELL_RANGE - 1 \)`
#  STOP_EXTGSMCELL_COUNT=`expr $START_EXTGSMCELL_COUNT + $PLUS`

fi


EXTGSMNETWORK=$GSMMNC
SWITCH_TO_NEW_NETWORK=`expr $EXTGSMCELL_RANGE / 1` 

COUNT=$START_EXTGSMCELL_COUNT
STOP=$STOP_EXTGSMCELL_COUNT

while [ "$COUNT" -le "$STOP" ]
do


  # Considering GRAN sim SWITCH
  #
  #if [ "$COUNT" -eq "$SWITCH_TO_NEW_EXTGSMCELL_ID_FOR_NEW_SIM" ]
  #then
  #  COUNT=`expr $COUNT + 8`
  #fi

  EXTGSMCELL_ID=$COUNT

  # ExternalGranCell Attributes: Static
  #
  NCC=3
  C_SYS_TYPE=2


  # Division of the ExternalGsmCells for IRATHOM and Default
  #  Up to RNC39, ExternalGsmCells input info taken from a file
  #
  if [ "$RNCCOUNT" -ge 42 ] 
  then
    MOD=`expr \( $COUNT - $INITIAL \) % $SWITCH_TO_NEW_NETWORK`
    #if [ "$MOD" -eq 1 ] 
    #then
    #  EXTGSMNETWORK=`expr $EXTGSMNETWORK - 1`
    #fi

    # ExternalGranCell Attributes: Static Fake
    CELL_NAME=$EXTGSMCELL_ID
    BCC=0
    BCCHNO=1

    LAC=`expr $COUNT % 254 + 1`

  elif [ "$RNCCOUNT" -le 41 ]
  then

    # read GRAN network info provided by GRAN team
    #
    LINE=`grep "CI=${EXTGSMCELL_ID};" ${PWD}/$FILE`

    # ExternalGranCell Attributes: Dynamic
    #
    CELL_NAME=`echo $LINE| awk -F";" '{print $1}' |  awk -F"=" '{print $2}'`
    BCC=`echo $LINE | awk -F";" '{print $8}' |  awk -F"=" '{print $2}'`
    BCCHNO=`echo $LINE | awk -F";" '{print $9}' |  awk -F"=" '{print $2}'`
    LAC=`echo $LINE | awk -F";" '{print $5}' |  awk -F"=" '{print $2}'`
  fi  

    ##echo -n "//CELL_NAME="$CELL_NAME" LAC="$LAC" CI="$EXTGSMCELL_ID " NCC="$NCC" BCC="$BCC" BCCHNO="$BCCHNO" C_SYS_TYPE="$C_SYS_TYPE
    ##echo " EXTGSMNETWORK="$EXTGSMNETWORK" RNCCOUNT=:"$RNCCOUNT

  echo 'CREATE' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo '  parent "ManagedElement=1,RncFunction=1,ExternalGsmNetwork='$EXTGSMNETWORK'"' >> $MOSCRIPT
  echo ' identity '$EXTGSMCELL_ID >> $MOSCRIPT
  echo ' moType ExternalGsmCell' >> $MOSCRIPT
  echo ' exception none' >> $MOSCRIPT
  echo ' nrOfAttributes 3' >> $MOSCRIPT
  echo ' lac Integer '$LAC >> $MOSCRIPT
  echo ' ncc Integer '$NCC >> $MOSCRIPT
  echo ' bcc Integer '$BCC >> $MOSCRIPT
  echo ' bcchFrequency Integer '$BCCHNO >> $MOSCRIPT
  echo ' bandIndicator Integer '$C_SYS_TYPE >> $MOSCRIPT
  echo ' ExternalGsmCellId String '$CELL_NAME >> $MOSCRIPT
  echo ' userLabel String ExternalGsmCell-'$EXTGSMCELL_ID >> $MOSCRIPT
  echo ' cellIdentity Integer '$EXTGSMCELL_ID >> $MOSCRIPT
  echo ')' >> $MOSCRIPT

  COUNT=`expr $COUNT + 1`
done


echo "//...$0:$RNCNAME MAKING MO SCRIPT ended running at "`date` >> $MOSCRIPT
echo "//" >> $MOSCRIPT

cat $PWD/$MOSCRIPT
rm $PWD/$MOSCRIPT

fi # END FOR EXTGSMCELLS IF/ELSE

exit

########################################
#
# Make MML Script
#
#########################################

echo ""
echo "MAKING MML SCRIPT"
echo ""

echo '.open '$SIMNAME >> $MMLSCRIPT
echo '.select '$RNCNAME >> $MMLSCRIPT
echo '.start ' >> $MMLSCRIPT
echo 'useattributecharacteristics:switch="off";' >> $MMLSCRIPT
echo 'kertayle:file="'$PWD'/'$MOSCRIPT'",commit_freq=operation;' >> $MMLSCRIPT

 $NETSIMDIR/$NETSIMVERSION/netsim_pipe < $MMLSCRIPT

rm $PWD/$MOSCRIPT
rm $PWD/$MMLSCRIPT

echo "...script ended at "`date`
echo ""

