#!/bin/sh

# Created by : unknown
# Created in  : unknown
##
### VERSION HISTORY
##################################################
# Ver1        : Created for R6.2 TERE
##################################################
# Ver2        : Modified for WCC error rule number 35 and 7 req id: 2598
# Purpose     : (35) Verify the User Plane Transport Option configuration in the RNC and RBS match
#               (7) Check that the configured UTRAN Cell maximumTransmissionPower does not exceed the RBS power capability
# Description :
# Date        : 26 Nov 2009
# Who         : Fatih ONUR
##################################################
# Ver2        : Moddified for WRAN TERE O.11.0
# Purpose     :
# Description :
# Date        : 12 08 2010
# Who         : Fatih ONUR
##################################################
# Ver3        : Moddified for WRAN TERE O.12.0
# Purpose     :
# Description :
# Date        : 2011.08.16
# Who         : Fatih ONUR
##################################################
# Ver3        : Moddified for WRAN TERE O.13.0
# Purpose     :
# Description :
# Date        : 2012.08.20
# Who         : Fatih ONUR
##################################################



if [ "$#" -ne 3  ]
then
cat<<HELP

####################
# HELP
####################

Usage  : $0 <sim name> <env file> <rnc num>

Example: $0 RNCL145-ST-RNC15 R7-ST-K-N.env 15

CREATE: RbsLocalCell, Iub

HELP

exit 1
fi

################################
# MAIN
################################

SIMNAME=$1
ENV=$2
RNCIDCOUNT=$3

. ../../dat/$ENV
. ../utilityFunctions.sh

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


echo "#//...$0:$SIMNAME script started running at "`date`
echo "#//"


PWD=`pwd`
NOW=`date +"%Y_%m_%d_%T:%N"`

MOSCRIPT=$0:${NOW}:$SIMNAME
MMLSCRIPT=$0:${NOW}:$SIMNAME".mml"

SCRIPTNAME=`basename "$0"`
DELETE_ALL_MO_SCRIPTS="DELETE_ALL_MO_SCRIPTS_${SIMNAME}_${SCRIPTNAME}"

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

#echo ""
#echo "MAKING MO SCRIPT"
#echo ""

NUMOFRBS=`getNumOfRBS $RNCCOUNT $RNCRBSARRAY $RBSCELLARRAY`

TOTALCELLS=`getTotalCells $RNCCOUNT $RNCRBSARRAY $RBSCELLARRAY`

CIDSTART=`getCumulativeTotalCells $RNCCOUNT 1 $RNCRBSARRAY $RBSCELLARRAY`

CELLID=$CIDSTART


COUNT=1
RBSCOUNT=1
MOFILECOUNT=1

while [ "$COUNT" -le "$NUMOFRBS" ]
do
  
  if [ "$COUNT" -le 9 ]
   then
    RBSNAME=RBS0
   else
    RBSNAME=RBS
  fi

  CELLCOUNT=1
  NUMOFCELL=`getNumOfCell $RNCCOUNT $RBSCOUNT $RNCRBSARRAY $RBSCELLARRAY`
  CELLSTOP=`expr $NUMOFCELL + 1`
  
  MOFILEEXTENSION="__"$MOFILECOUNT".mo"

###################################################################################################
#
# Added for Req id :2598 to match the User Plane Transport Option configuration in the RNC and RBS
#
####################################################################################################

  if [ "$RNCCOUNT" -ge 4 ] && [ "$RNCCOUNT" -le 42 ]
  then
    ATM=true
    IP=false
  else
    ATM=false
    IP=true
  fi

  if [ "$RNCCOUNT" -eq 106 ] 
  then
    ATM=true
    IP=true
  fi

####################################################################################################


  while [ "$CELLCOUNT" -lt "$CELLSTOP" ]
  do

    #echo " :: RBSCOUNT="$RBSCOUNT" RbsLocalCell="$CELLCOUNT

    cat >> $MOSCRIPT$MOFILEEXTENSION << MOSCT
       CREATE
       (
         parent "ManagedElement=1,NodeBFunction=1"
          identity $CELLCOUNT
          moType RbsLocalCell
          exception none
          nrOfAttributes 2
            localCellId Integer $CELLID
            maxDlPowerCapability Integer 400 
       )
MOSCT
       
    CELLCOUNT=`expr $CELLCOUNT + 1`
    CELLID=`expr $CELLID + 1`
  done

  cat >> $MOSCRIPT$MOFILEEXTENSION << MOSCT
      CREATE
      (
   	  parent "ManagedElement=1,NodeBFunction=1"
   	   identity 1
   	   moType Iub
   	   exception none
   	   nrOfAttributes 2
   	   rbsId Integer $COUNT
           userPlaneTransportOption Struct
             nrOfElements 2
             atm Boolean $ATM
             ipV4 Boolean $IP

      )
MOSCT

  # RBSCOUNT increases after CELLCOUNT reaches to END 
  RBSCOUNT=`expr $RBSCOUNT + 1`

  #echo ""
  #echo "MAKING MML SCRIPT"

  cat >> $MMLSCRIPT << MMLSCT
  .open $SIMNAME
  .select $RNCNAME$RBSNAME$COUNT
  .start
  kertayle:file="$PWD/$MOSCRIPT$MOFILEEXTENSION";

MMLSCT

echo "rm $PWD/$MOSCRIPT$MOFILEEXTENSION " >> $DELETE_ALL_MO_SCRIPTS # Script to clean up all the generated MO scripts
  
  MOFILECOUNT=`expr $MOFILECOUNT + 1`
  COUNT=`expr $COUNT + 1`
done


################################################
# $NETSIMDIR/$NETSIMVERSION/netsim_pipe < $MMLSCRIPT

cat $PWD/$MMLSCRIPT 
rm $PWD/$MMLSCRIPT
exit

#############################
rm $PWD/$MMLSCRIPT
. $DELETE_ALL_MO_SCRIPTS
rm $DELETE_ALL_MO_SCRIPTS

echo "#//...$0:$SIMNAME script ended running at "`date`
echo "#//"

