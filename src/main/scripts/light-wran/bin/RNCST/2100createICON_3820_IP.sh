#!/bin/sh

# Created by  : Fatih ONUR
# Created in  : 18.07.2012
##
### VERSION HISTORY
# Ver1        : Created for WRAN TERE 13A
# Purpose     : ICON configuration
# Description : Assume that simulation is no transport configured and proper radio mos are created 
#                 Script is tested against no transport simulation(radio)
#                 In the case of error please check radio mos are created properly
# Date        : 19 JUL 2012
# Who         : Fatih ONUR
##########################################
# Ver2        : Created for WRAN TERE 13B
# Purpose     : ICON configuration
# Description : Updated interface name on the IP ethernetlink 
# Date        : 26 Feb 2013
# Who         : Rob Guinan


if [ "$#" -ne 3  ]
then
cat<<HELP

####################
# HELP
####################

Usage  : $0 <sim name> <env file> <rnc num>

Example: $0 RNCL130-ST-RNC01 R7-ST-G-N.env 1

HELP

exit
fi

################################
# MAIN
################################

echo "... $0 script started running at "`date`
echo ""


SIMNAME=$1
ENV=$2
RNCIDCOUNT=$3

## SEPARATORs for arguments (between excel columns)
SEP01=","

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

. ../../dat/$ENV
. ../utilityFunctions.sh

FILE=../$ICONCONFIGFILE


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
# Make MO Script
#########################################

echo ""
echo "MAKING MO SCRIPT"
echo ""

# read ICON config data from the ICONCONFIGFILE
#
LINE=`egrep "${RNCNAME}," ${PWD}/$FILE`
#echo "LINE="$LINE
#exit

MAXRBSPERSCTP=64

NUMOFRBS=`getNumOfRBS $RNCCOUNT $RNCRBSARRAY $RBSCELLARRAY`
NUMOFSCTP=`getGroup $NUMOFRBS $MAXRBSPERSCTP`


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

STOP=`getGroup $NUMOFRBS 126`
VAR=1

while [ "$VAR" -le "$STOP" ]
do

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

  VAR=`expr $VAR + 1`
done


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



############################ CREATE
############################## Vlan

VLAN_vid=100;

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,EthernetSwitchFabric=1' >> $MOSCRIPT
echo ' identity 1' >> $MOSCRIPT
echo ' moType Vlan' >> $MOSCRIPT
echo ' exception none' >> $MOSCRIPT
echo ' nrOfAttributes 1' >> $MOSCRIPT
echo '   vid Integer '$VLAN_vid'' >> $MOSCRIPT
echo ')' >> $MOSCRIPT


COUNT=1
STOP=2
while [ "$COUNT" -le "$STOP" ]
do

  ############################ CREATE
  ############################## IpAccessHostEt

  IPACCESSHOSTID=$COUNT

  echo 'CREATE' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo '  parent "ManagedElement=1,IpSystem=1' >> $MOSCRIPT
  echo ' identity '$IPACCESSHOSTID >> $MOSCRIPT
  echo ' moType IpAccessHostEt' >> $MOSCRIPT
  echo ' exception none' >> $MOSCRIPT
  echo ' nrOfAttributes 0' >> $MOSCRIPT
  echo ')' >> $MOSCRIPT

  COUNT=`expr $COUNT + 1`
done




COUNT=1
STOP=$NUMOFSCTP
while [ "$COUNT" -le "$STOP" ]
do 

  ############################ CREATE
  ############################## Sctp

  SCTPID=$COUNT

  echo 'CREATE' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo '  parent "ManagedElement=1,TransportNetwork=1"' >> $MOSCRIPT
  echo ' identity '$SCTPID >> $MOSCRIPT
  echo ' moType Sctp' >> $MOSCRIPT
  echo ' exception none' >> $MOSCRIPT
  echo ' nrOfAttributes 0' >> $MOSCRIPT
  echo ')' >> $MOSCRIPT


  ############################ MO 
  ############################## IpAccessSctp

  IPACCESSHOSTGPBID=$COUNT

  echo 'CREATE' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo '  parent "ManagedElement=1,IpSystem=1' >> $MOSCRIPT
  echo ' identity '$IPACCESSHOSTGPBID >> $MOSCRIPT
  echo ' moType IpAccessSctp' >> $MOSCRIPT
  echo ' exception none' >> $MOSCRIPT
  echo ' nrOfAttributes 0' >> $MOSCRIPT
  echo ')' >> $MOSCRIPT


  ############################ SET
  ############################## Sctp

  echo 'SET' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo '  mo "ManagedElement=1,TransportNetwork=1,Sctp='$SCTPID'"' >> $MOSCRIPT
  echo ' exception none' >> $MOSCRIPT
  echo ' nrOfAttributes 1' >> $MOSCRIPT
  echo '   ipAccessSctpRef Ref "ManagedElement=1,IpSystem=1,IpAccessSctp='$IPACCESSHOSTGPBID'"' >> $MOSCRIPT
  echo ')' >> $MOSCRIPT


  ############################ SET
  ############################## IpAccessSctp
  
  echo 'SET' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo '  mo "ManagedElement=1,IpSystem=1,IpAccessSctp='$IPACCESSHOSTGPBID'"' >> $MOSCRIPT
  echo ' exception none' >> $MOSCRIPT
  echo ' nrOfAttributes 2' >> $MOSCRIPT
  echo '   ipAccessHostEtRef1 Ref "ManagedElement=1,IpSystem=1,IpAccessHostEt=1"' >> $MOSCRIPT
  echo '   ipAccessHostEtRef2 Ref "ManagedElement=1,IpSystem=1,IpAccessHostEt=2"' >> $MOSCRIPT
  echo ')' >> $MOSCRIPT

  COUNT=`expr $COUNT + 1`
done




############################ CREATE
############################## IpAccessHostPool

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,IpSystem=1' >> $MOSCRIPT
echo ' identity Iub' >> $MOSCRIPT
echo ' moType IpAccessHostPool' >> $MOSCRIPT
echo ' exception none' >> $MOSCRIPT
echo ' nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT


############################ SET
############################## IpAccessHostPool

echo 'SET' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  mo "ManagedElement=1,IpSystem=1,IpAccessHostPool=Iub' >> $MOSCRIPT
echo ' exception none' >> $MOSCRIPT
echo ' nrOfAttributes 2' >> $MOSCRIPT
echo ' ipAccessHostRef Array Ref 2 ' >> $MOSCRIPT
echo '   "ManagedElement=1,IpSystem=1,IpAccessHostEt=1" ' >> $MOSCRIPT
echo '   "ManagedElement=1,IpSystem=1,IpAccessHostEt=2" ' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

IPACCESSHOSTCOUNT=1
RNC_COLUMN=2
COUNT=3
STOP=4
while [ "$COUNT" -le "$STOP" ]
do  

  ############################ CREATE
  ############################## ExchangeTerminalIp

  echo 'CREATE' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo '  parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot='$COUNT',PlugInUnit=1"' >> $MOSCRIPT
  echo ' identity 1' >> $MOSCRIPT
  echo ' moType ExchangeTerminalIp' >> $MOSCRIPT
  echo ' exception none' >> $MOSCRIPT
  echo ' nrOfAttributes 0' >> $MOSCRIPT
  echo ')' >> $MOSCRIPT

 
  ############################ CREATE
  ############################## GigaBitEthernet
 
  echo 'CREATE' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo '  parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot='$COUNT',PlugInUnit=1,ExchangeTerminalIp=1"' >> $MOSCRIPT
  echo ' identity 1' >> $MOSCRIPT
  echo ' moType GigaBitEthernet' >> $MOSCRIPT
  echo ' exception none' >> $MOSCRIPT
  echo ' nrOfAttributes 0' >> $MOSCRIPT
  echo ')' >> $MOSCRIPT


  ############################ CREATE
  ############################## IpInterface

  echo 'CREATE' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo '  parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot='$COUNT',PlugInUnit=1,ExchangeTerminalIp=1,GigaBitEthernet=1"' >> $MOSCRIPT
  echo ' identity 1' >> $MOSCRIPT
  echo ' moType IpInterface' >> $MOSCRIPT
  echo ' exception none' >> $MOSCRIPT
  echo ' nrOfAttributes 0' >> $MOSCRIPT
  echo ')' >> $MOSCRIPT


  ############################ SET
  ############################## IpInterface

  IPINTERFACE_vid=0
  IPINTERFACE_vLan="False"
  IPINTERFACE_networkPrefixLength=25

  #IPINTERFACE_defaultRouter0=1
  #IPINTERFACE_defaultRouter1=1
  #IPINTERFACE_ownIpAddressActive=25
  #IPINTERFACE_subnet=100

  echo "RNC_COLUMN="$RNC_COLUMN

  IPINTERFACE_defaultRouter0=`echo $LINE | awk -F $SEP01 '{print $'\$RNC_COLUMN'}' | awk -F "&" '{print $1}' | awk -F"=" '{print $2}'`
  echo "IPINTERFACE_defaultRouter0="$IPINTERFACE_defaultRouter0

  IPINTERFACE_defaultRouter1=`echo $LINE | awk -F $SEP01 '{print $'\$RNC_COLUMN'}' | awk -F "&" '{print $2}' | awk -F"=" '{print $2}'`
  echo "IPINTERFACE_defaultRouter1="$IPINTERFACE_defaultRouter1

  IPINTERFACE_ownIpAddressActive=`echo $LINE | awk -F $SEP01 '{print $'\$RNC_COLUMN'}' | awk -F "&" '{print $3}' | awk -F"=" '{print $2}'`
  echo "IPINTERFACE_ownIpAddressActive="$IPINTERFACE_ownIpAddressActive

  IPINTERFACE_subnet=`echo $LINE | awk -F $SEP01 '{print $'\$RNC_COLUMN'}' | awk -F "&" '{print $4}' | awk -F"=" '{print $2}'`
  echo "IPINTERFACE_subnet="$IPINTERFACE_subnet

  IPINTERFACE_vlanRef="ManagedElement=1,EthernetSwitchFabric=1,Vlan=1"

  echo 'SET' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo '  mo "ManagedElement=1,Equipment=1,Subrack=MS,Slot='$COUNT',PlugInUnit=1,ExchangeTerminalIp=1,GigaBitEthernet=1,IpInterface=1"' >> $MOSCRIPT
  echo ' nrOfAttributes 5' >> $MOSCRIPT
  echo '  vid Integer '$IPINTERFACE_vid'' >> $MOSCRIPT
  echo '  networkPrefixLength Integer '$IPINTERFACE_networkPrefixLength'' >> $MOSCRIPT
  echo '  vLan Boolean '$IPINTERFACE_vLan'' >> $MOSCRIPT
  echo '  vlanRef Ref '$IPINTERFACE_vlanRef'' >> $MOSCRIPT
  echo '   defaultRouter0 String '$IPINTERFACE_defaultRouter0'' >> $MOSCRIPT
  echo '   defaultRouter1 String '$IPINTERFACE_defaultRouter1'' >> $MOSCRIPT
  echo '   ownIpAddressActive String '$IPINTERFACE_ownIpAddressActive'' >> $MOSCRIPT
  echo '   subnet String '$IPINTERFACE_subnet'' >> $MOSCRIPT
  echo ')' >> $MOSCRIPT



  ############################ SET
  ############################## IpAccessHostEt

  IPACCESSHOSTET_ipAddress=$IPINTERFACE_ownIpAddressActive
  echo "IPACCESSHOSTET_ipAddress="$IPACCESSHOSTET_ipAddress

  echo 'SET' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo '  mo "ManagedElement=1,IpSystem=1,IpAccessHostEt='$IPACCESSHOSTCOUNT'"' >> $MOSCRIPT
  echo ' exception none' >> $MOSCRIPT
  echo ' nrOfAttributes 1' >> $MOSCRIPT
  echo ' ipInterfaceMoRef Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot='$COUNT',PlugInUnit=1,ExchangeTerminalIp=1,GigaBitEthernet=1,IpInterface=1"' >> $MOSCRIPT
  echo '   ipAddress String '$IPACCESSHOSTET_ipAddress'' >> $MOSCRIPT
  echo ')' >> $MOSCRIPT


  echo ""
  IPACCESSHOSTCOUNT=`expr $IPACCESSHOSTCOUNT + 1`
  RNC_COLUMN=`expr $RNC_COLUMN + 1`
  COUNT=`expr $COUNT + 1`
done


COUNT=5
STOP=6
while [ "$COUNT" -le "$STOP" ]
do

  ############################ CREATE
  ############################## EthernetSwitchModule

  echo 'CREATE' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo '  parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot='$COUNT',PlugInUnit=1"' >> $MOSCRIPT
  echo ' identity 1' >> $MOSCRIPT
  echo ' moType EthernetSwitchModule' >> $MOSCRIPT
  echo ' exception none' >> $MOSCRIPT
  echo ' nrOfAttributes 0' >> $MOSCRIPT
  echo ')' >> $MOSCRIPT


  COUNTX=1
  STOPX=7
  while [ "$COUNTX" -le "$STOPX" ]
  do

    ############################ CREATE
    ############################## EthernetSwitchModulePort

    echo 'CREATE' >> $MOSCRIPT
    echo '(' >> $MOSCRIPT
    echo '  parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot='$COUNT',PlugInUnit=1,EthernetSwitchModule=1"' >> $MOSCRIPT
    echo ' identity '$COUNTX >> $MOSCRIPT
    echo ' moType EthernetSwitchModulePort' >> $MOSCRIPT
    echo ' exception none' >> $MOSCRIPT
    echo ' nrOfAttributes 0' >> $MOSCRIPT
    echo ')' >> $MOSCRIPT

    ############################ SET
    ############################## EthernetSwitchModulePort
  
    ETHERNETSWITCHMODULEPORT_externalPort=false
    if [ "$COUNTX" -eq 1 ]
    then
      ETHERNETSWITCHMODULEPORT_externalPort=true 
    fi

    echo 'SET' >> $MOSCRIPT
    echo '(' >> $MOSCRIPT
    echo '  mo "ManagedElement=1,Equipment=1,Subrack=MS,Slot='$COUNT',PlugInUnit=1,EthernetSwitchModule=1,EthernetSwitchModulePort='$COUNTX'"' >> $MOSCRIPT
    echo ' nrOfAttributes 2' >> $MOSCRIPT
    echo '   vlanRef Array Ref 1 ' >> $MOSCRIPT
    echo '     ManagedElement=1,EthernetSwitchFabric=1,Vlan=1' >> $MOSCRIPT
    echo '   externalPort Boolean '$ETHERNETSWITCHMODULEPORT_externalPort >> $MOSCRIPT
    echo ')' >> $MOSCRIPT


    COUNTX=`expr $COUNTX + 1`
  done

  COUNT=`expr $COUNT + 1`
done


COUNT=1
STOP=$NUMOFRBS

while [ "$COUNT" -le "$STOP" ]
do
  ############################ SET
  ############################## IubLink

  SCTPCOUNT=`getGroup $COUNT $MAXRBSPERSCTP`

  echo 'SET' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo 'mo "ManagedElement=1,RncFunction=1,IubLink='$COUNT'"' >> $MOSCRIPT
  echo ' exception none' >> $MOSCRIPT
  echo ' nrOfAttributes 3' >> $MOSCRIPT
  echo '  sctpRef Ref "ManagedElement=1,TransportNetwork=1,Sctp='$SCTPCOUNT'"' >> $MOSCRIPT
  echo '  userPlaneIpResourceRef Ref "ManagedElement=1,IpSystem=1,IpAccessHostPool=Iub"' >> $MOSCRIPT
  echo '  remoteCpIpAddress1 String 1.1.1.'$COUNT'' >> $MOSCRIPT
  echo ')' >> $MOSCRIPT


############################ CREATE
  ############################## IpAccessHostGpb

  echo 'CREATE' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo '  parent "ManagedElement=1,IpSystem=1"' >> $MOSCRIPT
  echo ' identity '$COUNT >> $MOSCRIPT
  echo ' moType IpAccessHostGpb' >> $MOSCRIPT
  echo ' exception none' >> $MOSCRIPT
  echo ' nrOfAttributes 0' >> $MOSCRIPT
  echo ')' >> $MOSCRIPT

############################ SET
  ############################## IpAccessHostGpb
  echo 'SET' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo 'mo "ManagedElement=1,IpSystem=1,IpAccessHostGpb='$COUNT'"' >> $MOSCRIPT
  echo ' exception none' >> $MOSCRIPT
  echo ' nrOfAttributes 2' >> $MOSCRIPT
  echo '  userLabel String  Inconsistency' >> $MOSCRIPT
  echo '  ipAddress1 String 1.1.1.'$COUNT'' >> $MOSCRIPT
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

echo '.open '$SIMNAME >> $MMLSCRIPT
echo '.select '$RNCNAME >> $MMLSCRIPT
echo '.start ' >> $MMLSCRIPT
echo 'useattributecharacteristics:switch="off";' >> $MMLSCRIPT
echo 'kertayle:file="'$PWD'/'$MOSCRIPT'";' >> $MMLSCRIPT


$NETSIMDIR/$NETSIMVERSION/netsim_pipe < $MMLSCRIPT


rm $PWD/$MOSCRIPT
rm $PWD/$MMLSCRIPT


echo "...$0 script ended at "`date`
echo ""


