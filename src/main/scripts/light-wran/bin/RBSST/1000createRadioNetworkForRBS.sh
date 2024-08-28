#!/bin/sh

# Created by : Fatih ONUR
# Created in : unknown
##
### VERSION HISTORY
##################################################
# Ver1        : Created for R6.2 TERE
##################################################
# Ver2        : Moddified for WRAN TERE O.11.2
# Purpose     : To start nodes parallel
# Description :
# Date        : 18 APR 2011
# Who         : Fatih ONUR
##################################################


if [ "$#" -ne 3  ]
then
cat<<HELP

####################
# HELP
####################

Usage  : $0 <sim name> <env file> <rnc num> 

Example: $0 RNCS1100-ST-RNC01 O13-ST-13A-40K.env 1

CREATE: RbsLocalCell, Iub

HELP

exit
fi


SIMNAME=$1
ENV=$2
RNCIDCOUNT=$3


if [ "$RNCIDCOUNT" -le 9 ]
then
  RNCNAME="RNC0"$RNCIDCOUNT
  RNCCOUNT="0"$RNCIDCOUNT
else
  RNCNAME="RNC"$RNCIDCOUNT
  RNCCOUNT=$RNCIDCOUNT
fi

if [ "$RNC_NODE_CREATION" != "YES" ]
then
  RNCNAME=""
fi


echo "//...$0:$SIMNAME rbs script started running at "`date`
echo "//"


. ../../dat/$ENV

. ../utilityFunctions.sh

PWD=`pwd`
NOW=`date +"%Y_%m_%d_%T:%N"`

MOSCRIPT=$0:$NOW:$SIMNAME".mo"
MMLSCRIPT=$0:$NOW:$SIMNAME".mml"


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

DEL1="DELETE_ALL_MO_SCRIPTS_${SIMNAME}_aOut1170createRbsLocalCell.sh"
DEL2="DELETE_ALL_MO_SCRIPTS_${SIMNAME}_aOut1201createCarrier.sh"
DEL3="DELETE_ALL_MO_SCRIPTS_${SIMNAME}_aOut1240createCabinet.sh"

if [ -f $PWD/$DEL1 ]
then
  rm -r  $PWD/$DEL1
  echo "//..old "$PWD/$DEL1" removed"
fi
if [ -f $PWD/$DEL2 ]
then
  rm -r  $PWD/$DEL2
  echo "//..old "$PWD/$DEL2" removed"
fi
if [ -f $PWD/$DEL3 ]
then
  rm -r  $PWD/$DEL3
  echo "//..old "$PWD/$DEL3" removed"
fi



#########################################
# 
# Make MO Script
#
#########################################

#echo ""
#echo "MAKING MO SCRIPT"
#echo ""

echo "//.....$0:$SIMNAME MAKING MO SCRIPT RBS started running at "`date`
echo "//"


###########################################
#Set ManageElement (1000setManagedElement.sh)
###########################################

RBSVERSION=`getMimType $RNCCOUNT $RBSVERSIONARRAY`


RBSVERSION2=fatty

cat >> $MOSCRIPT << MOSCT
SET
(
 mo "ManagedElement=1"
 identity 1
 exception none
 nrOfAttributes 1
//faultTolerantCoreStates Array String 1
// "ManagedElement=1,Equipment=1,Subrack=MS,Slot=1,PlugInUnit=1;ftcState=Active"
 mimName String $RBSVERSION
)
MOSCT

###########################################
#Set ManageElement End
###########################################

###########################################
#Create Security 1040createSecurity.sh
###########################################

cat >> $MOSCRIPT << MOSCT

CREATE
(
  parent "ManagedElement=1,SystemFunctions=1"
  identity 1
  moType Security
  exception none
  nrOfAttributes 0
)

MOSCT

###########################################
#Create Security 1040createSecurity.sh End
###########################################


##########################################
#Create LM 1060createlm.sh 
##########################################

cat "$SIMDIR/mo/$RBSDIR/lm.mo" >> $MOSCRIPT

##########################################
#Create LM 1060createlm.sh End
##########################################


#########################################
#Create PiuType (1070createpiutype.sh) 
#########################################

cat "$SIMDIR/mo/$RBSDIR/piutype.mo" >> $MOSCRIPT

#########################################
#Create PiuType End 
#########################################

########################################
#Create Switch Fab (1140createSwitchFab.sh)
########################################

cat "$SIMDIR/mo/$RBSDIR/switchfab.mo" >> $MOSCRIPT

########################################
#Create Switch Fab End
########################################

########################################
#Create RPU (1220createReliableProgram.sh)
########################################

cat >> $MOSCRIPT << MOSCT

CREATE
(
  parent "ManagedElement=1,SwManagement=1"
   identity ans_aal2ap_12_1
   moType ReliableProgramUniter
   exception none
   nrOfAttributes 0
)


CREATE
(
  parent "ManagedElement=1,SwManagement=1"
   identity ans_aal2cpsrc_12_1
   moType ReliableProgramUniter
   exception none
   nrOfAttributes 0
)

CREATE
(
  parent "ManagedElement=1,SwManagement=1"
   identity ans_aal2ap_11
   moType ReliableProgramUniter
   exception none
   nrOfAttributes 0
)


CREATE
(
  parent "ManagedElement=1,SwManagement=1"
   identity ans_aal2cpsrc_11
   moType ReliableProgramUniter
   exception none
   nrOfAttributes 0
)

MOSCT

###########################################
#Create RPU (1220createReliableProgram.sh) End
###########################################

###########################################
#Set NodeBFunction
###########################################

cat >> $MOSCRIPT << MOSCT

SET
(
  mo "ManagedElement=1,NodeBFunction=1"
   identity 1
   exception none
   nrOfAttributes 4
   availableRbsChannelElementsDownlink Integer 1500
   licenseCapacityRbsChannelElementsDownlink Integer 700
   availableRbsChannelElementsUplink Integer 1300
   licenseCapacityRbsChannelElementsUplink Integer 1000
)

MOSCT

##############################################
#SET NodeBFunction End
##############################################

#########################################
# Make MML Script
#########################################

echo "//.....$0:$SIMNAME MAKING MO SCRIPT RBS ended running at "`date`
echo "//"

echo '.open '$SIMNAME >> $MMLSCRIPT
echo '.selectregexp simne '$RBSNES >> $MMLSCRIPT
echo '.start ' >> $MMLSCRIPT
echo 'useattributecharacteristics:switch="off";' >> $MMLSCRIPT
echo 'kertayle:file="'$PWD'/'$MOSCRIPT'";' >> $MMLSCRIPT


./aOut1170createRbsLocalCell.sh $SIMNAME $ENV $RNCIDCOUNT >> $MMLSCRIPT

./aOut1201createCarrier.sh $SIMNAME $ENV $RNCIDCOUNT >> $MMLSCRIPT

./aOut1240createCabinet.sh $SIMNAME $ENV $RNCIDCOUNT >> $MMLSCRIPT


$NETSIMDIR/$NETSIMVERSION/netsim_pipe < $MMLSCRIPT

rm $PWD/$MOSCRIPT

###########################
. $DEL1
. $DEL2
. $DEL3
rm $DEL1 $DEL2 $DEL3
###########################

rm $PWD/$MMLSCRIPT

echo "//...$0:$SIMNAME rbs script ended running at "`date`
echo "//"

