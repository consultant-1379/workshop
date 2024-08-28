#!/bin/sh


if [ "$#" -ne 3  ]
then
 echo
 echo "Usage: $0 <sim name> <env file> <rnc num>"
 echo
 echo "Example: $0 RNCS1100-ST-RNC01 O13-ST-13A-40K.env 1 (to create RNC01)"
 echo
 exit 1
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

if [ "$RNCIDCOUNT" -eq 0 ]
then
  RNCNAME=
fi

echo "//...$0:$SIMNAME rnc script started running at "`date`
echo "//"


. ../../dat/$ENV

. ../utilityFunctions.sh

PWD=`pwd`
NOW=`date +"%Y_%m_%d_%T:%N"`


MOSCRIPT=$0:${NOW}:$RNCNAME".mo"
MMLSCRIPT=$0:${NOW}:$RNCNAME".mml"


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
# Functions to call
#########################################

NUMOFRBS=`getNumOfRBS $RNCCOUNT $RNCRBSARRAY $RBSCELLARRAY`

echo "//" >> $MOSCRIPT
echo "//.....$0:$RNCNAME MAKING MO SCRIPT started at "`date` >> $MOSCRIPT
echo "//" >> $MOSCRIPT

echo "//.....$0:$RNCNAME MAKING MO SCRIPT RNC started at "`date` 
echo "//" 

#########################################
# Make MO Script
#########################################

#1
#########################################
# Set RncFunction (1000setRncFunction.sh)
#########################################

echo 'SET' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  mo "ManagedElement=1,RncFunction=1"' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 7' >> $MOSCRIPT
echo '   rncId Integer '$RNCCOUNT >> $MOSCRIPT
echo '   mcc Integer '$MCC >> $MOSCRIPT
echo '   mnc Integer '$MNC >> $MOSCRIPT
echo '   mncLength Integer 2' >> $MOSCRIPT
echo '   aliasPlmnIdentities Array Struct 1' >> $MOSCRIPT
echo '   nrOfElements 3' >> $MOSCRIPT
echo '        "mcc" Integer '$MCC >> $MOSCRIPT
echo '        "mnc" Integer '$MNC >> $MOSCRIPT
echo '        "mncLength" Integer '$MNCLENGTH >> $MOSCRIPT
echo '   userLabel String '$FTPDIR >> $MOSCRIPT
echo ')' >> $MOSCRIPT

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,RncFunction=1"' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   moType DchFrameSynch' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,RncFunction=1"' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   moType RncModule' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

#########################################
# Set RncFunction END
#########################################

#2
#########################################
# Create IubLink START (1010createIub.sh)
#########################################


IUBEND=$NUMOFRBS
IUBCOUNT=1

  OPERATIONALSTATE=1     # 0-DISABLED, 1-ENABLED
  ADMINISTRATIVESTATE=1  # 0-LOCKED, 1-UNLOCKED

if [ "$RNCCOUNT" -ge 4 ] && [ "$RNCCOUNT" -le 48 ]
then
  ATM=1
  IP=0
else
  ATM=0
  IP=1
fi

if [ "$RNCCOUNT" -ge 102 ]
then
  ATM=1
  IP=1
fi

if [ "$RNCCOUNT" -ge 107 ] && [ "$RNCCOUNT" -le 108 ]
then
  ATM=0
  IP=1
fi


while [ "$IUBCOUNT" -le "$IUBEND" ]
do

  #echo "IubLink="$IUBCOUNT" ATM="$ATM" IP="$IP

  echo 'CREATE' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo '  parent "ManagedElement=1,RncFunction=1"' >> $MOSCRIPT
  echo ' identity '$IUBCOUNT >> $MOSCRIPT
  echo ' moType IubLink' >> $MOSCRIPT
  echo ' exception none' >> $MOSCRIPT
  echo ' nrOfAttributes 4' >> $MOSCRIPT
  echo '   rbsId Integer '$IUBCOUNT >> $MOSCRIPT
  echo ' rncModuleRef Ref "ManagedElement=1,RncFunction=1,RncModule=1"' >> $MOSCRIPT
  echo '   controlPlaneTransportOption Struct' >> $MOSCRIPT
  echo '      nrOfElements 2' >> $MOSCRIPT
  echo '        atm Integer '$ATM >> $MOSCRIPT
  echo '        ipv4 Integer '$IP >> $MOSCRIPT
  echo '   userPlaneTransportOption Struct' >> $MOSCRIPT
  echo '      nrOfElements 2' >> $MOSCRIPT
  echo '        atm Integer '$ATM >> $MOSCRIPT
  echo '        ipv4 Integer '$IP >> $MOSCRIPT
  echo '   operationalState Integer '$OPERATIONALSTATE >> $MOSCRIPT
  echo '   administrativeState Integer '$ADMINISTRATIVESTATE >> $MOSCRIPT
  echo ')' >> $MOSCRIPT

  IUBCOUNT=`expr $IUBCOUNT + 1`

done

#3
#########################################
# Create CnOperator START (1046createCnOperAndWcdmacarr.sh)
#########################################

COUNTER=1
RNCCOUNT=$3

while [ "$COUNTER" -le 4 ]
do

  echo 'CREATE' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo '  parent "ManagedElement=1,RncFunction=1"' >> $MOSCRIPT
  echo '   identity '$COUNTER >> $MOSCRIPT
  echo '   moType CnOperator' >> $MOSCRIPT
  echo '   exception none' >> $MOSCRIPT
  echo '   nrOfAttributes 0' >> $MOSCRIPT
  echo ')' >> $MOSCRIPT

  echo 'CREATE' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo '  parent "ManagedElement=1,RncFunction=1,CnOperator='$COUNTER'"' >> $MOSCRIPT
  echo '   identity 1' >> $MOSCRIPT
  echo '   moType IuLink' >> $MOSCRIPT
  echo '   exception none' >> $MOSCRIPT
  echo '   nrOfAttributes 0' >> $MOSCRIPT
  echo ')' >> $MOSCRIPT

  echo 'CREATE' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo '  parent "ManagedElement=1,RncFunction=1,CnOperator='$COUNTER',IuLink=1"' >> $MOSCRIPT
  echo '   identity 1' >> $MOSCRIPT
  echo '   moType Ranap' >> $MOSCRIPT
  echo '   exception none' >> $MOSCRIPT
  echo '   nrOfAttributes 0' >> $MOSCRIPT
  echo ')' >> $MOSCRIPT


  cat >> $MOSCRIPT << MOSCT
    CREATE
    (
     parent "ManagedElement=1,RncFunction=1"
       identity $COUNTER
       moType WcdmaCarrier
        exception none
        nrOfAttributes 1
          uarfcnDl Integer $COUNTER
    )
MOSCT


  COUNTER=`expr $COUNTER + 1`
done

echo 'SET' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  mo "ManagedElement=1,RncFunction=1"' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 1' >> $MOSCRIPT
echo ' primaryCnOperatorRef Ref "ManagedElement=1,RncFunction=1,CnOperator=1"' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

#########################################
# Create CnOperator END
#########################################

#4
#########################################
# Create MocnCellProfile START (1047createMocnCellProfile.sh)
#########################################

START=1
STOP=4
COUNT=$START

while [ "$COUNT" -le "$STOP" ]
do

  echo 'CREATE' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo '  parent "ManagedElement=1,RncFunction=1' >> $MOSCRIPT
  echo '   identity '$COUNT >> $MOSCRIPT
  echo '   moType MocnCellProfile' >> $MOSCRIPT
  echo '   exception none' >> $MOSCRIPT
  echo '   nrOfAttributes 1' >> $MOSCRIPT
  echo '   commonPlmnRef Ref "ManagedElement=1,RncFunction=1,CnOperator='$COUNT'"' >> $MOSCRIPT
  echo ')' >> $MOSCRIPT

COUNT=`expr $COUNT + 1`
done

#########################################
# Create MocnCellProfile END (1047createMocnCellProfile.sh)
#########################################

#5
#########################################
# Create MbmsServiceArea START (1062createMbmsSA.sh)
#########################################

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '    parent "ManagedElement=1,RncFunction=1"' >> $MOSCRIPT
echo '   identity "1"' >> $MOSCRIPT
echo '    moType Mbms' >> $MOSCRIPT
echo '    exception none' >> $MOSCRIPT
echo '    nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

COUNT=1
while [ "$COUNT" -le "$NUMOFRBS" ]
do

  echo 'CREATE' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo '    parent "ManagedElement=1,RncFunction=1,Mbms=1"' >> $MOSCRIPT
  echo '   identity "'$COUNT'"' >> $MOSCRIPT
  echo '    moType MbmsServiceArea' >> $MOSCRIPT
  echo '    exception none' >> $MOSCRIPT
  echo '    nrOfAttributes 1' >> $MOSCRIPT
  echo '    sac Integer '$COUNT >> $MOSCRIPT
  echo ')' >> $MOSCRIPT

  COUNT=`expr $COUNT + 1`
done
#########################################
# Create MbmsServiceArea END (1062createMbmsSA.sh)
#########################################

#6
#########################################
# Create Security START (1070createSecurity.sh)
#########################################

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,SystemFunctions=1"' >> $MOSCRIPT
echo ' identity 1' >> $MOSCRIPT
echo ' moType Security' >> $MOSCRIPT
echo ' exception none' >> $MOSCRIPT
echo ' nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT
#########################################
# Create Security END (1070createSecurity.sh)
#########################################

#7
#########################################
# Set ManagedElement START (1110setManagedElement.sh)
#########################################

RNCVERSION=`getMimType $RNCCOUNT $RNCVERSIONARRAY`

echo 'SET' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  mo "ManagedElement=1"' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 4' >> $MOSCRIPT
echo '   faultTolerantCoreStates Array String 1'  >> $MOSCRIPT
echo '   "ManagedElement=1,Equipment=1,Subrack=MS,Slot=1,PlugInUnit=1;ftcState=Active"' >> $MOSCRIPT
echo '   mimName String '$RNCVERSION >> $MOSCRIPT
echo '   userLabel String '$FTPDIR >> $MOSCRIPT
echo ')' >> $MOSCRIPT
#########################################
# Set ManagedElement END (1110setManagedElement.sh)
#########################################

#8
#########################################
# Create UeRc START (1140createUeRc.sh)
#########################################

cat >> $MOSCRIPT << MOSCT

CREATE
(
    parent "ManagedElement=1,RncFunction=1"
    identity "1"
    moType UeRc
    exception none
    nrOfAttributes 14
    "UeRcId" String "1"
)

CREATE
(
    parent "ManagedElement=1,RncFunction=1,UeRc=1"
    identity "1"
    moType UeRcTrCh
    exception none
    nrOfAttributes 3
    "UeRcTrChId" String "1"
    "blerQualityTargetDl" Integer -63
    "blerQualityTargetUl" Integer -63
)

CREATE
(
    parent "ManagedElement=1,RncFunction=1,UeRc=1"
    identity "1"
    moType UeRcRab
    exception none
    nrOfAttributes 3
    "UeRcRabId" String "1"
)


CREATE
(
    parent "ManagedElement=1,RncFunction=1"
    identity "1"
    moType UeRabType
    exception none
    nrOfAttributes 2
    "UeRabTypeId" String "1"
)


MOSCT
#########################################
# Create UeRc END (1140createUeRc.sh)
#########################################

#9
#########################################
# Create PiuType START (1160createPiuType.sh)
#########################################

cat >> $MOSCRIPT << MOSCT

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "RNC_ETM1_R5"
    moType PiuType
    exception none
    nrOfAttributes 7
    "PiuTypeId" String "RNC_ETM1_R5"
    "boardWidth" Integer 1
    "defAllowedSeqRestarts" Integer 3
    "productData" Struct
        nrOfElements 5
        "productNumber" String "ROJ1192101/2"
        "productRevision" String "R5"
        "productName" String "ET-M1"
        "productInfo" String "RNC_ETM1"
        "productionDate" String "20010101"

    "reservedBy" Array Ref 0
    "role" Integer 2
    "userLabel" String ""
)
MOSCT
#########################################
# Create PiuType END (1160createPiuType.sh)
#########################################

#10
#########################################
# Create LoadModules START (1240createLoadModules-A.sh)
#########################################

cat >> $MOSCRIPT << MOSCT

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "DbmFpgaLoader"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "DbmFpgaLoader"
    "loadModuleFilePath" String "/c/loadmodules/"
    "oseProgramLoadClass" Integer 50
    "productData" Struct
        nrOfElements 5
        "productNumber" String "CXC1322025"
        "productRevision" String "R2A04"
        "productName" String "dbm_fpgalodr"
        "productInfo" String "dbm_fpgalodr"
        "productionDate" String "20010625"
)

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "Aal2Bp"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "Aal2Bp"
    "loadModuleFilePath" String "/c/loadmodules/"
    "oseProgramLoadClass" Integer 400
    "productData" Struct
        nrOfElements 5
        "productNumber" String "CXC1320835"
        "productRevision" String "R4F03"
        "productName" String "aal2bp"
        "productInfo" String "aal2bp"
        "productionDate" String "20001221"
)
CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "AtmBp"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "AtmBp"
    "loadModuleFilePath" String "/c/loadmodules/"
    "oseProgramLoadClass" Integer 400
    "productData" Struct
        nrOfElements 5
        "productNumber" String "CXC1320837"
        "productRevision" String "R4E01"
        "productName" String "atmbp"
        "productInfo" String "atmbp"
        "productionDate" String "20001221"
)
CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "EqpM4Bp"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "EqpM4Bp"
    "loadModuleFilePath" String "/c/loadmodules/"
    "oseProgramLoadClass" Integer 400
    "productData" Struct
        nrOfElements 5
        "productNumber" String "CXC1321519"
        "productRevision" String "R3E01"
        "productName" String "equipm4_lm"
        "productInfo" String "equipm4_bp403"
        "productionDate" String "20001221"
)
CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "PhyStm1Bp"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "PhyStm1Bp"
    "loadModuleFilePath" String "/c/loadmodules/"
    "oseProgramLoadClass" Integer 400
    "productData" Struct
        nrOfElements 5
        "productNumber" String "CXC1320896"
        "productRevision" String "R3F01"
        "productName" String "phye1bp"
        "productInfo" String "phye1bp"
        "productionDate" String "20001221"
)
CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "CpyLoader"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "CpyLoader"
    "loadModuleFilePath" String "/c/loadmodules/"
    "oseProgramLoadClass" Integer 300
    "productData" Struct
        nrOfElements 5
        "productNumber" String "CXC1322246"
        "productRevision" String "R2B01"
        "productName" String "cpyloader"
        "productInfo" String "cpyloader"
        "productionDate" String "20010201"
    "reliableProgramLabel" String "cpyloader"
)
CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "NssSyciBp"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "NssSyciBp"
    "loadModuleFilePath" String "/c/loadmodules/"
    "oseProgramLoadClass" Integer 400
    "productData" Struct
        nrOfElements 5
        "productNumber" String "CXC1321121/2"
        "productRevision" String "R5E01"
        "productName" String "nsssyci_bp"
        "productInfo" String "nsssyci_bp"
        "productionDate" String "20001221"
)
CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "DbmBasic"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "DbmBasic"
    "loadModuleFilePath" String "/c/loadmodules/"
    "productData" Struct
        nrOfElements 5
        "productNumber" String "CXC1321451"
        "productRevision" String "R4N03"
        "productName" String "dbm_cs_basic"
        "productInfo" String "dbm_cs_basic"
        "productionDate" String "20001221"
)
MOSCT
#########################################
# Create LoadModules END (1240createLoadModules-A.sh)
#########################################

#11
#########################################
# Create LoadModules-B START (1280createLoadModules-B.sh)
#########################################

cat >> $MOSCRIPT << MOSCT

CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "EqpM1Bp"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "EqpM1Bp"
    "loadModuleFilePath" String "/c/loadmodules/"
    "oseProgramLoadClass" Integer 400
    "productData" Struct
        nrOfElements 5
        "productNumber" String "CXC1321518"
        "productRevision" String "R3E01"
        "productName" String "equipm1_lm"
        "productInfo" String "equipm1_bp403"
        "productionDate" String "20001221"
)
CREATE
(
    parent "ManagedElement=1,SwManagement=1"
    identity "PhyE1Bp"
    moType LoadModule
    exception none
    nrOfAttributes 16
    "LoadModuleId" String "PhyE1Bp"
    "loadModuleFilePath" String "/c/loadmodules/"
    "oseProgramLoadClass" Integer 400
    "productData" Struct
        nrOfElements 5
        "productNumber" String "CXC1320838"
        "productRevision" String "R4H01"
        "productName" String "phye1bp"
        "productInfo" String "phye1bp"
        "productionDate" String "20001221"
)
MOSCT
#########################################
# Create LoadModules-B END (1280createLoadModules-B.sh)
#########################################

#12
#########################################
# Create UpgradePackage START (1330createUpgradePackage.sh)
#########################################

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,SwManagement=1"' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   moType UpgradePackage' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 1' >> $MOSCRIPT
echo '   userLabel String UpgradePackage-1' >> $MOSCRIPT
echo ')' >> $MOSCRIPT


echo 'SET' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  mo "ManagedElement=1,SwManagement=1,ConfigurationVersion=1"' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 1' >> $MOSCRIPT
echo '   currentUpgradePackage Ref "ManagedElement=1,SwManagement=1,UpgradePackage=1"' >> $MOSCRIPT
echo ')' >> $MOSCRIPT
#########################################
# Create UpgradePackage END (1330createUpgradePackage.sh)
#########################################

#13
#########################################
# Create LoadModules START (1340createLoadModules.sh)
#########################################

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,SwManagement=1"' >> $MOSCRIPT
echo '   identity asms' >> $MOSCRIPT
echo '   moType LoadModule' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 16' >> $MOSCRIPT
echo '   LoadModuleId String "asms"' >> $MOSCRIPT
echo '   loadModuleFilePath String "/c/java/CXC1340297_R1B02.jar"' >> $MOSCRIPT
echo '   loaderType Integer 2' >> $MOSCRIPT
echo '   oseProgramLoadClass Integer 400' >> $MOSCRIPT
echo '   productData Struct' >> $MOSCRIPT
echo '        nrOfElements 5' >> $MOSCRIPT
echo '        productNumber String "CXC1323893"' >>$MOSCRIPT
echo '        productRevision String "R1D"' >>$MOSCRIPT
echo '        productName String "asms_stub"' >>$MOSCRIPT
echo '        productInfo String ""' >>$MOSCRIPT
echo '        productionDate String "20021122"' >>$MOSCRIPT
echo ')' >> $MOSCRIPT

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,SwManagement=1"' >> $MOSCRIPT
echo '   identity asms_sharp' >> $MOSCRIPT
echo '   moType LoadModule' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 16' >> $MOSCRIPT
echo '   LoadModuleId String "asms_sharp"' >> $MOSCRIPT
echo '   loadModuleFilePath String "/c/java/CXC1340297_R1B02.jar"' >> $MOSCRIPT
echo '   loaderType Integer 2' >> $MOSCRIPT
echo '   oseProgramLoadClass Integer 400' >> $MOSCRIPT
echo '   productData Struct' >> $MOSCRIPT
echo '        nrOfElements 5' >> $MOSCRIPT
echo '        productNumber String "CXC1323613"' >>$MOSCRIPT
echo '        productRevision String "R1D"' >>$MOSCRIPT
echo '        productName String "asms_sharpstub"' >>$MOSCRIPT
echo '        productInfo String ""' >>$MOSCRIPT
echo '        productionDate String "20021122"' >>$MOSCRIPT
echo ')' >> $MOSCRIPT

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,Equipment=1"' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   moType Jvm' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 1' >> $MOSCRIPT
echo '   admClasspath Array Ref 1' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=asms"' >> $MOSCRIPT
echo ')' >> $MOSCRIPT
#########################################
# Create LoadModules END (1340createLoadModules.sh)
#########################################

#14
#########################################
# Create SpDevicePool START (1420createPdrDevice.sh)
#########################################

COUNT=1
while [ "$COUNT" -le 3 ]
do

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,Equipment=1' >> $MOSCRIPT
echo '   identity '$COUNT >> $MOSCRIPT
echo '   moType SpDevicePool' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,Equipment=1,SpDevicePool='$COUNT'"' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   moType PdrDevice' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT


echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,Equipment=1,SpDevicePool='$COUNT',PdrDevice=1"' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   moType IpEthPacketDataRouter' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,Equipment=1,SpDevicePool='$COUNT',PdrDevice=1"' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   moType PacketDataRouter' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT


  COUNT=`expr $COUNT  + 1`
done
#########################################
# Create SpDevicePool END (1420createPdrDevice.sh)
#########################################

#15
#########################################
# Create SpDevicePool START (1450createExtraBcgMOs.sh)
#########################################

MOTYPE=Sid

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,RncFunction=1' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   moType '$MOTYPE >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

#########################################
# Create SpDevicePool END (1450createExtraBcgMOs.sh)
#########################################

#15
#########################################
# Create RabHandling START (1460createTnl.sh)
#########################################

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,RncFunction=1' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   moType RabHandling' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

COUNT=1
STOP=4
while [ "$COUNT" -le "$STOP" ]
do

 case "$COUNT"
 in
  1) MOTYPE=RnlQosClassProfile ; IDENTITY="Uplink" ;;
  2) MOTYPE=TnlHspaQosClassProfile ; IDENTITY=1 ;;
  3) MOTYPE=TnlDchQosClassProfile ;IDENTITY=1 ;;
  4) MOTYPE=TnlIuQosClassProfile ;IDENTITY=1 ;;
 esac

 echo 'CREATE' >> $MOSCRIPT
 echo '(' >> $MOSCRIPT
 echo '  parent "ManagedElement=1,RncFunction=1,RabHandling=1' >> $MOSCRIPT
 echo '   identity '$IDENTITY >> $MOSCRIPT
 echo '   moType '$MOTYPE >> $MOSCRIPT
 echo '   exception none' >> $MOSCRIPT
 echo '   nrOfAttributes 0' >> $MOSCRIPT
 echo ')' >> $MOSCRIPT

 if [ "$MOTYPE" ==  "RnlQosClassProfile" ]
 then
  COUNT2=1
  while [ "$COUNT2" -le 2 ]
  do

  case "$COUNT2"
  in
   1) MOTYPE=TrafficClass; PARENT="ManagedElement=1,RncFunction=1,RabHandling=1,RnlQosClassProfile=Uplink" ;;
   2) MOTYPE=DchMap; PARENT="ManagedElement=1,RncFunction=1,RabHandling=1,RnlQosClassProfile=Uplink,TrafficClass=1" ;;
  esac

    echo 'CREATE' >> $MOSCRIPT
    echo '(' >> $MOSCRIPT
    echo '  parent '$PARENT >> $MOSCRIPT
    echo '   identity 1' >> $MOSCRIPT
    echo '   moType '$MOTYPE >> $MOSCRIPT
    echo '   exception none' >> $MOSCRIPT
    echo '   nrOfAttributes 0' >> $MOSCRIPT
    echo ')' >> $MOSCRIPT

  COUNT2=`expr $COUNT2 + 1`
  done
 fi

 if [ "$MOTYPE" == "TnlDchQosClassProfile" ]
 then

    echo 'CREATE' >> $MOSCRIPT
    echo '(' >> $MOSCRIPT
    echo '  parent "ManagedElement=1,RncFunction=1,RabHandling=1,TnlDchQosClassProfile=1"' >> $MOSCRIPT
    echo '   identity 1' >> $MOSCRIPT
    echo '   moType TnlQosClass' >> $MOSCRIPT
    echo '   exception none' >> $MOSCRIPT
    echo '   nrOfAttributes 0' >> $MOSCRIPT
    echo ')' >> $MOSCRIPT


 fi

COUNT=`expr $COUNT + 1`
done
#########################################
# Create RabHandling END (1460createTnl.sh)
#########################################

#16
#########################################
# Create TnlQosClass START (1471createTnlQosClass.sh)
#########################################

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,RncFunction=1,TnlCchQosClassProfile=1' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   moType TnlQosClass' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT
#########################################
# Create TnlQosClass END (1471createTnlQosClass.sh)
#########################################

#17
#########################################
# Create IuBcLink START (1480createIuBcLink.sh)
#########################################

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,RncFunction=1' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   moType IuBcLink' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT
#########################################
# Create IuBcLink END (1480createIuBcLink.sh)
#########################################

#18
#########################################
# Set RncFunction START (1490setRncFunction.sh)
#########################################
echo 'SET' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  mo "ManagedElement=1,RncFunction=1"' >> $MOSCRIPT
echo ' identity 1' >> $MOSCRIPT
echo ' exception none' >> $MOSCRIPT
echo ' nrOfAttributes 1' >> $MOSCRIPT
echo ' primaryCnOperatorRef Ref "ManagedElement=1,RncFunction=1,CnOperator=1"' >> $MOSCRIPT
echo ')' >> $MOSCRIPT
#########################################
# Set RncFunction END (1490setRncFunction.sh)
#########################################

#19
#########################################
# Create Subrack START (1150createMS.sh)
#########################################

cat >> $MOSCRIPT << MOSCT

CREATE
(
    parent "ManagedElement=1,Equipment=1"
    identity "MS"
    moType Subrack
    exception none
    nrOfAttributes 11
    "SubrackId" String "MS"
)
MOSCT
#########################################
# Create Subrack END (1150createMS.sh)
#########################################

#20
#########################################
# Create SwitchFabric START (1370createSwitchFab.sh,1320createSwitchFab.sh)
#########################################

cat "$SIMDIR/mo/$RNCDIR/switchfab.mo" >> $MOSCRIPT

#########################################
# Create SwitchFabric END (1370createSwitchFab.sh,1320createSwitchFab.sh)
#########################################

#21
#########################################
# Create SwManagement START (1350createSwMgmt.sh)
#########################################

cat "$SIMDIR/mo/$RNCDIR/swmgmt.mo" >> $MOSCRIPT

#########################################
# Create SwManagement END (1350createSwMgmt.sh)
#########################################

#22
#########################################
# Create TcMap START (1430createTcMap.sh)
#########################################

COUNT=1
while [ "$COUNT" -le 3 ]
do

case "$COUNT"
in
 1) GPRSTART=6; GPREND=7; TDSTART=0; TDEND=1;;
 2) GPRSTART=8; GPREND=9; TDSTART=2; TDEND=3;;
 3) GPRSTART=10; GPREND=11; TDSTART=4; TDEND=5;;
esac


cat >> $MOSCRIPT << MOSCT

CREATE
(
  parent "ManagedElement=1,RncFunction=1,RabHandling=1,RnlQosClassProfile=Uplink,TrafficClass=$COUNT
   identity $COUNT
   moType TcMap
   exception none
   nrOfAttributes 4
    gbrRangeEnd Integer $GPREND
    gbrRangeStart Integer $GPRSTART
    tdRangeEnd Integer $TDEND
    tdRangeStart Integer $TDSTART

)

MOSCT


COUNT=`expr $COUNT  + 1`
done

#########################################
# Create TcMap END (1430createTcMap.sh)
#########################################

#23
#########################################
# Set RncModule START (1440setRncModule.sh)
#########################################
echo 'SET' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  mo "ManagedElement=1,RncFunction=1,RncModule=1"' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 1' >> $MOSCRIPT
echo '   rpuRefs Array Ref 10' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,ReliableProgramUniter=scc_adm"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,ReliableProgramUniter=scc_server"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,ReliableProgramUniter=aal2ap13"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,ReliableProgramUniter=sw_inst"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,ReliableProgramUniter=spas_res"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,ReliableProgramUniter=inet"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,ReliableProgramUniter=ospf"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,ReliableProgramUniter=aal05_ncc"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,ReliableProgramUniter=aal_cc"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,ReliableProgramUniter=phy_e1_mp"' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

#########################################
# Set RncModule END (1440setRncModule.sh)
#########################################

#24
#########################################
# Set UpgradePackage START (1470setUpgradePackage.sh)
#########################################
echo 'SET' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  mo "ManagedElement=1,SwManagement=1,UpgradePackage=1"' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 1' >> $MOSCRIPT
echo '   loadModuleList Array Ref 90' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=asms"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=asms_sharp"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=Gpb3Basic"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=DbmBasic"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=LoaderServer"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=Database"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=Database"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=SysMan"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=SwInst"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=Inet"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=Ospf"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=Sock"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=Ethernet"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=IpUtil"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=SpasRes"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=Jvm"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=SpasConn"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=SpasLink"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=Http"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=SpasSm"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=48vpwrsup"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=CpyLoader"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=tsafpga"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=EquipMp"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=AtmMp"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=AtmBp"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=Aal0DynAdm"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=Aal0StaticAdm"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=Aal0TermMp"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=Aal0TuBp"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=Aal2Mp"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=Aal2Bp"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=Aal2Rh"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=Aal2Adm"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=Aal5DynAdm"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=Aal5StaticAdm"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=Aal5TermMp"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=Aal5TermBp"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=Aal05Ncc"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=AalCc"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=NssMp"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=NssScb"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=NssSyciBp"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=NssSyciMp"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=Pms"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=UsaalAdm"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=UsaalTerm"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=TuFpga"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=PhyE1Mp"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=PhyE1Bp"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=EqpM1Bp"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=amd_m1_fpga"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=PhyStm1Mp"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=PhyStm1Bp"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=EqpM4Bp"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=Cs"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=Cma"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=Oms"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=VbjOrb"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=Classes"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=Asms"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=optional"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=NssTuRNCBp"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=Aal2NccAdm12"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=Aal2DisNcc12"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=Aal2CpsRc12"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=Aal2Ap12"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=Aal2Ap13"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=SppMp"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=SppFpga"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=NsaalAdm"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=NsaalTerm"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=SppBpBasic"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=SppBpAal025"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=SccServer"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=SccAdm"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=XPM"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=DbmFpgaLoader"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=tuRnRnc"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=RncLmCenDh"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=RncLmCenRh"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=RncLmBdh"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=RncLmDh"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=RncLmCc"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=RncLmDc"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=RncLmDc"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=RncLmIurCc"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=RncLmFro"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=RncLmMao"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=RncLmUe"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=RncLmModOm"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=RncLmCenOm"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=RnhLmCenRnh"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=RncLmRanap"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=RncLmRnsap"' >> $MOSCRIPT
echo '   "ManagedElement=1,SwManagement=1,LoadModule=RncLmCell"' >> $MOSCRIPT
echo ')' >> $MOSCRIPT
#########################################
# Set UpgradePackage END (1470setUpgradePackage.sh)
#########################################

#25
#########################################
# Set RnlQosClassProfile START (1470setUpgradePackage.sh)
#########################################
STOP=2
COUNT=1

while [ "$COUNT" -le "$STOP" ]
do

  case "$COUNT"
  in
   1) IDENTITY=Uplink ; REF="ManagedElement=1,RncFunction=1,RabHandling=1,RnlQosClassProfile=Uplink,SpiQosClass=1" ;;
   2) IDENTITY=Downlink ; REF="ManagedElement=1,RncFunction=1,RabHandling=1,RnlQosClassProfile=Downlink,SpiQosClass=1" ;;
  esac

  echo 'SET' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo '  mo "ManagedElement=1,RncFunction=1,RabHandling=1,RnlQosClassProfile='$IDENTITY >> $MOSCRIPT
  echo "    tcPsBgQosRef Ref "$REF >> $MOSCRIPT
  #echo "    tcPsBgQosRef Ref ManagedElement=1,RncFunction=1,RabHandling=1,RnlQosClassProfile=Uplink,SpiQosClass=1" >> $MOSCRIPT
  echo ')' >> $MOSCRIPT

  XSTOP=4
  XCOUNT=1

  while [ "$XCOUNT" -le "$XSTOP" ]
  do
   
     REF="ManagedElement=1,RncFunction=1,RabHandling=1,RnlQosClassProfile="$IDENTITY",SpiQosClass=1"$XCOUNT

     echo 'SET' >> $MOSCRIPT
     echo '(' >> $MOSCRIPT
     echo '  mo "ManagedElement=1,RncFunction=1,RabHandling=1,RnlQosClassProfile='$IDENTITY',TrafficClassPsInt='$XCOUNT >> $MOSCRIPT
     echo "    qosRef Ref "$REF >> $MOSCRIPT
     echo ')' >> $MOSCRIPT

    XCOUNT=`expr $XCOUNT  + 1`
  done




  COUNT=`expr $COUNT  + 1`
done
#########################################
# Set RnlQosClassProfile END (1470setUpgradePackage.sh)
#########################################

#EXECUTE_BELOW=YE
#if [ $EXECUTE_BELOW == YES ]
#then

#26
#########################################
# Create ExtGCells START (aOut1020createExtGsmCell.sh)
#########################################

echo "//..$0:$RNCNAME wait for createExtGsmCell "`date`
(./aOut1020createExtGsmCell.sh $SIMNAME $ENV $RNCIDCOUNT >> $MOSCRIPT)
(./aOut1020createExtGsmCell.sh $SIMNAME $ENV $RNCIDCOUNT >> $MOSCRIPT)&
createExtGsmCellBGP=$!
echo "//..$0:$RNCNAME just after createExtGsmCell "`date`

#########################################
# Create ExtGCells END (aOut1020createExtGsmCell.sh)
#########################################

#27
#########################################
# Create ExtUCells START (aOut1030createExtUtranCell.sh)
#########################################
#(./aOut1030createExtUtranCell.sh $SIMNAME $ENV $RNCIDCOUNT >> $MOSCRIPT)&
#createExtUtranCellBGP=$!
#echo "//..$0:$RNCNAME just after createExtUtranCell for RNC01 to RNC106 "`date`


#########################################
# Create ExtUCells END (aOut1030createExtUtranCell.sh)
#########################################

#28
#########################################
# Create LocationAreas START (aOut1040createAreas.sh)
#########################################
#echo "SIMNAME="$SIMNAME
#echo "ENV="$ENV
#echo "RNCIDCOUNT="$RNCIDCOUNT

echo "//..$0:$RNCNAME wait for createAreas "`date`
(./aOut1040createAreas.sh $SIMNAME $ENV $RNCIDCOUNT >> $MOSCRIPT)
#(./aOut1040createAreas.sh $SIMNAME $ENV $RNCIDCOUNT >> $MOSCRIPT)&
#createAreasBGP=$!
#echo "//..$0:$RNCNAME just after createAreas "`date`


#########################################
# Create LocationAreas END (aOut1040createAreas.sh)
#########################################

#echo "//..$0:$RNCNAME wait for createExtGsmCellBGP "`date`
#wait $createExtGsmCellBGP 

#29
#########################################
# Create UtranCells START (aOut1050createUtranCell.sh)
#########################################

#echo "//..$0:$RNCNAME wait for createAreasBGP "`date`
#wait $createAreasBGP


echo "//..$0:$RNCNAME wait for createUtranCell "`date`
./aOut1050createUtranCell.sh $SIMNAME $ENV $RNCIDCOUNT >> $MOSCRIPT

#echo "//..$0:$RNCNAME wait for createExtGsmCellBGP createExtUtranCellBGP "`date`
#wait $createExtGsmCellBGP $createExtUtranCellBGP 

#########################################
# Create UtranCells END (aOut1050createUtranCell.sh)
#########################################

#30
#########################################
# Create UtranRelations START (aOut1080createUtranRelation.sh)
#########################################
#For RNC01 to RNC109
echo "//..$0:$RNCNAME wait for createUtranRelation "`date`
(./aOut1080createUtranRelation.sh $SIMNAME $ENV $RNCIDCOUNT >> $MOSCRIPT)
#(./aOut1080createUtranRelation.sh $SIMNAME $ENV $RNCIDCOUNT >> $MOSCRIPT)&
#createUtranRelationsBGP=$!
#echo "//..$0:$RNCNAME just after createUtranRelation "`date`

#########################################
# Create UtranRelations END (aOut1080createUtranRelation.sh)
#########################################

#31
#########################################
# START UtranRelations START (aOut1090createGsmRelation.sh)
#########################################

echo "//..$0:$RNCNAME wait for createGsmRelation "`date`
(./aOut1090createGsmRelation.sh $SIMNAME $ENV $RNCIDCOUNT >> $MOSCRIPT)
(./aOut1090createGsmRelation.sh $SIMNAME $ENV $RNCIDCOUNT >> $MOSCRIPT)&
createGsmRelationsBGP=$!
echo "//..$0:$RNCNAME just after createGsmRelation "`date`
#########################################
# END UtranRelations END (aOut1090createGsmRelation.sh)
#########################################

#32
#########################################
# START CoverageRelations START (aOut1100createCoverageRelation.sh)
#########################################

echo "//..$0:$RNCNAME wait for createCoverageRelation "`date`
(./aOut1100createCoverageRelation.sh $SIMNAME $ENV $RNCIDCOUNT >> $MOSCRIPT)
#(./aOut1100createCoverageRelation.sh $SIMNAME $ENV $RNCIDCOUNT >> $MOSCRIPT)&
#createCoverageRelationBGP=$!
#echo "//..$0:$RNCNAME just after createCoverageRelation "`date`
#########################################
# END UtranRelations END (aOut1100createCoverageRelation.sh)
#########################################

#echo "//..$0:$RNCNAME wait for createUtranRelationsBGP createGsmRelationsBGP createCoverageRelationBGP "`date`
#wait $createUtranRelationsBGP $createGsmRelationsBGP $createCoverageRelationBGP


#fi # ENDIF EXECUTE_BELOW

echo "//"
echo "//.....$0:$RNCNAME MAKING MO SCRIPT RNC ended at "`date`
echo "//"

echo "//" >> $MOSCRIPT
echo "//.....$0:$RNCNAME MAKING MO SCRIPT RNC ended at "`date` >> $MOSCRIPT

#########################################
#
# Make MML Script
#
#########################################

##echo ""
##echo "MAKING MML SCRIPT"
##echo ""


echo '.open '$SIMNAME >> $MMLSCRIPT
echo '.select '$RNCNAME >> $MMLSCRIPT
echo '.start ' >> $MMLSCRIPT
echo 'useattributecharacteristics:switch="off";' >> $MMLSCRIPT

if [ "$SKIP_VERIFY_KERTAYLE" == "YES" ]
then
  echo 'kertayle:file="'$PWD'/'$MOSCRIPT'",skip_verify=skip;' >> $MMLSCRIPT
else
  echo 'kertayle:file="'$PWD'/'$MOSCRIPT'";' >> $MMLSCRIPT
fi

$NETSIMDIR/$NETSIMVERSION/netsim_pipe < $MMLSCRIPT

#rm $PWD/$MOSCRIPT
rm $PWD/$MMLSCRIPT

echo "//...$0:$SIMNAME rnc script ended running at "`date`
echo "//"

