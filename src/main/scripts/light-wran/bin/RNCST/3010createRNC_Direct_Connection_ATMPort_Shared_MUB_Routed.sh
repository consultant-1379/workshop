#!/bin/bash

#VERSION HISTORY
# Verr2        : Created for WRAN TERE 13B
# Purpose     : ATM Configuration 
# Description : Assume that simulation is no transport and 1's series script run against sim
#                 Script is tested against no transport simulation.
#                 In the case of error please check 1's series mos are created properly
#              Updated Vcltp40 and 39 and Updated Aal2Path reference
# Date        : 7 MAR 2013 
# Who         : Rob Guinan 


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
ICON_CONFIG_FILE=../$ICONCONFIGFILE


PWD=`pwd`
NOW=`date +"%Y_%m_%d_%T:%N"`


MOSCRIPT=$0${NOW}".mo"
MMLSCRIPT=$0${NOW}".mml"

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

NUMOFRBS=`getNumOfRBS $RNCCOUNT $RNCRBSARRAY $RBSCELLARRAY`

#########################################
#
# Make MO Script
#
#########################################
echo "...script started running at "`date`
echo ""
echo "MAKING MO SCRIPT"
echo ""
  OPERATIONALSTATE=1  # 0:DISABLED, 1:ENABLED
  ADMINISTRATIVESTATE=1  # 0:LOCKED, 1:UNLOCKED

cat >> $MOSCRIPT << MOSCT

CREATE
(
    parent "ManagedElement=1,Equipment=1"
    identity "MS"
    moType Subrack
    exception none
    nrOfAttributes 11
    "SubrackId" String "MS"
    "administrativeProductData" Struct
        nrOfElements 5
        "productNumber" String ""
        "productRevision" String ""
        "productName" String ""
        "productInfo" String ""
        "productionDate" String ""

    "cabinetPosition" String ""
    "numberOfSlots" Integer 28
    "operationalProductData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "productType" String ""
    "reservedBy" Array Ref 0
    "subrackPosition" String ""
    "subrackType" Integer 0
    "switchModule" Ref "null"
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
    identity "1"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "1"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 1
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
    identity "2"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "2"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 2
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
    identity "3"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "3"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 3
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
    identity "4"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "4"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 4
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
    identity "5"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "5"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 5
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
    identity "6"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "6"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 6
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
    identity "7"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "7"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 7
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
    identity "8"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "8"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 8
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
    identity "9"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "9"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 9
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
    identity "10"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "10"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 10
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
    identity "11"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "11"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 11
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
    identity "12"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "12"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 12
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
    identity "13"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "13"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 13
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
    identity "14"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "14"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 14
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
    identity "15"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "15"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 15
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
    identity "16"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "16"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 16
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
    identity "17"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "17"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 17
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
    identity "18"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "18"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 18
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
    identity "19"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "19"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 19
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
    identity "20"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "20"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 20
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
    identity "21"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "21"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 21
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
    identity "22"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "22"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 22
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
    identity "23"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "23"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 23
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
    identity "24"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "24"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 24
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
    identity "25"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "25"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 25
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
    identity "26"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "26"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 26
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
    identity "27"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "27"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 27
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=MS"
    identity "28"
    moType Slot
    exception none
    nrOfAttributes 8
    "SlotId" String "28"
    "productData" Struct
        nrOfElements 5
        "productName" String ""
        "productNumber" String ""
        "productRevision" String ""
        "serialNumber" String ""
        "productionDate" String ""

    "reservedBy" Array Ref 0
    "slotNumber" Integer 28
    "slotState" Integer 0
    // "upgradeGroupId" Integer 0
    // "upgradeGroupTypeName" String ""
    "userLabel" String ""
)

MOSCT
VAR=1
while [ "$VAR" -le 28 ]
do


echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot='$VAR'"' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   moType PlugInUnit' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

VAR=`expr $VAR + 1`
done


#NUMOFRBS=`getNumOfRBS $RNCCOUNT $RNCRBSARRAY $RBSCELLARRAY`

RBSCOUNT=1
VAR=1

while [ "$RBSCOUNT" -le "$NUMOFRBS" ]
do

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo ' parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot='$VAR'"' >> $MOSCRIPT
echo ' identity 1' >> $MOSCRIPT
echo ' moType PlugInUnit' >> $MOSCRIPT
echo ' exception none' >> $MOSCRIPT
echo ' nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT


echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot='$VAR',PlugInUnit=1"' >> $MOSCRIPT
echo '   identity ET-MFG' >> $MOSCRIPT
echo '   moType ExchangeTerminal' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot='$VAR',PlugInUnit=1,ExchangeTerminal=ET-MFG"' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   moType Os155SpiTtp' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT


REM=`expr $RBSCOUNT % 126`
if [ "$REM" -eq 0 ]
then
 VAR=`expr $VAR + 1`
fi

RBSCOUNT=`expr $RBSCOUNT + 1`

done


#echo 'CREATE' >> $MOSCRIPT
#echo '(' >> $MOSCRIPT
#echo '  parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot=5,PlugInUnit=1"' >> $MOSCRIPT
#echo '   identity 1' >> $MOSCRIPT
#echo '   moType TuDeviceGroup' >> $MOSCRIPT
#echo '   exception none' >> $MOSCRIPT
#echo '   nrOfAttributes 0' >> $MOSCRIPT
#echo ')' >> $MOSCRIPT

#echo 'CREATE' >> $MOSCRIPT
#echo '(' >> $MOSCRIPT
#echo '  parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot=5,PlugInUnit=1,TuDeviceGroup=1"' >> $MOSCRIPT
#echo '   identity 1' >> $MOSCRIPT
#echo '   moType TimDeviceSet' >> $MOSCRIPT
#echo '   exception none' >> $MOSCRIPT
#echo '   nrOfAttributes 0' >> $MOSCRIPT
#echo ')' >> $MOSCRIPT

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot=5,PlugInUnit=1"' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   moType TimDevice' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT


# Creating extra mo for test analysis
echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,TransportNetwork=1' >> $MOSCRIPT
echo '   identity ta1' >> $MOSCRIPT
echo '   moType Mspg' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,TransportNetwork=1' >> $MOSCRIPT
echo '   identity ta1' >> $MOSCRIPT
echo '   moType MspgExtended' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT



#echo 'CREATE' >> $MOSCRIPT
#echo '(' >> $MOSCRIPT
#echo '  parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot=1,PlugInUnit=1' >> $MOSCRIPT
#echo '   identity ta1' >> $MOSCRIPT
#echo '   moType EtMfg' >> $MOSCRIPT
#echo '   exception none' >> $MOSCRIPT
#echo '   nrOfAttributes 0' >> $MOSCRIPT
#echo ')' >> $MOSCRIPT

#echo 'CREATE' >> $MOSCRIPT
#echo '(' >> $MOSCRIPT
#echo '  parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot=1,PlugInUnit=1,EtMfg=ta1' >> $MOSCRIPT
#echo '   identity ta1' >> $MOSCRIPT
#echo '   moType GigaBitEthernet' >> $MOSCRIPT
#echo '   exception none' >> $MOSCRIPT
#echo '   nrOfAttributes 0' >> $MOSCRIPT
#echo ')' >> $MOSCRIPT




echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot=1,PlugInUnit=1,ExchangeTerminal=ET-MFG' >> $MOSCRIPT
echo '   identity ta1' >> $MOSCRIPT
echo '   moType E3PhysPathTerm' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot=1,PlugInUnit=1,ExchangeTerminal=ET-MFG' >> $MOSCRIPT
echo '   identity ta1' >> $MOSCRIPT
echo '   moType T3PhysPathTerm' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT



echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot=1,PlugInUnit=1,ExchangeTerminal=ET-MFG' >> $MOSCRIPT
echo '   identity ta1' >> $MOSCRIPT
echo '   moType E1PhysPathTerm' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot=1,PlugInUnit=1,ExchangeTerminal=ET-MFG,E1PhysPathTerm=ta1' >> $MOSCRIPT
echo '   identity ta1' >> $MOSCRIPT
echo '   moType Ds0Bundle' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT


echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot=1,PlugInUnit=1,ExchangeTerminal=ET-MFG' >> $MOSCRIPT
echo '   identity ta1' >> $MOSCRIPT
echo '   moType J1PhysPathTerm' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT


echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot=1,PlugInUnit=1,ExchangeTerminal=ET-MFG' >> $MOSCRIPT
echo '   identity ta1' >> $MOSCRIPT
echo '   moType T1PhysPathTerm' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT


echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot=1,PlugInUnit=1' >> $MOSCRIPT
echo '   identity ta1' >> $MOSCRIPT
echo '   moType Cbu' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT


echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot=1,PlugInUnit=1' >> $MOSCRIPT
echo '   identity ta1' >> $MOSCRIPT
echo '   moType GeneralProcessorUnit' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot=1,PlugInUnit=1,GeneralProcessorUnit=ta1' >> $MOSCRIPT
echo '   identity ta1' >> $MOSCRIPT
echo '   moType FastEthernet' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot=1,PlugInUnit=1,GeneralProcessorUnit=ta1' >> $MOSCRIPT
echo '   identity ta1' >> $MOSCRIPT
echo '   moType MediumAccessUnit' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

#NUMOFRBS=`getNumOfRBS $RNCCOUNT $RNCRBSARRAY $RBSCELLARRAY`

REM=`expr $NUMOFRBS / 126 + 1`
SLOTID=1

while [ "$SLOTID" -le "$REM" ]
do


echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot='$SLOTID',PlugInUnit=1,ExchangeTerminal=ET-MFG' >> $MOSCRIPT
echo '   identity ta1' >> $MOSCRIPT
echo '   moType Os155SpiTtp' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot='$SLOTID',PlugInUnit=1,ExchangeTerminal=ET-MFG,Os155SpiTtp=ta1' >> $MOSCRIPT
echo '   identity ta1' >> $MOSCRIPT
echo '   moType Sts3CspeTtp' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

SLOTID=`expr $SLOTID + 1`
done


echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot=1,PlugInUnit=1' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   moType TimingUnit' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot=1,PlugInUnit=1,TimingUnit=1' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   moType TuSyncRef' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT


echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot=2,PlugInUnit=1' >> $MOSCRIPT
echo '   identity ET-MFG' >> $MOSCRIPT
echo '   moType ExchangeTerminal' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT


echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot=2,PlugInUnit=1,ExchangeTerminal=ET-MFG' >> $MOSCRIPT
echo '   identity ta1' >> $MOSCRIPT
echo '   moType Os155SpiTtp' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT


echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot=2,PlugInUnit=1,ExchangeTerminal=ET-MFG,Os155SpiTtp=ta1' >> $MOSCRIPT
echo '   identity ta1' >> $MOSCRIPT
echo '   moType Sts3CspeTtp' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT
# Creating the ATM port first as all the RBS nodes will link up to this port

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,TransportNetwork=1"' >> $MOSCRIPT
echo '   identity MS-24-1' >> $MOSCRIPT
echo '   moType AtmPort' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 1' >> $MOSCRIPT
echo '   uses Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=1,PlugInUnit=1,ExchangeTerminal=ET-MFG,Os155SpiTtp=ta1,Sts3CspeTtp=ta1"' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,IpOam=1"' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   moType Ip' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,IpOam=1,Ip=1"' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   moType EthernetLink' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,IpOam=1,Ip=1"' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   moType IpAtmLink' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,IpOam=1,Ip=1"' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   moType IpRoutingTable' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 1' >> $MOSCRIPT
echo ' staticRoutes Array Struct 1'>> $MOSCRIPT
echo '       nrOfElements 6'>> $MOSCRIPT
echo '       indexOfStaticRoute Integer 1'>> $MOSCRIPT
echo '        ipAddress String 10.2.2.2'>> $MOSCRIPT
echo '        networkMask String 255.255.3.3'>> $MOSCRIPT
echo '       nextHopIpAddr String 10.1.1.1'>> $MOSCRIPT
echo '       redistribute Boolean true'>> $MOSCRIPT
echo '    routeMetric Integer 2'>> $MOSCRIPT
echo ')' >> $MOSCRIPT

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,IpOam=1"' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   moType Ospf' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,IpOam=1,Ospf=1"' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   moType OspfInterface' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,IpOam=1,Ospf=1"' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   moType OspfArea' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT


#NUMOFRBS=`getNumOfRBS $RNCCOUNT $RNCRBSARRAY $RBSCELLARRAY`

RBSCOUNT=1
while [ "$RBSCOUNT" -le "$NUMOFRBS" ]
do

VAR=1
while [ "$VAR" -le 2 ]
do

 case "$VAR"
 in
  1) ID='"ManagedElement=1,TransportNetwork=1,Aal5TpVccTp=b'$RBSCOUNT'-x1"';;
  2) ID='"ManagedElement=1,TransportNetwork=1,Aal5TpVccTp=b'$RBSCOUNT'-x2"';;
 esac


echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,IpOam=1,Ip=1"' >> $MOSCRIPT
echo '   identity '$RBSCOUNT'-'$VAR >> $MOSCRIPT
echo '   moType IpAtmLink' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
#echo '   aal5TpVccTpId Ref '$ID >> $MOSCRIPT
echo ')' >> $MOSCRIPT

VAR=`expr $VAR + 1`
done

RBSCOUNT=`expr $RBSCOUNT + 1`
done

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

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,TransportNetwork=1"' >> $MOSCRIPT
echo '   identity '$ID >> $MOSCRIPT
echo '   moType AtmTrafficDescriptor' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

let VAR=$VAR+1
done
# creating the UniSaalProfile below
echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,TransportNetwork=1"' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   moType UniSaalProfile' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

# Creating Aal2QosProfile and Aal2QosCodePointProfile

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,TransportNetwork=1"' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   moType Aal2QosProfile' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,TransportNetwork=1"' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   moType Aal2QosCodePointProfile' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,TransportNetwork=1"' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   moType Aal2Sp' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

COUNT=1

while [ "$COUNT" -le "$NUMOFRBS" ]
do

# Creating the AtmCrossConnection

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,TransportNetwork=1,AtmPort=MS-24-1"' >> $MOSCRIPT
echo '   identity Vp'$COUNT >> $MOSCRIPT
echo '   moType VplTp' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,TransportNetwork=1,AtmPort=MS-24-1,VplTp=Vp'$COUNT'"' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   moType VpcTp' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

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

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,TransportNetwork=1,AtmPort=MS-24-1,VplTp=Vp'$COUNT',VpcTp=1"' >> $MOSCRIPT
echo '   identity '$VCLTPID >> $MOSCRIPT
echo '   moType VclTp' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT
COUNT2=`expr $COUNT2 + 1`
done

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

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,TransportNetwork=1"' >> $MOSCRIPT
echo '   identity '$ID >> $MOSCRIPT
echo '   moType Aal5TpVccTp' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

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

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,TransportNetwork=1"' >> $MOSCRIPT
echo '   identity '$ID >> $MOSCRIPT
echo '   moType UniSaalTp' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

COUNT2=`expr $COUNT2 + 1`
done

    echo 'CREATE' >> $MOSCRIPT
    echo '(' >> $MOSCRIPT
    echo '  parent "ManagedElement=1,RncFunction=1,IubLink='$COUNT'"' >> $MOSCRIPT
    echo ' identity 1' >> $MOSCRIPT
    echo ' moType NbapCommon' >> $MOSCRIPT
    echo ' exception none' >> $MOSCRIPT
    echo ' nrOfAttributes 3' >> $MOSCRIPT
    echo ' activeUniSaalTpRef Ref "ManagedElement=1,TransportNetwork=1,UniSaalTp=b'$COUNT'ca"' >> $MOSCRIPT
    echo ' standbyUniSaalTpRef Ref "ManagedElement=1,TransportNetwork=1,UniSaalTp=b'$COUNT'cb"' >> $MOSCRIPT
    echo '   operationalState Integer '$OPERATIONALSTATE >> $MOSCRIPT
    echo ')' >> $MOSCRIPT


    echo 'CREATE' >> $MOSCRIPT
    echo '(' >> $MOSCRIPT
    echo '  parent "ManagedElement=1,RncFunction=1,IubLink='$COUNT'"' >> $MOSCRIPT
    echo ' identity 1' >> $MOSCRIPT
    echo ' moType NbapDedicated' >> $MOSCRIPT
    echo ' exception none' >> $MOSCRIPT
    echo ' nrOfAttributes 3' >> $MOSCRIPT
    echo ' activeUniSaalTpRef Ref "ManagedElement=1,TransportNetwork=1,UniSaalTp=b'$COUNT'da"' >> $MOSCRIPT
    echo ' standbyUniSaalTpRef Ref "ManagedElement=1,TransportNetwork=1,UniSaalTp=b'$COUNT'db"' >> $MOSCRIPT
    echo '   operationalState Integer '$OPERATIONALSTATE >> $MOSCRIPT
    echo ')' >> $MOSCRIPT

# Creating Aal2PathVccTp

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,TransportNetwork=1"' >> $MOSCRIPT
echo '   identity b'$COUNT'a1' >> $MOSCRIPT
echo '   moType Aal2PathVccTp' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,TransportNetwork=1"' >> $MOSCRIPT
echo '   identity b'$COUNT'a2' >> $MOSCRIPT
echo '   moType Aal2PathVccTp' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

# Creating Aal2Ap under Aal2Sp

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,TransportNetwork=1,Aal2Sp=1"' >> $MOSCRIPT
echo '   identity '$COUNT >> $MOSCRIPT
echo '   moType Aal2Ap' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,TransportNetwork=1,Aal2Sp=1,Aal2Ap='$COUNT'"' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   moType Aal2PathDistributionUnit' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,TransportNetwork=1"' >> $MOSCRIPT
echo '   identity' $COUNT >> $MOSCRIPT
echo '   moType Aal2RoutingCase' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 1' >> $MOSCRIPT
echo '   numberDirection String '$COUNT'AFaf09' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

# Creating IpRouting tables

#echo 'CREATE' >> $MOSCRIPT
#echo '(' >> $MOSCRIPT
#echo '  parent "ManagedElement=1,IpOam=1,Ip=1"' >> $MOSCRIPT
#echo '   identity' vp'$COUNT' >> $MOSCRIPT
#echo '   moType IpRoutingTable' >> $MOSCRIPT
#echo '   exception none' >> $MOSCRIPT
#echo '   nrOfAttributes 0' >> $MOSCRIPT
#echo ')' >> $MOSCRIPT

########################################
#
# Setting the MO references now
#
########################################

echo 'SET' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  mo "ManagedElement=1,TransportNetwork=1,AtmPort=MS-24-1,VplTp=Vp'$COUNT'"' >> $MOSCRIPT
echo '   identity Vp'$COUNT >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 2' >> $MOSCRIPT
echo '   atmTrafficDescriptor Ref "ManagedElement=1,TransportNetwork=1,AtmTrafficDescriptor=C1P4528"' >> $MOSCRIPT
echo '   externalVpi Integer '$COUNT >> $MOSCRIPT
echo ')' >> $MOSCRIPT

COUNT2=1
while [ "$COUNT2" -le 10 ]
do

case "$COUNT2"
in
 1) VCI=32; VCLTPID=vc32-x; ATMTRAFFICDESCID=U3P1000M80; USERLABEL='"used by ATM CC"' ;;
 2) VCI=33; VCLTPID=vc33-x; ATMTRAFFICDESCID=U3P1000M80; USERLABEL='"used by ATM CC"' ;;
 3) VCI=36; VCLTPID=vc36; ATMTRAFFICDESCID=U3P1000M80; USERLABEL='"used by Aal5 b'$COUNT'ca (Nbap Common)"' ;;
 4) VCI=37; VCLTPID=vc37; ATMTRAFFICDESCID=U3P1000M80; USERLABEL='"used by Aal5 b'$COUNT'da (Nbap Dedicated)"' ;;
 5) VCI=38; VCLTPID=vc38; ATMTRAFFICDESCID=U3P1000M80; USERLABEL='"used by Aal5 b'$COUNT'qa (Aal2 signalling)"' ;;
 6) VCI=39; VCLTPID=vc39; ATMTRAFFICDESCID=U3P1000M80; USERLABEL='"used by Aal2 b'$COUNT'a1 (AAl2PDU)"' ;;
 7) VCI=40; VCLTPID=vc40; ATMTRAFFICDESCID=U3P1000M80; USERLABEL='"used by Aal5 b'$COUNT'a2 (Al2PDU)"';;
 8) VCI=43; VCLTPID=vc43; ATMTRAFFICDESCID=C2P4000; USERLABEL='"used by Aal5 b'$COUNT'cb (Nbap Common)"' ;;
 9) VCI=44; VCLTPID=vc44; ATMTRAFFICDESCID=U3P1000M80; USERLABEL='"used by Aal5 b'$COUNT'db (Nbap Dedicated)"' ;;
10) VCI=45; VCLTPID=vc45; ATMTRAFFICDESCID=U3P1000M80; USERLABEL='"used by Aal5 b'$COUNT'qb (Aal2 signalling)"' ;;
esac



echo 'SET' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  mo "ManagedElement=1,TransportNetwork=1,AtmPort=MS-24-1,VplTp=Vp'$COUNT',VpcTp=1,VclTp='$VCLTPID'"' >> $MOSCRIPT
echo '   identity '$VCLTPID >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 3' >> $MOSCRIPT
echo '   atmTrafficDescriptorId Ref "ManagedElement=1,TransportNetwork=1,AtmTrafficDescriptor='$ATMTRAFFICDESCID'"' >> $MOSCRIPT
echo '   externalVci Integer '$VCI >> $MOSCRIPT
echo '   userLabel String '$USERLABEL >> $MOSCRIPT
echo ')' >> $MOSCRIPT


COUNT2=`expr $COUNT2 + 1`
done


 COUNT2=1
 while [ "$COUNT2" -le 8 ]
 do

 case "$COUNT2"
 in
   1) ID=b"$COUNT"da; VCLID='"ManagedElement=1,TransportNetwork=1,AtmPort=MS-24-1,VplTp=Vp'$COUNT',VpcTp=1,VclTp=vc37"';;
   2) ID=b"$COUNT"ca; VCLID='"ManagedElement=1,TransportNetwork=1,AtmPort=MS-24-1,VplTp=Vp'$COUNT',VpcTp=1,VclTp=vc36"';;
   3) ID=b"$COUNT"db; VCLID='"ManagedElement=1,TransportNetwork=1,AtmPort=MS-24-1,VplTp=Vp'$COUNT',VpcTp=1,VclTp=vc44"';;
   4) ID=b"$COUNT"cb; VCLID='"ManagedElement=1,TransportNetwork=1,AtmPort=MS-24-1,VplTp=Vp'$COUNT',VpcTp=1,VclTp=vc43"';;
   5) ID=b"$COUNT"qa; VCLID='"ManagedElement=1,TransportNetwork=1,AtmPort=MS-24-1,VplTp=Vp'$COUNT',VpcTp=1,VclTp=vc38"';;
   6) ID=b"$COUNT"qb; VCLID='"ManagedElement=1,TransportNetwork=1,AtmPort=MS-24-1,VplTp=Vp'$COUNT',VpcTp=1,VclTp=vc45"';;
   7) ID=b"$COUNT"-x1; VCLID='"ManagedElement=1,TransportNetwork=1,AtmPort=MS-24-1,VplTp=Vp'$COUNT',VpcTp=1,VclTp=vc32-x"';;
   8) ID=b"$COUNT"-x2; VCLID='"ManagedElement=1,TransportNetwork=1,AtmPort=MS-24-1,VplTp=Vp'$COUNT',VpcTp=1,VclTp=vc33-x"';;


 esac

echo 'SET' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  mo "ManagedElement=1,TransportNetwork=1,Aal5TpVccTp='$ID'"' >> $MOSCRIPT
echo '   identity '$ID >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 2' >> $MOSCRIPT
echo '    processorId Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=24,PlugInUnit=1"' >> $MOSCRIPT
echo '    vclTpId Ref '$VCLID >> $MOSCRIPT
echo ')' >> $MOSCRIPT

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

echo 'SET' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  mo "ManagedElement=1,TransportNetwork=1,UniSaalTp='$ID'"' >> $MOSCRIPT
echo '   identity '$ID >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 2' >> $MOSCRIPT
echo '   aal5TpVccTpId Ref '$Aal5Ref >> $MOSCRIPT
echo '   uniSaalProfileId Ref "ManagedElement=1,TransportNetwork=1,UniSaalProfile=1"' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

COUNT2=`expr $COUNT2 + 1`
done
# Setting the IpAtmLinks below
#ManagedElement=1,IpOam=1,Ip=1,IpAtmLink=75-2
echo 'SET' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  mo "ManagedElement=1,IpOam=1,Ip=1,IpAtmLink='$COUNT'-1"' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 4' >> $MOSCRIPT
echo '   ipAddress String 10.2.5.6' >> $MOSCRIPT
#echo '   IpAtmLinkid String '$COUNT >> $MOSCRIPT
echo '   subnetMask String 255.255.255.2' >> $MOSCRIPT
echo '   aal5TpVccTpId Ref "ManagedElement=1,TransportNetwork=1,Aal5TpVccTp=b'$COUNT'-x1"' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

echo 'SET' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  mo "ManagedElement=1,IpOam=1,Ip=1,IpAtmLink='$COUNT'-2""' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 4' >> $MOSCRIPT
echo '   ipAddress String 10.2.5.6' >> $MOSCRIPT
#echo '   IpAtmLinkId String '$COUNT >> $MOSCRIPT
echo '   subnetMask String 255.255.2.2' >> $MOSCRIPT
echo '   aal5TpVccTpId Ref "ManagedElement=1,TransportNetwork=1,Aal5TpVccTp=b'$COUNT'-x2"' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

VAR=1

echo 'SET' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  mo "ManagedElement=1,TransportNetwork=1,Aal2PathVccTp=b'$COUNT'a1"' >> $MOSCRIPT
echo '   moType Aal2PathVccTp' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 2' >> $MOSCRIPT
echo '   vclTpId Ref "ManagedElement=1,TransportNetwork=1,AtmPort=MS-24-'$VAR',VplTp=Vp'$COUNT',VpcTp=1,VclTp=vc39"' >> $MOSCRIPT
echo '   aal2QoSProfileId Ref "ManagedElement=1,TransportNetwork=1,Aal2QosProfile=1"' >> $MOSCRIPT
echo ')' >> $MOSCRIPT


echo 'SET' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  mo "ManagedElement=1,TransportNetwork=1,Aal2PathVccTp=b'$COUNT'a2"' >> $MOSCRIPT
echo '   moType Aal2PathVccTp' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 2' >> $MOSCRIPT
echo '   vclTpId Ref "ManagedElement=1,TransportNetwork=1,AtmPort=MS-24-'$VAR',VplTp=Vp'$COUNT',VpcTp=1,VclTp=vc40"' >> $MOSCRIPT
echo '   aal2QoSProfileId Ref "ManagedElement=1,TransportNetwork=1,Aal2QosProfile=1"' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

cat >> $MOSCRIPT << MOSCT
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
echo 'SET' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  mo "ManagedElement=1,TransportNetwork=1,Aal2Sp=1,Aal2Ap='$COUNT',Aal2PathDistributionUnit=1"' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 2' >> $MOSCRIPT
echo '   rpuId Ref "ManagedElement=1,SwManagement=1,ReliableProgramUniter=ans_aal2cpsrc_12_1"' >> $MOSCRIPT
echo '   aal2PathVccTpList Array Ref 2' >> $MOSCRIPT
echo '    "ManagedElement=1,TransportNetwork=1,Aal2PathVccTp=b'$COUNT'a1"' >> $MOSCRIPT
echo '    "ManagedElement=1,TransportNetwork=1,Aal2PathVccTp=b'$COUNT'a2"' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

echo 'SET' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo ' mo "ManagedElement=1,TransportNetwork=1,Aal2RoutingCase='$COUNT'"'>>$MOSCRIPT
echo ' exception none'>> $MOSCRIPT
echo ' nrOfAttributes 1'>> $MOSCRIPT
echo ' routeList Array Ref 1'  >> $MOSCRIPT
echo ' "ManagedElement=1,TransportNetwork=1,Aal2Sp=1,Aal2Ap='$COUNT'"'>> $MOSCRIPT
echo ')'>> $MOSCRIPT



#echo 'SET' >> $MOSCRIPT
#echo '(' >> $MOSCRIPT
#echo ' mo "ManagedElement=1,IpOam=1,Ip=1,EthernetLink=1'>>$MOSCRIPT
#echo ' exception none'>> $MOSCRIPT
#echo ' nrOfAttributes 1'>> $MOSCRIPT
#echo ' interfacename  string le0'>> $MOSCRIPT
#echo ')'>> $MOSCRIPT


COUNT=`expr $COUNT + 1`
done

################### setting the IP routing table
#echo 'SET' >> $MOSCRIPT
#echo '(' >> $MOSCRIPT
#echo ' mo "ManagedElement=1,IpOam=1,Ip=1,IpRoutingTable=1"'>>$MOSCRIPT
#echo ' exception none'>> $MOSCRIPT
#echo ' nrOfAttributes 1'>> $MOSCRIPT
#echo ' staticRoutes Array Struct 2'>> $MOSCRIPT
#echo '       nrOfElements 6'>> $MOSCRIPT
#echo '       indexOfStaticRoute Integer 1'>> $MOSCRIPT
#echo '        ipAddress String 10.2.2.2'>> $MOSCRIPT
#echo '        networkMask String 255.255.3.3'>> $MOSCRIPT
#echo '       nextHopIpAddr String 10.1.1.1'>> $MOSCRIPT
#echo '       redistribute Boolean true'>> $MOSCRIPT
#echo '    routeMetric Integer 2'>> $MOSCRIPT
#echo ')'>> $MOSCRIPT


#########################################
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
echo 'kertayle:file="'$PWD'/'$MOSCRIPT'";' >> $MMLSCRIPT


$NETSIMDIR/$NETSIMVERSION/netsim_pipe < $MMLSCRIPT

rm $MMLSCRIPT
rm $MOSCRIPT
echo "...script ended at "`date`
