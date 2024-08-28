#!/bin/bash

#VERSION HISTORY
# Verr2        : Created for WRAN TERE 13B
# Purpose     : ATM Configuration
# Description : Assume that simulation is no transport and 1's series script run against sim
#                 Script is tested against no transport simulation.
#                 changes RBS to be the same as unique RBS with IpAtmLinks with high speed Aal2 links.
# Date        : 25 FEB 2013
# Who         : Rob Guinan
#######################################################################
# Created by  : Fatih ONUR
# Created in  : 18.07.2012
##
### VERSION HISTORY
# Ver1        : Created for WRAN TERE 13A
# Purpose     : ATM setup
# Description : Assume that script is running on top of no transport radio network
# Date        : 10 Oct 2012
# Who         : Fatih ONUR

if [ "$#" -ne 5  ]
then
cat<<HELP

####################
# HELP
####################

Usage  : $0 <sim name> <env file> <rnc num> <rbs start> <rbs end>

Example: $0 RNCS1100-ST-RNC01 O13-ST-13A-40K.env 1 1 10

HELP

exit
fi

################################
# MAIN
################################

echo "//...$0:$SIMNAME rbs_trans script started running at "`date`
echo "//"

SIMNAME=$1
ENV=$2
RNCIDCOUNT=$3
RBSSTART=$4
RBSEND=$5

. ../../dat/$ENV
. ../utilityFunctions.sh
FILE=../$ICONCONFIGFILE

if [ "$RNCIDCOUNT" -le 9 ]
then
  RNCNAME="RNC0"$RNCIDCOUNT
  RNCCOUNT="0"$RNCIDCOUNT
else
  RNCNAME="RNC"$RNCIDCOUNT
  RNCCOUNT=$RNCIDCOUNT
fi

if [ "$RNC_NODE_CREATION" != "YES" ] && [ "$RBS_NODE_PARENT_RNC_EXIST" != "YES" ]
then
  RNCNAME=""
fi
#echo "RBS_NODE_PARENT_RNC_EXIST=$RBS_NODE_PARENT_RNC_EXIST"
#echo "RNCNAME=$RNCNAME"


echo "//.....$0:$SIMNAME MAKING MO SCRIPT RBS_TRANS started running at "`date`
echo "//"

PWD=`pwd`
NOW=`date +"%Y_%m_%d_%T:%N"`

MOSCRIPT=$0:${NOW}:$SIMNAME
MMLSCRIPT=$0:${NOW}:$SIMNAME".mml"


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

SCRIPTNAME=`basename "$0"`
DEL1="DELETE_ALL_MO_SCRIPTS_${SIMNAME}_${SCRIPTNAME}"

if [ -f $PWD/$DEL1 ]
then
  rm -r  $PWD/$DEL1
  echo "//..old "$PWD/$DEL1" removed"
fi


#########################################
# Make MO Script
#########################################


#NUMOFRBS=`getNumOfRBS $RNCCOUNT $RNCRBSARRAY $RBSCELLARRAY`
NUMOFRBS=$RBSEND

COUNT=$RBSSTART
STOP=$NUMOFRBS
MOFILECOUNT=1

while [ "$COUNT" -le "$STOP" ]
do

  if [ "$COUNT" -le 9 ]
   then
    RBSNAME=RBS0
   else
    RBSNAME=RBS
  fi

  MOFILEEXTENSION="__"$MOFILECOUNT".mo"

# Creating the Subracks here

  SUBRACKSTART=1
  SUBRACKSTOP=4
  SUBRACKCOUNT=$SUBRACKSTART
  while [ "$SUBRACKCOUNT" -le "$SUBRACKSTOP" ]
  do
    cat >> $MOSCRIPT$MOFILEEXTENSION << MOSCT
    CREATE
    (
      parent "ManagedElement=1,Equipment=1"
      identity $SUBRACKCOUNT
      moType Subrack
      exception none
      nrOfAttributes 0
    )
MOSCT
  SUBRACKCOUNT=`expr $SUBRACKCOUNT + 1`
  done

  COUNTX=27
  while [ $COUNTX -le 28 ]
  do

    cat >> $MOSCRIPT$MOFILEEXTENSION << MOSCT

    DELETE
    (
      mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=$COUNTX"
    )
MOSCT
  let COUNTX=$COUNTX+1
  done

  cat >> $MOSCRIPT$MOFILEEXTENSION << MOSCT
  CREATE
  (
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=4"
    identity 1
    moType PlugInUnit
    exception none
    nrOfAttributes 0
  )
  CREATE
  (
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=4,PlugInUnit=1"
    identity ET-M1
    moType ExchangeTerminal
    exception none
    nrOfAttributes 0
  )

  CREATE
  (
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=4,PlugInUnit=1,ExchangeTerminal=ET-M1
    identity 1
    moType E1PhysPathTerm
    exception none
    nrOfAttributes 0
  )

  CREATE
  (
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=4,PlugInUnit=1"
    identity 1
    moType TuDeviceGroup
    exception none
    nrOfAttributes 0
  )

  CREATE
  (
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=4,PlugInUnit=1,TuDeviceGroup=1"
    identity 1
    moType TimDeviceSet
    exception none
    nrOfAttributes 0
  )

  CREATE
  (
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=4,PlugInUnit=1,TuDeviceGroup=1,TimDeviceSet=1"
    identity 1
    moType TimDevice
    exception none
    nrOfAttributes 0
  )

  CREATE
  (
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=4,PlugInUnit=1
    identity 1
    moType TimingUnit
    exception none
    nrOfAttributes 0
  )

  CREATE
  (
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=4,PlugInUnit=1,TimingUnit=1
    identity 1
    moType TuSyncRef
    exception none
    nrOfAttributes 0
  )

  CREATE
  (
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=24"
    identity 1
    moType PlugInUnit
    exception none
    nrOfAttributes 0
  )

MOSCT
#Creating the reliableprogramuniters

  cat >> $MOSCRIPT$MOFILEEXTENSION << MOSCT

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
  cat >> $MOSCRIPT$MOFILEEXTENSION << MOSCT
  CREATE
  (
    parent "ManagedElement=1,TransportNetwork=1"
    identity 1
    moType Sctp
    exception none
    nrOfAttributes 0
  )
  CREATE
  (
    parent "ManagedElement=1,NodeBFunction=1"
    identity 1
    moType Iub
    exception none
    nrOfAttributes 0
  )
  CREATE
  (
    parent "ManagedElement=1,SwManagement=1"
    identity sctp
    moType ReliableProgramUniter
    exception none
    nrOfAttributes 0
  )
MOSCT
# Creating the ATM port first as all the RBS nodes will link up to this port

  echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
  echo '(' >> $MOSCRIPT$MOFILEEXTENSION
  echo '  parent "ManagedElement=1,TransportNetwork=1"' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   identity 1-1-1' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   moType AtmPort' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   nrOfAttributes 1' >> $MOSCRIPT$MOFILEEXTENSION
  #echo '   uses Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=1,PlugInUnit=1,ExchangeTerminal=ET-MFG,Os155SpiTtp=ta1,Sts3CspeTtp=ta1"' >> $MOSCRIPT$MOFILEEXTENSION
  echo ')' >> $MOSCRIPT$MOFILEEXTENSION

  echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
  echo '(' >> $MOSCRIPT$MOFILEEXTENSION
  echo '  parent "ManagedElement=1,TransportNetwork=1"' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   identity 1-1-3' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   moType AtmPort' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   nrOfAttributes 1' >> $MOSCRIPT$MOFILEEXTENSION
  #echo '   uses Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=1,PlugInUnit=1,ExchangeTerminal=ET-MFG,Os155SpiTtp=ta1,Sts3CspeTtp=ta1"' >> $MOSCRIPT$MOFILEEXTENSION
  echo ')' >> $MOSCRIPT$MOFILEEXTENSION
  
  echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
  echo '(' >> $MOSCRIPT$MOFILEEXTENSION
  echo '  parent "ManagedElement=1,TransportNetwork=1"' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   identity 1-1-4' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   moType AtmPort' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   nrOfAttributes 1' >> $MOSCRIPT$MOFILEEXTENSION
  #echo '   uses Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=1,PlugInUnit=1,ExchangeTerminal=ET-MFG,Os155SpiTtp=ta1,Sts3CspeTtp=ta1"' >> $MOSCRIPT$MOFILEEXTENSION
  echo ')' >> $MOSCRIPT$MOFILEEXTENSION

  echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
  echo '(' >> $MOSCRIPT$MOFILEEXTENSION
  echo '  parent "ManagedElement=1,TransportNetwork=1"' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   identity 1-1-5' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   moType AtmPort' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   nrOfAttributes 1' >> $MOSCRIPT$MOFILEEXTENSION
  #echo '   uses Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=1,PlugInUnit=1,ExchangeTerminal=ET-MFG,Os155SpiTtp=ta1,Sts3CspeTtp=ta1"' >> $MOSCRIPT$MOFILEEXTENSION
  echo ')' >> $MOSCRIPT$MOFILEEXTENSION

  echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
  echo '(' >> $MOSCRIPT$MOFILEEXTENSION
  echo '  parent "ManagedElement=1,TransportNetwork=1"' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   identity 1-1-6' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   moType AtmPort' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   nrOfAttributes 1' >> $MOSCRIPT$MOFILEEXTENSION
  #echo '   uses Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=1,PlugInUnit=1,ExchangeTerminal=ET-MFG,Os155SpiTtp=ta1,Sts3CspeTtp=ta1"' >> $MOSCRIPT$MOFILEEXTENSION
  echo ')' >> $MOSCRIPT$MOFILEEXTENSION

  echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
  echo '(' >> $MOSCRIPT$MOFILEEXTENSION
  echo '  parent "ManagedElement=1,TransportNetwork=1"' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   identity 1-1-7' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   moType AtmPort' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   nrOfAttributes 1' >> $MOSCRIPT$MOFILEEXTENSION
  #echo '   uses Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=1,PlugInUnit=1,ExchangeTerminal=ET-MFG,Os155SpiTtp=ta1,Sts3CspeTtp=ta1"' >> $MOSCRIPT$MOFILEEXTENSION
  echo ')' >> $MOSCRIPT$MOFILEEXTENSION
 
  echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
  echo '(' >> $MOSCRIPT$MOFILEEXTENSION
  echo '  parent "ManagedElement=1,TransportNetwork=1"' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   identity 1-1-8' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   moType AtmPort' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   nrOfAttributes 1' >> $MOSCRIPT$MOFILEEXTENSION
  #echo '   uses Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=1,PlugInUnit=1,ExchangeTerminal=ET-MFG,Os155SpiTtp=ta1,Sts3CspeTtp=ta1"' >> $MOSCRIPT$MOFILEEXTENSION
  echo ')' >> $MOSCRIPT$MOFILEEXTENSION

# Creating the ATMTrafficDescriptors now calles C1P4528 C2P4000 U3P1000M80
  VAR=1
  while [ "$VAR" -le 3 ]
  do

    case "$VAR"
    in
      1) ID=C1P4528;;
      2) ID=C2P4000;;
      3) ID=U3P1000M80;;
    esac

    echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
    echo '(' >> $MOSCRIPT$MOFILEEXTENSION
    echo '  parent "ManagedElement=1,TransportNetwork=1"' >> $MOSCRIPT$MOFILEEXTENSION
    echo '   identity '$ID >> $MOSCRIPT$MOFILEEXTENSION
    echo '   moType AtmTrafficDescriptor' >> $MOSCRIPT$MOFILEEXTENSION
    echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
    echo '   nrOfAttributes 0' >> $MOSCRIPT$MOFILEEXTENSION
    echo ')' >> $MOSCRIPT$MOFILEEXTENSION

    let VAR=$VAR+1
  done
# creating the UniSaalProfile below
  echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
  echo '(' >> $MOSCRIPT$MOFILEEXTENSION
  echo '  parent "ManagedElement=1,TransportNetwork=1"' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   identity 1' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   moType UniSaalProfile' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   nrOfAttributes 0' >> $MOSCRIPT$MOFILEEXTENSION
  echo ')' >> $MOSCRIPT$MOFILEEXTENSION

# Creating Aal2QosProfile and Aal2QosCodePointProfile

  echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
  echo '(' >> $MOSCRIPT$MOFILEEXTENSION
  echo '  parent "ManagedElement=1,TransportNetwork=1"' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   identity 1' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   moType Aal2QosProfile' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   nrOfAttributes 0' >> $MOSCRIPT$MOFILEEXTENSION
  echo ')' >> $MOSCRIPT$MOFILEEXTENSION

  echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
  echo '(' >> $MOSCRIPT$MOFILEEXTENSION
  echo '  parent "ManagedElement=1,TransportNetwork=1"' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   identity 1' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   moType Aal2QosCodePointProfile' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   nrOfAttributes 0' >> $MOSCRIPT$MOFILEEXTENSION
  echo ')' >> $MOSCRIPT$MOFILEEXTENSION

  echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
  echo '(' >> $MOSCRIPT$MOFILEEXTENSION
  echo '  parent "ManagedElement=1,TransportNetwork=1"' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   identity 1' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   moType Aal2Sp' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   nrOfAttributes 0' >> $MOSCRIPT$MOFILEEXTENSION
  echo ')' >> $MOSCRIPT$MOFILEEXTENSION


# Creating the VplTp's for the AtmPorts

  echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
  echo '(' >> $MOSCRIPT$MOFILEEXTENSION
  echo '  parent "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1"' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   identity vp'$COUNT >> $MOSCRIPT$MOFILEEXTENSION
  echo '   moType VplTp' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   nrOfAttributes 0' >> $MOSCRIPT$MOFILEEXTENSION
  echo ')' >> $MOSCRIPT$MOFILEEXTENSION

  echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
  echo '(' >> $MOSCRIPT$MOFILEEXTENSION
  echo '  parent "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=vp'$COUNT'"' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   identity 1' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   moType VpcTp' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   nrOfAttributes 0' >> $MOSCRIPT$MOFILEEXTENSION
  echo ')' >> $MOSCRIPT$MOFILEEXTENSION
 
  echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
  echo '(' >> $MOSCRIPT$MOFILEEXTENSION
  echo '  parent "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-3"' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   identity vp'$COUNT >> $MOSCRIPT$MOFILEEXTENSION
  echo '   moType VplTp' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   nrOfAttributes 0' >> $MOSCRIPT$MOFILEEXTENSION
  echo ')' >> $MOSCRIPT$MOFILEEXTENSION
  echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
  echo '(' >> $MOSCRIPT$MOFILEEXTENSION
  echo '  parent "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-3,VplTp=vp'$COUNT'"' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   identity 1' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   moType VpcTp' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   nrOfAttributes 0' >> $MOSCRIPT$MOFILEEXTENSION
  echo ')' >> $MOSCRIPT$MOFILEEXTENSION

  echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
  echo '(' >> $MOSCRIPT$MOFILEEXTENSION
  echo '  parent "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-4"' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   identity vp'$COUNT >> $MOSCRIPT$MOFILEEXTENSION
  echo '   moType VplTp' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   nrOfAttributes 0' >> $MOSCRIPT$MOFILEEXTENSION
  echo ')' >> $MOSCRIPT$MOFILEEXTENSION
  echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
  echo '(' >> $MOSCRIPT$MOFILEEXTENSION
  echo '  parent "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-4,VplTp=vp'$COUNT'"' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   identity 1' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   moType VpcTp' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   nrOfAttributes 0' >> $MOSCRIPT$MOFILEEXTENSION
  echo ')' >> $MOSCRIPT$MOFILEEXTENSION

  echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
  echo '(' >> $MOSCRIPT$MOFILEEXTENSION
  echo '  parent "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-5"' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   identity vp'$COUNT >> $MOSCRIPT$MOFILEEXTENSION
  echo '   moType VplTp' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   nrOfAttributes 0' >> $MOSCRIPT$MOFILEEXTENSION
  echo ')' >> $MOSCRIPT$MOFILEEXTENSION
  echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
  echo '(' >> $MOSCRIPT$MOFILEEXTENSION
  echo '  parent "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-5,VplTp=vp'$COUNT'"' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   identity 1' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   moType VpcTp' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   nrOfAttributes 0' >> $MOSCRIPT$MOFILEEXTENSION
  echo ')' >> $MOSCRIPT$MOFILEEXTENSION
 
  echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
  echo '(' >> $MOSCRIPT$MOFILEEXTENSION
  echo '  parent "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-6"' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   identity vp'$COUNT >> $MOSCRIPT$MOFILEEXTENSION
  echo '   moType VplTp' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   nrOfAttributes 0' >> $MOSCRIPT$MOFILEEXTENSION
  echo ')' >> $MOSCRIPT$MOFILEEXTENSION
  echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
  echo '(' >> $MOSCRIPT$MOFILEEXTENSION
  echo '  parent "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-6,VplTp=vp'$COUNT'"' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   identity 1' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   moType VpcTp' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   nrOfAttributes 0' >> $MOSCRIPT$MOFILEEXTENSION
  echo ')' >> $MOSCRIPT$MOFILEEXTENSION
  
  echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
  echo '(' >> $MOSCRIPT$MOFILEEXTENSION
  echo '  parent "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-7"' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   identity vp'$COUNT >> $MOSCRIPT$MOFILEEXTENSION
  echo '   moType VplTp' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   nrOfAttributes 0' >> $MOSCRIPT$MOFILEEXTENSION
  echo ')' >> $MOSCRIPT$MOFILEEXTENSION
  echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
  echo '(' >> $MOSCRIPT$MOFILEEXTENSION
  echo '  parent "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-7,VplTp=vp'$COUNT'"' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   identity 1' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   moType VpcTp' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   nrOfAttributes 0' >> $MOSCRIPT$MOFILEEXTENSION
  echo ')' >> $MOSCRIPT$MOFILEEXTENSION
 
  echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
  echo '(' >> $MOSCRIPT$MOFILEEXTENSION
  echo '  parent "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-8"' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   identity vp'$COUNT >> $MOSCRIPT$MOFILEEXTENSION
  echo '   moType VplTp' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   nrOfAttributes 0' >> $MOSCRIPT$MOFILEEXTENSION
  echo ')' >> $MOSCRIPT$MOFILEEXTENSION
  echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
  echo '(' >> $MOSCRIPT$MOFILEEXTENSION
  echo '  parent "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-8,VplTp=vp'$COUNT'"' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   identity 1' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   moType VpcTp' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   nrOfAttributes 0' >> $MOSCRIPT$MOFILEEXTENSION
  echo ')' >> $MOSCRIPT$MOFILEEXTENSION
  

  COUNT2=1
  while [ "$COUNT2" -le 10 ]
  do

    case "$COUNT2"
    in
      1) VCLTPID=vc32-x;;
      2) VCLTPID=vc33-x;;
      3) VCLTPID=vc36;;
      4) VCLTPID=vc43;;
      5) VCLTPID=vc37;;
      6) VCLTPID=vc44;;
      7) VCLTPID=vc38;;
      8) VCLTPID=vc45;;
      9) VCLTPID=vc39;;
      10) VCLTPID=vc40;;
    esac

    echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
    echo '(' >> $MOSCRIPT$MOFILEEXTENSION
    echo '  parent "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=vp'$COUNT',VpcTp=1"' >> $MOSCRIPT$MOFILEEXTENSION
    echo '   identity '$VCLTPID >> $MOSCRIPT$MOFILEEXTENSION
    echo '   moType VclTp' >> $MOSCRIPT$MOFILEEXTENSION
    echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
    echo '   nrOfAttributes 0' >> $MOSCRIPT$MOFILEEXTENSION
    echo ')' >> $MOSCRIPT$MOFILEEXTENSION
    COUNT2=`expr $COUNT2 + 1`
  done

# Creating the VclTp's under each of the 1-1-1 Atmports

  echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
  echo '(' >> $MOSCRIPT$MOFILEEXTENSION
  echo '  parent "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-3,VplTp=vp'$COUNT',VpcTp=1"' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   identity vc46'  >> $MOSCRIPT$MOFILEEXTENSION
  echo '   moType VclTp' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
  echo '   nrOfAttributes 0' >> $MOSCRIPT$MOFILEEXTENSION
  echo ')' >> $MOSCRIPT$MOFILEEXTENSION
  
echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
echo '(' >> $MOSCRIPT$MOFILEEXTENSION
echo '  parent "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-4,VplTp=vp'$COUNT',VpcTp=1"' >> $MOSCRIPT$MOFILEEXTENSION
echo '   identity vc47'  >> $MOSCRIPT$MOFILEEXTENSION
echo '   moType VclTp' >> $MOSCRIPT$MOFILEEXTENSION
echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
echo '   nrOfAttributes 0' >> $MOSCRIPT$MOFILEEXTENSION
echo ')' >> $MOSCRIPT$MOFILEEXTENSION



### Create 
echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
echo '(' >> $MOSCRIPT$MOFILEEXTENSION
echo '  parent "ManagedElement=1,TransportNetwork=1"' >> $MOSCRIPT$MOFILEEXTENSION
echo '   identity 1 '  >> $MOSCRIPT$MOFILEEXTENSION
echo '   moType Aal2RoutingCase' >> $MOSCRIPT$MOFILEEXTENSION
echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
echo '   nrOfAttributes 1' >> $MOSCRIPT$MOFILEEXTENSION
echo '   numberDirection String '$COUNT'AFaf09' >> $MOSCRIPT$MOFILEEXTENSION
echo ')' >> $MOSCRIPT$MOFILEEXTENSION


# Creating IpRouting tables
echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
echo '(' >> $MOSCRIPT$MOFILEEXTENSION
echo '  parent "ManagedElement=1,IpOam=1"' >> $MOSCRIPT$MOFILEEXTENSION
echo '   identity 1'  >> $MOSCRIPT$MOFILEEXTENSION
echo '   moType Ip' >> $MOSCRIPT$MOFILEEXTENSION
echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
echo '   nrOfAttributes 0' >> $MOSCRIPT$MOFILEEXTENSION
echo ')' >> $MOSCRIPT$MOFILEEXTENSION


echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
echo '(' >> $MOSCRIPT$MOFILEEXTENSION
echo '  parent "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-5,VplTp=vp'$COUNT',VpcTp=1"' >> $MOSCRIPT$MOFILEEXTENSION
echo '   identity vc48'  >> $MOSCRIPT$MOFILEEXTENSION
echo '   moType VclTp' >> $MOSCRIPT$MOFILEEXTENSION
echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
echo '   nrOfAttributes 0' >> $MOSCRIPT$MOFILEEXTENSION
echo ')' >> $MOSCRIPT$MOFILEEXTENSION

echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
echo '(' >> $MOSCRIPT$MOFILEEXTENSION
echo '  parent "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-6,VplTp=vp'$COUNT',VpcTp=1"' >> $MOSCRIPT$MOFILEEXTENSION
echo '   identity vc49'  >> $MOSCRIPT$MOFILEEXTENSION
echo '   moType VclTp' >> $MOSCRIPT$MOFILEEXTENSION
echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
echo '   nrOfAttributes 0' >> $MOSCRIPT$MOFILEEXTENSION
echo ')' >> $MOSCRIPT$MOFILEEXTENSION

echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
echo '(' >> $MOSCRIPT$MOFILEEXTENSION
echo '  parent "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-7,VplTp=vp'$COUNT',VpcTp=1"' >> $MOSCRIPT$MOFILEEXTENSION
echo '   identity vc50'  >> $MOSCRIPT$MOFILEEXTENSION
echo '   moType VclTp' >> $MOSCRIPT$MOFILEEXTENSION
echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
echo '   nrOfAttributes 0' >> $MOSCRIPT$MOFILEEXTENSION
echo ')' >> $MOSCRIPT$MOFILEEXTENSION

echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
echo '(' >> $MOSCRIPT$MOFILEEXTENSION
echo '  parent "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-8,VplTp=vp'$COUNT',VpcTp=1"' >> $MOSCRIPT$MOFILEEXTENSION
echo '   identity vc51'  >> $MOSCRIPT$MOFILEEXTENSION
echo '   moType VclTp' >> $MOSCRIPT$MOFILEEXTENSION
echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
echo '   nrOfAttributes 0' >> $MOSCRIPT$MOFILEEXTENSION
echo ')' >> $MOSCRIPT$MOFILEEXTENSION

# Below is creating the Aal5TpVccTp's 
 COUNT2=1
 while [ "$COUNT2" -le 8 ]
 do

 case "$COUNT2"
 in
   1) ID=b"$COUNT"da;;
   2) ID=b"$COUNT"ca;;
   3) ID=b"$COUNT"db;;
   4) ID=b"$COUNT"cb;;
   5) ID=b"$COUNT"qa;;
   6) ID=b"$COUNT"qb;;
   7) ID=b"$COUNT"-x1;;
   8) ID=b"$COUNT"-x2;;

 esac

echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
echo '(' >> $MOSCRIPT$MOFILEEXTENSION
echo '  parent "ManagedElement=1,TransportNetwork=1"' >> $MOSCRIPT$MOFILEEXTENSION
echo '   identity '$ID >> $MOSCRIPT$MOFILEEXTENSION
echo '   moType Aal5TpVccTp' >> $MOSCRIPT$MOFILEEXTENSION
echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
echo '   nrOfAttributes 0' >> $MOSCRIPT$MOFILEEXTENSION
echo ')' >> $MOSCRIPT$MOFILEEXTENSION

COUNT2=`expr $COUNT2 + 1`
done

#Creating the UniSaalTp's under Transport network

 COUNT2=1
 while [ "$COUNT2" -le 6 ]
 do

 case "$COUNT2"
 in
   1) ID=b"$COUNT"da;;
   2) ID=b"$COUNT"ca;;
   3) ID=b"$COUNT"db;;
   4) ID=b"$COUNT"cb;;
   5) ID=b"$COUNT"qa;;
   6) ID=b"$COUNT"qb;;

 esac

echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
echo '(' >> $MOSCRIPT$MOFILEEXTENSION
echo '  parent "ManagedElement=1,TransportNetwork=1"' >> $MOSCRIPT$MOFILEEXTENSION
echo '   identity '$ID >> $MOSCRIPT$MOFILEEXTENSION
echo '   moType UniSaalTp' >> $MOSCRIPT$MOFILEEXTENSION
echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
echo '   nrOfAttributes 0' >> $MOSCRIPT$MOFILEEXTENSION
echo ')' >> $MOSCRIPT$MOFILEEXTENSION

COUNT2=`expr $COUNT2 + 1`
done

OPERATIONALSTATE=1  # 0:DISABLED, 1:ENABLED


    echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
    echo '(' >> $MOSCRIPT$MOFILEEXTENSION
    echo '  parent "ManagedElement=1,NodeBFunction=1,Iub=1"' >> $MOSCRIPT$MOFILEEXTENSION
    echo ' identity 1' >> $MOSCRIPT$MOFILEEXTENSION
    echo ' moType NbapCommon' >> $MOSCRIPT$MOFILEEXTENSION
    echo ' exception none' >> $MOSCRIPT$MOFILEEXTENSION
    echo ' nrOfAttributes 3' >> $MOSCRIPT$MOFILEEXTENSION
    #echo ' activeUniSaalTpRef Ref "ManagedElement=1,TransportNetwork=1,UniSaalTp=b'$COUNT'ca"' >> $MOSCRIPT$MOFILEEXTENSION
    #echo ' standbyUniSaalTpRef Ref "ManagedElement=1,TransportNetwork=1,UniSaalTp=b'$COUNT'cb"' >> $MOSCRIPT$MOFILEEXTENSION
    echo '   operationalState Integer '$OPERATIONALSTATE >> $MOSCRIPT$MOFILEEXTENSION
    echo ')' >> $MOSCRIPT$MOFILEEXTENSION


    echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
    echo '(' >> $MOSCRIPT$MOFILEEXTENSION
    echo '  parent "ManagedElement=1,NodeBFunction=1,Iub=1"' >> $MOSCRIPT$MOFILEEXTENSION
    echo ' identity 1' >> $MOSCRIPT$MOFILEEXTENSION
    echo ' moType NbapDedicated' >> $MOSCRIPT$MOFILEEXTENSION
    echo ' exception none' >> $MOSCRIPT$MOFILEEXTENSION
    echo ' nrOfAttributes 3' >> $MOSCRIPT$MOFILEEXTENSION
    #echo ' activeUniSaalTpRef Ref "ManagedElement=1,TransportNetwork=1,UniSaalTp=b'$COUNT'da"' >> $MOSCRIPT$MOFILEEXTENSION
    #echo ' standbyUniSaalTpRef Ref "ManagedElement=1,TransportNetwork=1,UniSaalTp=b'$COUNT'db"' >> $MOSCRIPT$MOFILEEXTENSION
    echo '   operationalState Integer '$OPERATIONALSTATE >> $MOSCRIPT$MOFILEEXTENSION
    echo ')' >> $MOSCRIPT$MOFILEEXTENSION

# Creating extra Aal2PathVccTp's for high speed 
 COUNT2=1
 while [ "$COUNT2" -le 8 ]
 do

 case "$COUNT2"
 in
   1) ID=b"$COUNT"a1;;
   2) ID=b"$COUNT"a2;;
   3) ID=b"$COUNT"a3;;
   4) ID=b"$COUNT"a4;;
   5) ID=b"$COUNT"a5;;
   6) ID=b"$COUNT"a6;;
   7) ID=b"$COUNT"a7;;
   8) ID=b"$COUNT"a8;;
 esac

echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
echo '(' >> $MOSCRIPT$MOFILEEXTENSION
echo '  parent "ManagedElement=1,TransportNetwork=1"' >> $MOSCRIPT$MOFILEEXTENSION
echo '   identity '$ID'' >> $MOSCRIPT$MOFILEEXTENSION
echo '   moType Aal2PathVccTp' >> $MOSCRIPT$MOFILEEXTENSION
echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
echo '   nrOfAttributes 0' >> $MOSCRIPT$MOFILEEXTENSION
echo ')' >> $MOSCRIPT$MOFILEEXTENSION

let COUNT2=$COUNT2+1
done
# Creating Aal2Ap under Aal2Sp

echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
echo '(' >> $MOSCRIPT$MOFILEEXTENSION
echo '  parent "ManagedElement=1,TransportNetwork=1,Aal2Sp=1"' >> $MOSCRIPT$MOFILEEXTENSION
echo '   identity '$COUNT >> $MOSCRIPT$MOFILEEXTENSION
echo '   moType Aal2Ap' >> $MOSCRIPT$MOFILEEXTENSION
echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
echo '   nrOfAttributes 0' >> $MOSCRIPT$MOFILEEXTENSION
echo ')' >> $MOSCRIPT$MOFILEEXTENSION

echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
echo '(' >> $MOSCRIPT$MOFILEEXTENSION
echo '  parent "ManagedElement=1,TransportNetwork=1,Aal2Sp=1,Aal2Ap='$COUNT'"' >> $MOSCRIPT$MOFILEEXTENSION
echo '   identity 1' >> $MOSCRIPT$MOFILEEXTENSION
echo '   moType Aal2PathDistributionUnit' >> $MOSCRIPT$MOFILEEXTENSION
echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
echo '   nrOfAttributes 0' >> $MOSCRIPT$MOFILEEXTENSION
echo ')' >> $MOSCRIPT$MOFILEEXTENSION

echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
echo '(' >> $MOSCRIPT$MOFILEEXTENSION
echo '  parent "ManagedElement=1,TransportNetwork=1"' >> $MOSCRIPT$MOFILEEXTENSION
echo '   identity' '$COUNT' >> $MOSCRIPT$MOFILEEXTENSION
echo '   moType Aal2RoutingCase' >> $MOSCRIPT$MOFILEEXTENSION
echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
echo '   nrOfAttributes 1' >> $MOSCRIPT$MOFILEEXTENSION
echo '   numberDirection String '$COUNT'AFaf09' >> $MOSCRIPT$MOFILEEXTENSION
echo ')' >> $MOSCRIPT$MOFILEEXTENSION


########################################
#
# Setting the MO references now
#
########################################

echo 'SET' >> $MOSCRIPT$MOFILEEXTENSION
echo '(' >> $MOSCRIPT$MOFILEEXTENSION
echo '  mo "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=vp'$COUNT'"' >> $MOSCRIPT$MOFILEEXTENSION
echo '   identity Vp'$COUNT >> $MOSCRIPT$MOFILEEXTENSION
echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
echo '   nrOfAttributes 2' >> $MOSCRIPT$MOFILEEXTENSION
echo '   atmTrafficDescriptor Ref "ManagedElement=1,TransportNetwork=1,AtmTrafficDescriptor=C1P4528"' >> $MOSCRIPT$MOFILEEXTENSION
echo '   externalVpi Integer '$COUNT >> $MOSCRIPT$MOFILEEXTENSION
echo ')' >> $MOSCRIPT$MOFILEEXTENSION

COUNT2=1
while [ "$COUNT2" -le 10 ]
do

case "$COUNT2"
in
 1) VCI=32; VCLTPID=vc32-x; ATMTRAFFICDESCID=U3P1000M80; USERLABEL='"used by Aal5 b'$COUNT'xa"' ;;
 2) VCI=33; VCLTPID=vc33-x; ATMTRAFFICDESCID=U3P1000M80; USERLABEL='"used by Aal5 b'$COUNT'xb"' ;;
 3) VCI=36; VCLTPID=vc36; ATMTRAFFICDESCID=U3P1000M80; USERLABEL='"used by Aal5 b'$COUNT'ca (Nbap Common)"' ;;
 4) VCI=37; VCLTPID=vc37; ATMTRAFFICDESCID=U3P1000M80; USERLABEL='"used by Aal5 b'$COUNT'da (Nbap Dedicated)"' ;;
 5) VCI=38; VCLTPID=vc38; ATMTRAFFICDESCID=U3P1000M80; USERLABEL='"used by Aal5 b'$COUNT'qa (Aal2 signalling)"' ;;
 6) VCI=39; VCLTPID=vc39; ATMTRAFFICDESCID=U3P1000M80; USERLABEL='"used by Aal2 b'$COUNT'a1 (AAl2PDU)"' ;;
 7) VCI=40; VCLTPID=vc40; ATMTRAFFICDESCID=U3P1000M80; USERLABEL='"used by Aal5 b'$COUNT'a2 (Al2PDU)"';;
 8) VCI=43; VCLTPID=vc43; ATMTRAFFICDESCID=C2P4000; USERLABEL='"used by Aal5 b'$COUNT'cb (Nbap Common)"' ;;
 9) VCI=44; VCLTPID=vc44; ATMTRAFFICDESCID=U3P1000M80; USERLABEL='"used by Aal5 b'$COUNT'db (Nbap Dedicated)"' ;;
10) VCI=45; VCLTPID=vc45; ATMTRAFFICDESCID=U3P1000M80; USERLABEL='"used by Aal5 b'$COUNT'qb (Aal2 signalling)"' ;;
esac



echo 'SET' >> $MOSCRIPT$MOFILEEXTENSION
echo '(' >> $MOSCRIPT$MOFILEEXTENSION
echo '  mo "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=vp'$COUNT',VpcTp=1,VclTp='$VCLTPID'"' >> $MOSCRIPT$MOFILEEXTENSION
echo '   identity '$VCLTPID >> $MOSCRIPT$MOFILEEXTENSION
echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
echo '   nrOfAttributes 3' >> $MOSCRIPT$MOFILEEXTENSION
echo '   atmTrafficDescriptorId Ref "ManagedElement=1,TransportNetwork=1,AtmTrafficDescriptor='$ATMTRAFFICDESCID'"' >> $MOSCRIPT$MOFILEEXTENSION
echo '   externalVci Integer '$VCI >> $MOSCRIPT$MOFILEEXTENSION
echo '   userLabel String '$USERLABEL >> $MOSCRIPT$MOFILEEXTENSION
echo ')' >> $MOSCRIPT$MOFILEEXTENSION


COUNT2=`expr $COUNT2 + 1`
done


 COUNT2=1
 while [ "$COUNT2" -le 8 ]
 do

 case "$COUNT2"
 in
   1) ID=b"$COUNT"da; VCLID='"ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=vp'$COUNT',VpcTp=1,VclTp=vc37"';;
   2) ID=b"$COUNT"ca; VCLID='"ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=vp'$COUNT',VpcTp=1,VclTp=vc36"';;
   3) ID=b"$COUNT"db; VCLID='"ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=vp'$COUNT',VpcTp=1,VclTp=vc44"';;
   4) ID=b"$COUNT"cb; VCLID='"ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=vp'$COUNT',VpcTp=1,VclTp=vc43"';;
   5) ID=b"$COUNT"qa; VCLID='"ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=vp'$COUNT',VpcTp=1,VclTp=vc38"';;
   6) ID=b"$COUNT"qb; VCLID='"ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=vp'$COUNT',VpcTp=1,VclTp=vc45"';;
   7) ID=b"$COUNT"-x1; VCLID='"ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=vp'$COUNT',VpcTp=1,VclTp=vc32-x"';;
   8) ID=b"$COUNT"-x2; VCLID='"ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=vp'$COUNT',VpcTp=1,VclTp=vc33-x"';;

 esac

echo 'SET' >> $MOSCRIPT$MOFILEEXTENSION
echo '(' >> $MOSCRIPT$MOFILEEXTENSION
echo '  mo "ManagedElement=1,TransportNetwork=1,Aal5TpVccTp='$ID'"' >> $MOSCRIPT$MOFILEEXTENSION
echo '   identity '$ID >> $MOSCRIPT$MOFILEEXTENSION
echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
echo '   nrOfAttributes 2' >> $MOSCRIPT$MOFILEEXTENSION
echo '    processorId Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=24,PlugInUnit=1"' >> $MOSCRIPT$MOFILEEXTENSION
echo '    vclTpId Ref '$VCLID >> $MOSCRIPT$MOFILEEXTENSION
echo ')' >> $MOSCRIPT$MOFILEEXTENSION

COUNT2=`expr $COUNT2 + 1`
done


# Setting the uniSaalProfileId's here
COUNT2=1
 while [ "$COUNT2" -le 6 ]
 do

 case "$COUNT2"
 in
   1) ID=b"$COUNT"da; Aal5Ref='"ManagedElement=1,TransportNetwork=1,Aal5TpVccTp=b'$COUNT'da"';;
   2) ID=b"$COUNT"ca; Aal5Ref='"ManagedElement=1,TransportNetwork=1,Aal5TpVccTp=b'$COUNT'ca"';;
   3) ID=b"$COUNT"db; Aal5Ref='"ManagedElement=1,TransportNetwork=1,Aal5TpVccTp=b'$COUNT'db"';;
   4) ID=b"$COUNT"cb; Aal5Ref='"ManagedElement=1,TransportNetwork=1,Aal5TpVccTp=b'$COUNT'cb"';;
   5) ID=b"$COUNT"qa; Aal5Ref='"ManagedElement=1,TransportNetwork=1,Aal5TpVccTp=b'$COUNT'qa"';;
   6) ID=b"$COUNT"qb; Aal5Ref='"ManagedElement=1,TransportNetwork=1,Aal5TpVccTp=b'$COUNT'qb"';;
 esac

echo 'SET' >> $MOSCRIPT$MOFILEEXTENSION
echo '(' >> $MOSCRIPT$MOFILEEXTENSION
echo '  mo "ManagedElement=1,TransportNetwork=1,UniSaalTp='$ID'"' >> $MOSCRIPT$MOFILEEXTENSION
echo '   identity '$ID >> $MOSCRIPT$MOFILEEXTENSION
echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
echo '   nrOfAttributes 2' >> $MOSCRIPT$MOFILEEXTENSION
echo '   aal5TpVccTpId Ref '$Aal5Ref >> $MOSCRIPT$MOFILEEXTENSION
echo '   uniSaalProfileId Ref "ManagedElement=1,TransportNetwork=1,UniSaalProfile=1"' >> $MOSCRIPT$MOFILEEXTENSION
echo ')' >> $MOSCRIPT$MOFILEEXTENSION

COUNT2=`expr $COUNT2 + 1`
done


COUNT2=1
while [ "$COUNT2" -le 8 ]
do

case "$COUNT2"
    in
    1) aal2path=1; vclTpIdRef="ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=vp$COUNT,VpcTp=1,VclTp=vc39";;
    2) aal2path=2; vclTpIdRef="ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=vp$COUNT,VpcTp=1,VclTp=vc40";;
    3) aal2path=3; vclTpIdRef="ManagedElement=1,TransportNetwork=1,AtmPort=1-1-3,VplTp=vp$COUNT,VpcTp=1,VclTp=vc46";;
    4) aal2path=4; vclTpIdRef="ManagedElement=1,TransportNetwork=1,AtmPort=1-1-4,VplTp=vp$COUNT,VpcTp=1,VclTp=vc47";;
    5) aal2path=5; vclTpIdRef="ManagedElement=1,TransportNetwork=1,AtmPort=1-1-5,VplTp=vp$COUNT,VpcTp=1,VclTp=vc48";;
    6) aal2path=6; vclTpIdRef="ManagedElement=1,TransportNetwork=1,AtmPort=1-1-6,VplTp=vp$COUNT,VpcTp=1,VclTp=vc49";;
    7) aal2path=7; vclTpIdRef="ManagedElement=1,TransportNetwork=1,AtmPort=1-1-7,VplTp=vp$COUNT,VpcTp=1,VclTp=vc50";;
    8) aal2path=8; vclTpIdRef="ManagedElement=1,TransportNetwork=1,AtmPort=1-1-8,VplTp=vp$COUNT,VpcTp=1,VclTp=vc51";;
    esac
    VAR=1

echo 'SET' >> $MOSCRIPT$MOFILEEXTENSION
echo '(' >> $MOSCRIPT$MOFILEEXTENSION
echo '  mo "ManagedElement=1,TransportNetwork=1,Aal2PathVccTp=b'$COUNT'a'$aal2path'"' >> $MOSCRIPT$MOFILEEXTENSION
echo '   moType Aal2PathVccTp' >> $MOSCRIPT$MOFILEEXTENSION
echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
echo '   nrOfAttributes 2' >> $MOSCRIPT$MOFILEEXTENSION
echo '   vclTpId Ref '$vclTpIdRef' ' >> $MOSCRIPT$MOFILEEXTENSION
echo '   aal2QoSProfileId Ref "ManagedElement=1,TransportNetwork=1,Aal2QosProfile=1"' >> $MOSCRIPT$MOFILEEXTENSION
echo ')' >> $MOSCRIPT$MOFILEEXTENSION
let COUNT2=$COUNT2+1
done

echo 'SET' >> $MOSCRIPT$MOFILEEXTENSION
echo '(' >> $MOSCRIPT$MOFILEEXTENSION
echo '  mo "ManagedElement=1,TransportNetwork=1,Aal2PathVccTp=b'$COUNT'a1"' >> $MOSCRIPT$MOFILEEXTENSION
echo '   moType Aal2PathVccTp' >> $MOSCRIPT$MOFILEEXTENSION
echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
echo '   nrOfAttributes 2' >> $MOSCRIPT$MOFILEEXTENSION
echo '   vclTpId Ref "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-'$VAR',VplTp=vp'$COUNT',VpcTp=1,VclTp=vc39"' >> $MOSCRIPT$MOFILEEXTENSION
echo '   aal2QoSProfileId Ref "ManagedElement=1,TransportNetwork=1,Aal2QosProfile=1"' >> $MOSCRIPT$MOFILEEXTENSION
echo ')' >> $MOSCRIPT$MOFILEEXTENSION


echo 'SET' >> $MOSCRIPT$MOFILEEXTENSION
echo '(' >> $MOSCRIPT$MOFILEEXTENSION
echo '  mo "ManagedElement=1,TransportNetwork=1,Aal2PathVccTp=b'$COUNT'a2"' >> $MOSCRIPT$MOFILEEXTENSION
echo '   moType Aal2PathVccTp' >> $MOSCRIPT$MOFILEEXTENSION
echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
echo '   nrOfAttributes 2' >> $MOSCRIPT$MOFILEEXTENSION
echo '   vclTpId Ref "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-'$VAR',VplTp=vp'$COUNT',VpcTp=1,VclTp=vc40"' >> $MOSCRIPT$MOFILEEXTENSION
echo '   aal2QoSProfileId Ref "ManagedElement=1,TransportNetwork=1,Aal2QosProfile=1"' >> $MOSCRIPT$MOFILEEXTENSION
echo ')' >> $MOSCRIPT$MOFILEEXTENSION

cat >> $MOSCRIPT$MOFILEEXTENSION << MOSCT
SET
(
  mo "ManagedElement=1,TransportNetwork=1,Aal2Sp=1,Aal2Ap=$COUNT"
   identity 1
   exception none
   nrOfAttributes 5
   aal2QoSCodePointProfileId Ref "ManagedElement=1,TransportNetwork=1,Aal2QosCodePointProfile=1"
   rpuId Ref "ManagedElement=1,SwManagement=1,ReliableProgramUniter=ans_aal2ap_12_1"
   sigLinkId Ref "ManagedElement=1,TransportNetwork=1,UniSaalTp=b${COUNT}qa"
   secondarySigLinkId Ref "ManagedElement=1,TransportNetwork=1,UniSaalTp=b${COUNT}qb"
   allocationMode Integer 1
)

MOSCT

echo 'SET' >> $MOSCRIPT$MOFILEEXTENSION
echo '(' >> $MOSCRIPT$MOFILEEXTENSION
echo '  mo "ManagedElement=1,TransportNetwork=1,Aal2Sp=1,Aal2Ap='$COUNT',Aal2PathDistributionUnit=1"' >> $MOSCRIPT$MOFILEEXTENSION
echo '   identity 1' >> $MOSCRIPT$MOFILEEXTENSION
echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
echo '   nrOfAttributes 2' >> $MOSCRIPT$MOFILEEXTENSION
echo '   rpuId Ref "ManagedElement=1,SwManagement=1,ReliableProgramUniter=ans_aal2cpsrc_12_1"' >> $MOSCRIPT$MOFILEEXTENSION
echo '   aal2PathVccTpList Array Ref 8' >> $MOSCRIPT$MOFILEEXTENSION
echo '    "ManagedElement=1,TransportNetwork=1,Aal2PathVccTp=b'$COUNT'a1"' >> $MOSCRIPT$MOFILEEXTENSION
echo '    "ManagedElement=1,TransportNetwork=1,Aal2PathVccTp=b'$COUNT'a2"' >> $MOSCRIPT$MOFILEEXTENSION
echo '    "ManagedElement=1,TransportNetwork=1,Aal2PathVccTp=b'$COUNT'a3"' >> $MOSCRIPT$MOFILEEXTENSION
echo '    "ManagedElement=1,TransportNetwork=1,Aal2PathVccTp=b'$COUNT'a4"' >> $MOSCRIPT$MOFILEEXTENSION
echo '    "ManagedElement=1,TransportNetwork=1,Aal2PathVccTp=b'$COUNT'a5"' >> $MOSCRIPT$MOFILEEXTENSION
echo '    "ManagedElement=1,TransportNetwork=1,Aal2PathVccTp=b'$COUNT'a6"' >> $MOSCRIPT$MOFILEEXTENSION
echo '    "ManagedElement=1,TransportNetwork=1,Aal2PathVccTp=b'$COUNT'a7"' >> $MOSCRIPT$MOFILEEXTENSION
echo '    "ManagedElement=1,TransportNetwork=1,Aal2PathVccTp=b'$COUNT'a8"' >> $MOSCRIPT$MOFILEEXTENSION
echo ')' >> $MOSCRIPT$MOFILEEXTENSION

# Setting the IpAtmLinks below
echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
echo '(' >> $MOSCRIPT$MOFILEEXTENSION
echo '  parent "ManagedElement=1,IpOam=1,Ip=1"' >> $MOSCRIPT$MOFILEEXTENSION
echo '  identity 1 ' >> $MOSCRIPT$MOFILEEXTENSION
echo '  moType IpAtmLink' >> $MOSCRIPT$MOFILEEXTENSION
echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
echo '   nrOfAttributes 1' >> $MOSCRIPT$MOFILEEXTENSION
echo '   aal5TpVccTpId Ref "ManagedElement=1,TransportNetwork=1,Aal5TpVccTp=b'$COUNT'-x1"' >> $MOSCRIPT$MOFILEEXTENSION
echo '   subnetMask  String 255.255.5.4'  >> $MOSCRIPT$MOFILEEXTENSION
echo '   ipAddress  String 10.2.4.6'  >> $MOSCRIPT$MOFILEEXTENSION
echo ')' >> $MOSCRIPT$MOFILEEXTENSION


echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
echo '(' >> $MOSCRIPT$MOFILEEXTENSION
echo '  parent "ManagedElement=1,IpOam=1,Ip=1"' >> $MOSCRIPT$MOFILEEXTENSION
echo '  identity 2 ' >> $MOSCRIPT$MOFILEEXTENSION
echo '  moType IpAtmLink' >> $MOSCRIPT$MOFILEEXTENSION
echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
echo '   nrOfAttributes 1' >> $MOSCRIPT$MOFILEEXTENSION
echo '   aal5TpVccTpId Ref "ManagedElement=1,TransportNetwork=1,Aal5TpVccTp=b'$COUNT'-x2"' >> $MOSCRIPT$MOFILEEXTENSION
echo '   subnetMask  String 255.255.5.3'  >> $MOSCRIPT$MOFILEEXTENSION
echo '   ipAddress  String 10.2.4.5'  >> $MOSCRIPT$MOFILEEXTENSION
echo ')' >> $MOSCRIPT$MOFILEEXTENSION



################### setting the IP routing table
echo 'SET' >> $MOSCRIPT$MOFILEEXTENSION
echo '(' >> $MOSCRIPT$MOFILEEXTENSION
echo ' mo "ManagedElement=1,IpOam=1,Ip=1,IpRoutingTable=1"'>> $MOSCRIPT$MOFILEEXTENSION
echo ' exception none'>> $MOSCRIPT$MOFILEEXTENSION
echo ' nrOfAttributes 2'>>$MOSCRIPT$MOFILEEXTENSION 
echo ' staticRoutes Array Struct 1'>> $MOSCRIPT$MOFILEEXTENSION
echo '       nrOfElements 6'>> $MOSCRIPT$MOFILEEXTENSION
echo '       indexOfStaticRoute Integer 1'>> $MOSCRIPT$MOFILEEXTENSION
echo '        ipAddress String 10.2.2.2'>> $MOSCRIPT$MOFILEEXTENSION
echo '        networkMask String 255.255.3.3'>> $MOSCRIPT$MOFILEEXTENSION
echo '       nextHopIpAddr String 10.1.1.1'>> $MOSCRIPT$MOFILEEXTENSION
echo '       redistribute Boolean true'>> $MOSCRIPT$MOFILEEXTENSION
echo '    routeMetric Integer 2'>> $MOSCRIPT$MOFILEEXTENSION
echo ')'>> $MOSCRIPT$MOFILEEXTENSION

########## Setting the Ethernet link mo

echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
echo '(' >> $MOSCRIPT$MOFILEEXTENSION
echo '  parent "ManagedElement=1,IpOam=1,Ip=1"' >> $MOSCRIPT$MOFILEEXTENSION
echo '   identity 1'  >> $MOSCRIPT$MOFILEEXTENSION
echo '   moType EthernetLink' >> $MOSCRIPT$MOFILEEXTENSION
echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
echo '   nrOfAttributes 3' >> $MOSCRIPT$MOFILEEXTENSION
echo '   subnetMask  String 255.255.255.3'  >> $MOSCRIPT$MOFILEEXTENSION
echo '   interfaceName  String le0'  >> $MOSCRIPT$MOFILEEXTENSION
echo '   broadcastAddress  String 255.255.3.4'  >> $MOSCRIPT$MOFILEEXTENSION
echo ')' >> $MOSCRIPT$MOFILEEXTENSION



echo 'SET' >> $MOSCRIPT$MOFILEEXTENSION
echo '(' >> $MOSCRIPT$MOFILEEXTENSION
echo ' mo "ManagedElement=1,TransportNetwork=1,Aal2RoutingCase=1"'>>$MOSCRIPT$MOFILEEXTENSION
echo '   identity 1' >> $MOSCRIPT$MOFILEEXTENSION
echo ' exception none'>> $MOSCRIPT$MOFILEEXTENSION
echo ' nrOfAttributes 1'>> $MOSCRIPT$MOFILEEXTENSION
echo ' routeList Array Ref 1'>> $MOSCRIPT$MOFILEEXTENSION
echo ' "ManagedElement=1,TransportNetwork=1,Aal2Sp=1,Aal2Ap='$COUNT'"'>> $MOSCRIPT$MOFILEEXTENSION
echo ')' >> $MOSCRIPT$MOFILEEXTENSION




COUNT2=1
COUNT6=3
while [ "$COUNT2" -le 6 ]
do

case "$COUNT2"
in
 1) VCI=46; VCLTPID=vc46; ATMTRAFFICDESCID=U3P1000M80; USERLABEL='"used by Aal2 b'$COUNT'a3 (Al2PDU)"';;
 2) VCI=47; VCLTPID=vc47; ATMTRAFFICDESCID=U3P1000M80; USERLABEL='"used by Aal2 b'$COUNT'a3 (Al2PDU)"';;
 3) VCI=48; VCLTPID=vc48; ATMTRAFFICDESCID=U3P1000M80; USERLABEL='"used by Aal2 b'$COUNT'a5 (Al2PDU)"';;
 4) VCI=49; VCLTPID=vc49; ATMTRAFFICDESCID=U3P1000M80; USERLABEL='"used by Aal2 b'$COUNT'a6 (Al2PDU)"';;
 5) VCI=50; VCLTPID=vc50; ATMTRAFFICDESCID=U3P1000M80; USERLABEL='"used by Aal2 b'$COUNT'a7 (Al2PDU)"';;
 6) VCI=51; VCLTPID=vc51; ATMTRAFFICDESCID=U3P1000M80; USERLABEL='"used by Aal2 b'$COUNT'a8 (Al2PDU)"';;
 


esac



echo 'SET' >> $MOSCRIPT$MOFILEEXTENSION
echo '(' >> $MOSCRIPT$MOFILEEXTENSION
echo '  mo "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-'$COUNT6',VplTp=vp'$COUNT',VpcTp=1,VclTp='$VCLTPID'"' >> $MOSCRIPT$MOFILEEXTENSION
echo '   identity '$VCLTPID >> $MOSCRIPT$MOFILEEXTENSION
echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
echo '   nrOfAttributes 3' >> $MOSCRIPT$MOFILEEXTENSION
echo '   atmTrafficDescriptorId Ref "ManagedElement=1,TransportNetwork=1,AtmTrafficDescriptor='$ATMTRAFFICDESCID'"' >> $MOSCRIPT$MOFILEEXTENSION
echo '   externalVci Integer '$VCI >> $MOSCRIPT$MOFILEEXTENSION
echo '   userLabel String '$USERLABEL >> $MOSCRIPT$MOFILEEXTENSION
echo ')' >> $MOSCRIPT$MOFILEEXTENSION

COUNT2=`expr $COUNT2 + 1`
COUNT6=`expr $COUNT6 + 1`

done




  #echo "MAKING MML SCRIPT"
  #########################################
  # Make MML Script
  #########################################
  cat >> $MMLSCRIPT << MMLSCT

  .open $SIMNAME
  .select $RNCNAME$RBSNAME$COUNT
  .start
  useattributecharacteristics:switch="off";
  kertayle:file="$PWD/$MOSCRIPT$MOFILEEXTENSION";

MMLSCT

  echo "rm $PWD/$MOSCRIPT$MOFILEEXTENSION " >> $DEL1 # Script to clean up all the generated MO scripts

  MOFILECOUNT=`expr $MOFILECOUNT + 1`
  COUNT=`expr $COUNT + 1`
done


echo "//.....$0:$SIMNAME MAKING MO SCRIPT RBS_TRANS ended running at "`date`
echo "//"

################################################
 $NETSIMDIR/$NETSIMVERSION/netsim_pipe < $MMLSCRIPT

#############################
rm $PWD/$MMLSCRIPT
. $DEL1
rm $DEL1

echo "//...$0:$SIMNAME rbs_trans script ended running at "`date`
echo "//"

