#!/bin/sh

# Created by  : Gordon Morrow
# Created in  : 02.08.2012
##
### VERSION HISTORY
# Ver1        : Created for WRAN TERE 13A
# Purpose     : ICON configuration
# Description : Assume that simulation is no transport and some dependent MOs are already created during radio n/w setup
#                 Script is tested against no transport simulation (after 1's series script run against nodes)
#		  In the case of error please check 1's series script run properly
#        
# 		The following scripts create the following in the 1 series scripts:
#		1126createAtmPort.sh ( Creates the 8 ports)
#		1180createTNMOs.sh (Creates synchronization, MspgExtended & Aal2Sp and sets a2ea to 12345
#
# Date        : 02 AUG 2012
# Who         : Gordon Morrow
####################################################
# Ver2        : Created for WRAN TERE 13A
# Purpose     : ICON configuration
# Description : Assume that simulation is no transport and some dependent MOs are already created during radio n/w setup
#                 Script is tested against no transport simulation (after 1's series script run against nodes)
#                 In the case of error please check 1's series script run properly
# Date        : 28 Sep 2012
# Who         : Fatih ONUR


###########################################
# Ver3        : Created for WRAN TERE 13B
# Purpose     : ICON configuration
# Description : Assume that simulation is no transport and some dependent MOs are already created during radio n/w setup
#             Deleted IpSync ref MO 
#                 In the case of error please check 1's series script run properly
# Date        : 25 Feb 2013
# Who         : Rob Guinan





if [ "$#" -ne 5  ]
then
cat<<HELP

####################
# HELP
####################

Usage  : $0 <sim name> <env file> <rnc num> RBSSTART RBSEND

Example: $0 RNCL130-ST-RNC01 R7-ST-G-N.env 1

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

if [ "$RNC_NODE_CREATION" != "YES" ]
then
  RNCNAME=""
fi


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

NUMOFRBS=$RBSEND

COUNT=$RBSSTART
STOP=$NUMOFRBS
MOFILECOUNT=1


while [ "$COUNT" -le "$STOP" ]
do #Start of COUNT

  if [ "$COUNT" -le 9 ]
   then
    RBSNAME=RBS0
   else
    RBSNAME=RBS
  fi

  MOFILEEXTENSION="__"$MOFILECOUNT".mo"

  RBSCOUNT=$RBSNAME$COUNT

    echo "**** $RNCNAME$RBSNAME$COUNT ****"    
    # read ICON config data from the ICONCONFIGFILE
    #
    LINE=`grep "$RNCNAME$RBSNAME$COUNT", ${PWD}/$FILE`

    # ICON related MOs Attributes: Dynamic
    #
    echo "---Dynamic:--- ICON related MOs Attributes---"
    IP_nodeIpAddress=`echo $LINE | awk -F "," '{print $2}' | awk -F"=" '{print $2}'`    
    echo "IP_nodeIpAddress="$IP_nodeIpAddress

    #IPHOSTLINK_ipAddress=`echo $LINE | awk -F "," '{print $3}' | awk -F "&" '{print $1}' | awk -F"=" '{print $2}'`
    #echo "IPHOSTLINK_ipAddress="$IPHOSTLINK_ipAddress
    #IPHOSTLINK_ipv4Addresses[0]=`echo $LINE | awk -F "," '{print $3}' | awk -F "&" '{print $2}' | awk -F"=" '{print $2}'`
    #echo "IPHOSTLINK_ipv4Addresses[0]="${IPHOSTLINK_ipv4Addresses[0]}

    IPINTERFACE01_defaultRouter0=`echo $LINE | awk -F "," '{print $4}' | awk -F "&" '{print $1}' | awk -F"=" '{print $2}'`
    echo "IPINTERFACE01_defaultRouter0=$IPINTERFACE01_defaultRouter0"
    IPINTERFACE01_subnet=`echo $LINE | awk -F "," '{print $4}' | awk -F "&" '{print $2}' | awk -F"=" '{print $2}'`
    echo "IPINTERFACE01_subnet="$IPINTERFACE01_subnet

    IPACCESSHOSTET_ipAddress=`echo $LINE | awk -F "," '{print $6}' | awk -F "&" '{print $1}' | awk -F"=" '{print $2}'`
    echo "IPACCESSHOSTET_ipAddress="$IPACCESSHOSTET_ipAddress

    # ICON related MOs Attributes: Manual
    #
    echo "---Manual:--- ICON related MOs Attributes---"
    IPINTERFACE01_networkPrefixLength=29
    IPINTERFACE01_vLan="true"
    IPINTERFACE01_vid=100

    echo "IPINTERFACE01_networkPrefixLength=$IPINTERFACE01_networkPrefixLength"
    echo "IPINTERFACE01_vLan=$IPINTERFACE01_vLan"
    echo "IPINTERFACE01_vid=$IPINTERFACE01_vid"


  # TESTING ONLY
  #IP_nodeIpAddress="191.168.0.0"
  #IPHOSTLINK_ipAddress="191.168.0.0"
  #IPHOSTLINK_ipv4Addresses[0]="191.168.0.0"
  #IPINTERFACE01_defaultRouter0="191.168.0.0"
  #IPINTERFACE01_subnet="191.168.0.0"
  #IPINTERFACE02_defaultRouter0="191.168.0.0"
  #IPINTERFACE02_subnet="191.168.0.0"
  #IPACCESSHOSTET_ipAddress="191.168.0.0"

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
echo '   identity 1-1-2' >> $MOSCRIPT$MOFILEEXTENSION
echo '   moType AtmPort' >> $MOSCRIPT$MOFILEEXTENSION
echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
echo '   nrOfAttributes 1' >> $MOSCRIPT$MOFILEEXTENSION
#echo '   uses Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=1,PlugInUnit=1,ExchangeTerminal=ET-MFG,Os155SpiTtp=ta1,Sts3CspeTtp=ta1"' >> $MOSCRIPT$MOFILEEXTENSION
echo ')' >> $MOSCRIPT$MOFILEEXTENSION

# Creating Aal2Ap under Aal2Sp
echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
echo '(' >> $MOSCRIPT$MOFILEEXTENSION
echo '  parent "ManagedElement=1,TransportNetwork=1"' >> $MOSCRIPT$MOFILEEXTENSION
echo '   identity 1' >> $MOSCRIPT$MOFILEEXTENSION
echo '   moType Aal2Sp' >> $MOSCRIPT$MOFILEEXTENSION
echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
echo '   nrOfAttributes 0' >> $MOSCRIPT$MOFILEEXTENSION
echo ')' >> $MOSCRIPT$MOFILEEXTENSION

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

# First We create the software management MO's piutype and Reliable Program Uniter
  cat >> $MOSCRIPT$MOFILEEXTENSION << MOSCT

    CREATE
    (
      parent "ManagedElement=1,SwManagement=1"
       identity sctp
       moType ReliableProgramUniter
       exception none
       nrOfAttributes 0
    )
  
    CREATE
    (
      parent "ManagedElement=1,SwManagement=1"
       identity 1
       moType PiuType
       exception none 
       nrOfAttributes 0
    )
 
MOSCT

#Creating the UniSaalProfile, AtmTrafficDescriptor1, AtmTrafficDescriptor2 and AtmTrafficDescriptor3
cat  >> $MOSCRIPT$MOFILEEXTENSION << MOSCT

    CREATE
    (
    parent "ManagedElement=1,TransportNetwork=1"
    identity 1
    moType UniSaalProfile
    exception none
    nrOfAttributes 0
    )

    CREATE
    (
    parent "ManagedElement=1,TransportNetwork=1"
    identity C1P4528
    moType AtmTrafficDescriptor
    exception none
    nrOfAttributes 0
    )

    CREATE
    (
    parent "ManagedElement=1,TransportNetwork=1"
    identity U3P1000M80
    moType AtmTrafficDescriptor
    exception none
    nrOfAttributes 0
    )

    CREATE
    (
    parent "ManagedElement=1,TransportNetwork=1"
    identity C2P4000
    moType AtmTrafficDescriptor
    exception none
    nrOfAttributes 0
    )
MOSCT

# delete 2 slots for new slots "Cbu and ET-MFX"
  COUNTX=27
  while [ "$COUNTX" -le 28 ]
  do #Start of COUNTX

    cat >> $MOSCRIPT$MOFILEEXTENSION << MOSCT

      DELETE
      (
       mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=$COUNTX"
        identity $COUNT
        exception none
        nrOfAttributes 0
      )
MOSCT

    COUNTX=`expr $COUNTX + 1`
  done  # END OF COUNTX


# Below is creating the 2 slots "Cbu and ET-MFX"
COUNTX=1
while [ "$COUNTX" -le 2 ]
  do # COUNTX starting again was initialised

    case "$COUNTX"
    in
      1) SLOTID="CBU";;
      2) SLOTID="ET-MFX";;
    esac

    cat >> $MOSCRIPT$MOFILEEXTENSION << MOSCT

      CREATE
      (
        parent "ManagedElement=1,Equipment=1,Subrack=1"
         identity $SLOTID
         moType Slot
         exception none
         nrOfAttributes 0
      )

      CREATE
      (
        parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=$SLOTID"
         identity 1
         moType PlugInUnit
         exception none
         nrOfAttributes 0
           piuType Ref "ManagedElement=1,SwManagement=1,PiuType=1"
      )
MOSCT

# Below I am creating the necessery MO's under the 2 slots so using an if statement to seperate ET-MFX and CBU
    if [ "$SLOTID" == "CBU" ]
    then

 
      cat >> $MOSCRIPT$MOFILEEXTENSION << MOSCT

        CREATE
        (
          parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=CBU,PlugInUnit=1"
           identity 1
           moType Cbu
           exception none
           nrOfAttributes 0
        )

        CREATE
        (
          parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=CBU,PlugInUnit=1,Cbu=1"
           identity 1
           moType GeneralProcessorUnit
           exception none
           nrOfAttributes 0
        )

        CREATE
        (
          parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=CBU,PlugInUnit=1,Cbu=1,GeneralProcessorUnit=1"
           identity 1
           moType MediumAccessUnit
           exception none
           nrOfAttributes 0
        )

MOSCT
    fi

    if [ "$SLOTID" == "ET-MFX" ]
    then
      cat >> $MOSCRIPT$MOFILEEXTENSION << MOSCT

        CREATE
        (
          parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=ET-MFX,PlugInUnit=1"
           identity 1
           moType ExchangeTerminalIp
           exception none
           nrOfAttributes 0
        ) 

        CREATE
        (
          parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=ET-MFX,PlugInUnit=1,ExchangeTerminalIp=1"
           identity 1
           moType EthernetSwitch
           exception none
           nrOfAttributes 0
             enableVlan Boolean True
             "vlanMembership" Array Struct 2
                nrOfElements 2
                  "egressUntag" Boolean false
                   "vid" Integer 900
                nrOfElements 2
                  "egressUntag" Boolean false
                  "vid" Integer 100
        )

        CREATE
        (
          parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=ET-MFX,PlugInUnit=1,ExchangeTerminalIp=1"
           identity 1
           moType InternalEthernetPort
           exception none
           nrOfAttributes 0
        )
MOSCT


     VAR=1
     while [ $VAR -le 7 ]
     do # Start of VAR
       
       if [ $VAR -eq 3 ] || [ $VAR -eq 4 ]
       then
          ETHERNETSWITCHPORT_egressUntag="false"
          ETHERNETSWITCHPORT_vid=900
       else if [ $VAR -eq 6 ] || [ $VAR -eq 7 ]
       then
          ETHERNETSWITCHPORT_egressUntag="false"
          ETHERNETSWITCHPORT_vid=900
       fi          
       fi
       cat >> $MOSCRIPT$MOFILEEXTENSION << MOSCT          
        CREATE 
        ( 
         parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=ET-MFX,PlugInUnit=1,ExchangeTerminalIp=1,EthernetSwitch=1"
        identity $VAR" 
         moType EthernetSwitchPort
        exception none
        nrOfAttributes 0
MOSCT

        if [ $VAR -eq 3 ] || [ $VAR -eq 4 ] || [ $VAR -eq 6 ] || [ $VAR -eq 7 ]
        then
          cat >> $MOSCRIPT$MOFILEEXTENSION << MOSCT
            vlanMembership Array Struct 1
             nrOfElements 2
             egressUntag Boolean $ETHERNETSWITCHPORT_egressUntag
             vid Integer $ETHERNETSWITCHPORT_vid 
         )
MOSCT

    fi 
       VAR=`expr $VAR + 1`
     done # End of VAR

     cat >> $MOSCRIPT$MOFILEEXTENSION << MOSCT

       CREATE
       (
         parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=ET-MFX,PlugInUnit=1,ExchangeTerminalIp=1,InternalEthernetPort=1"
          identity 1
          moType IpInterface
          exception none
          nrOfAttributes 3
           "vLan" Boolean $IPINTERFACE01_vLan 
           "vid" Integer $IPINTERFACE01_vid
           "vlanRef" Ref "null"
       )
MOSCT

    fi

    COUNTX=`expr $COUNTX + 1`
  done # END OF COUNTX=1

# Creating the IPSystem MO's below

cat >> $MOSCRIPT$MOFILEEXTENSION << MOSCT

    CREATE
    (
      parent "ManagedElement=1"
       identity 1
       moType IpSystem
       exception none
       nrOfAttributes 0
    )

    CREATE
    (
      parent "ManagedElement=1,IpSystem=1"
       identity "1"
       moType IpAccessSctp
       exception none
       nrOfAttributes 7
        "IpAccessSctpId" String ""
        "availabilityStatus" Integer 0
        "ipAccessHostEtRef1" Ref "null"
        "ipAccessHostEtRef2" Ref "null"
        "operationalState" Integer 0
        "reservedBy" Array Ref 0
        "userLabel" String ""
    )

    CREATE
    (
      parent "ManagedElement=1,IpSystem=1"
       identity 1
       moType IpAccessHostEt
       exception none
       nrOfAttributes 0
    )
MOSCT



  COUNTY=1
  while [ "$COUNTY" -le 2 ]
  do #Start of COUNTY

    case "$COUNTY"
    in
      1) MOTYPE=NbapCommon;;
      2) MOTYPE=NbapDedicated;;
    esac

    cat >> $MOSCRIPT$MOFILEEXTENSION << MOSCT

      CREATE
      (
        parent "ManagedElement=1,NodeBFunction=1,Iub=1"
         identity 1
         moType $MOTYPE
         exception none
         nrOfAttributes 0
	   sctpRef Ref "null"

      )
MOSCT

    COUNTY=`expr $COUNTY + 1`
  done # END of COUNTY

# END of IP network generation here
 

# Below is creating Sctp under the transport possibly should be changed to a different location
# The rest is creating teh MO's under IpOam
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
      parent "ManagedElement=1"
       identity 1
       moType IpOam
       exception none
       nrOfAttributes 0
    )

    CREATE
    (
      parent "ManagedElement=1,IpOam=1"
       identity 1
       moType Ip
       exception none
       nrOfAttributes 0
         nodeInterfaceName String "le0"
    )

    CREATE
    (
      parent "ManagedElement=1,IpOam=1,Ip=1"
       identity "1"
       moType IpRoutingTable
       exception none
       nrOfAttributes 4
         "IpRoutingTableId" String "1"
         "indexOfDeletableStaticRoutes" Array Integer 1
          0
         "staticRoutes" Array Struct 1
          nrOfElements 6
           "indexOfStaticRoute" Integer 1
           "ipAddress" String "192.168.0.1"
           "networkMask" String "255.255.252.0"
           "nextHopIpAddr" String "10.4.0.75"
           "redistribute" Boolean true
           "routeMetric" Integer 10
          "userLabel" String ""
    )
MOSCT


# Creating the ethernet link below.
cat >> $MOSCRIPT$MOFILEEXTENSION << MOSCT

CREATE
(
  parent "ManagedElement=1,IpOam=1,Ip=1"
   identity 1
   moType EthernetLink
   exception none
   nrOfAttributes 4
     userLabel String "Created for reqId:4935"
     macAddress String 0A0D008E
     ipAddress String 0.0.0.0
     subnetMask String 255.255.255.2
)
MOSCT




   ############################ SET MO #################################

   cat >> $MOSCRIPT$MOFILEEXTENSION << MOSCT

     SET
     (
       mo "ManagedElement=1,IpOam=1,Ip=1"
        identity 1
        exception none
        nrOfAttributes 1
          userLabel String ICON
          nodeIpAddress String "$IP_nodeIpAddress"
     )


    SET
    (
      mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=ET-MFX,PlugInUnit=1,ExchangeTerminalIp=1,InternalEthernetPort=1,IpInterface=1"
       identity 1
       exception none
       nrOfAttributes 1
         userLabel String ICON
         rps Boolean false
         vLan Boolean $IPINTERFACE01_vLan
         vid Integer $IPINTERFACE01_vid
         networkPrefixLength Integer $IPINTERFACE01_networkPrefixLength
         defaultRouter0 String "$IPINTERFACE01_defaultRouter0"
         subnet String "$IPINTERFACE01_subnet"
    )

    SET 
    ( 
      mo "ManagedElement=1,IpSystem=1,IpAccessHostEt=1" 
       identity 1 
       exception none 
       nrOfAttributes 1 
         userLabel String ICON
         ipAddress String "$IPACCESSHOSTET_ipAddress"
         ipInterfaceMoRef Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=ET-MFX,PlugInUnit=1,ExchangeTerminalIp=1,InternalEthernetPort=1,IpInterface=1"
    ) 


    SET
    (
      mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=ET-MFX,PlugInUnit=1,ExchangeTerminalIp=1,InternalEthernetPort=1"
       exception none
       nrOfAttributes 1
         userLabel String ICON
        "ethernetSwitchRef" Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=ET-MFX,PlugInUnit=1,ExchangeTerminalIp=1,EthernetSwitch=1"
    )


    SET
    (
      mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=ET-MFX,PlugInUnit=1,ExchangeTerminalIp=1,EthernetSwitch=1,EthernetSwitchPort=1"
       exception none
       nrOfAttributes 1
         userLabel String ICON
         systemPort Boolean true
    )


    SET
    (
      mo "ManagedElement=1,SwManagement=1,ReliableProgramUniter=sctp"
       nrOfAttributes 0
         admActiveSlot Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=CBU"
    )


    SET
    (
      mo "ManagedElement=1,TransportNetwork=1,Sctp=1"
       nrOfAttributes 0
         rpuId Ref "ManagedElement=1,SwManagement=1,ReliableProgramUniter=sctp"
         ipAccessSctpRef Ref "ManagedElement=1,IpSystem=1,IpAccessSctp=1"
    )


    SET
    (
      mo "ManagedElement=1,IpSystem=1,IpAccessSctp=1"
       nrOfAttributes 7
        "ipAccessHostEtRef1" Ref "ManagedElement=1,IpSystem=1,IpAccessHostEt=1"
    )


      SET
      (
        mo "ManagedElement=1,NodeBFunction=1,Iub=1"
         nrOfAttributes 0
           userPlaneIpResourceRef Ref "ManagedElement=1,IpSystem=1,IpAccessHostEt=1"
      )
 
MOSCT

# Starting to create the ATM part of the transport network for Dual Stack
#Creating the 8 Aal5TpVccTp under transport network

 COUNT2=1
 while [ "$COUNT2" -le 8 ]
 do # Start of COUNT2

 case "$COUNT2"
 in
   1) ID=bda;;
   2) ID=bca;;
   3) ID=bdb;;
   4) ID=bcb;;
   5) ID=bqa;;
   6) ID=bqb;;
   7) ID=bx1;;
   8) ID=bx2;;
 esac

cat >> $MOSCRIPT$MOFILEEXTENSION << MOSCT

CREATE
(
  parent "ManagedElement=1,TransportNetwork=1"
   identity $ID
   moType Aal5TpVccTp
   exception none
   nrOfAttributes 0
)

MOSCT


COUNT2=`expr $COUNT2 + 1`
done #End of COUNT2

VAR=1
while [ "$VAR" -le 2 ]
do # Start of VAR

case "$VAR"
 in
 1) ID="ManagedElement=1,TransportNetwork=1,Aal5TpVccTp=bx1";;
 2) ID="ManagedElement=1,TransportNetwork=1,Aal5TpVccTp=bx2";;
 esac
 cat >> $MOSCRIPT$MOFILEEXTENSION << MOSCT
 CREATE
(
 parent "ManagedElement=1,IpOam=1,Ip=1"
identity $VAR
moType IpAtmLink
exception none
nrOfAttributes 3
aal5TpVccTpId Ref "$ID"
subnetMask  String 255.255.5.4
ipAddress  String 10.2.4.6
 )
MOSCT
VAR=`expr $VAR + 1`
done
# Creating the 6 UniSaalTp's here

 COUNT2=1
 while [ "$COUNT2" -le 6 ]
 do #Start of COUNT2 reinitilized

 case "$COUNT2"
 in
   1) ID=b1da;;
   2) ID=b1ca;;
   3) ID=b1db;;
   4) ID=b1cb;;
   5) ID=b1qa;;
   6) ID=b1qb;;
 esac

cat >> $MOSCRIPT$MOFILEEXTENSION << MOSCT

CREATE
(
  parent "ManagedElement=1,TransportNetwork=1"
   identity $ID
   moType UniSaalTp
   exception none
   nrOfAttributes 1
   uniSaalProfileId Ref ManagedElement=1,TransportNetwork=1,UniSaalProfile=1
)

MOSCT

COUNT2=`expr $COUNT2 + 1`
done # End of COUNT2

### Creating the ATM port etc 

cat >> $MOSCRIPT$MOFILEEXTENSION << MOSCT
CREATE
(
  parent "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1"
   identity Vp$RBSCOUNT
   moType VplTp
   exception none
   nrOfAttributes 1
   atmTrafficDescriptor Ref ManagedElement=1,TransportNetwork=1,AtmTrafficDescriptor=C1P4528
)

CREATE
(
  parent "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=Vp$RBSCOUNT"
   identity 1
   moType VpcTp
   exception none
   nrOfAttributes 0
)
CREATE
(
  parent "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-2"
  identity Vp$RBSCOUNT
  moType VplTp
  exception none
  nrOfAttributes 1
  atmTrafficDescriptor Ref ManagedElement=1,TransportNetwork=1,AtmTrafficDescriptor=C1P4528
) 


CREATE
(
  parent "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-2,VplTp=Vp$RBSCOUNT"
   identity 1
   moType VpcTp
   exception none
   nrOfAttributes 0
)



MOSCT

cat >> $MOSCRIPT$MOFILEEXTENSION << MOSCT

CREATE
(
  parent "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=Vp$RBSCOUNT,VpcTp=1"
   identity vc32
   moType VclTp
   exception none
   nrOfAttributes 1
   atmTrafficDescriptorId Ref ManagedElement=1,TransportNetwork=1,AtmTrafficDescriptor=U3P1000M80
)
CREATE
(
  parent "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-2,VplTp=Vp$RBSCOUNT,VpcTp=1"
     identity vc33
     moType VclTp
     exception none
     nrOfAttributes 1
     atmTrafficDescriptorId Ref ManagedElement=1,TransportNetwork=1,AtmTrafficDescriptor=U3P1000M80
)
CREATE
(
  parent "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=Vp$RBSCOUNT,VpcTp=1"
   identity vc36
   moType VclTp
   exception none
   nrOfAttributes 1
   atmTrafficDescriptorId Ref ManagedElement=1,TransportNetwork=1,AtmTrafficDescriptor=U3P1000M80
)
CREATE
(
  parent "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=Vp$RBSCOUNT,VpcTp=1"
    identity vc37
    moType VclTp
   exception none
 nrOfAttributes 1
 atmTrafficDescriptorId Ref ManagedElement=1,TransportNetwork=1,AtmTrafficDescriptor=U3P1000M80
 )

CREATE
(
  parent "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=Vp$RBSCOUNT,VpcTp=1"
   identity vc38
   moType VclTp
 exception none
  nrOfAttributes 1
  atmTrafficDescriptorId Ref ManagedElement=1,TransportNetwork=1,AtmTrafficDescriptor=U3P1000M80
)
CREATE
(
  parent "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=Vp$RBSCOUNT,VpcTp=1"
    identity vc39
    moType VclTp
    exception none
    nrOfAttributes 1
    atmTrafficDescriptorId Ref ManagedElement=1,TransportNetwork=1,AtmTrafficDescriptor=U3P1000M80
)
CREATE
(
  parent "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-2,VplTp=Vp$RBSCOUNT,VpcTp=1"
   identity vc40
    moType VclTp
    exception none
    nrOfAttributes 1
    atmTrafficDescriptorId Ref ManagedElement=1,TransportNetwork=1,AtmTrafficDescriptor=U3P1000M80
 )
CREATE
 (
    parent "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-2,VplTp=Vp$RBSCOUNT,VpcTp=1"
           identity vc43
      moType VclTp
     exception none
      nrOfAttributes 1
      atmTrafficDescriptorId Ref ManagedElement=1,TransportNetwork=1,AtmTrafficDescriptor=C2P4000
)
CREATE
(
  parent "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-2,VplTp=Vp$RBSCOUNT,VpcTp=1"
      identity vc44
      moType VclTp
      exception none
    nrOfAttributes 1
    atmTrafficDescriptorId Ref ManagedElement=1,TransportNetwork=1,AtmTrafficDescriptor=U3P1000M80
 )
CREATE
(
  parent "ManagedElement=1,TransportNetwork=1,AtmPort=1-1-2,VplTp=Vp$RBSCOUNT,VpcTp=1"
 identity vc45
 moType VclTp
 exception none
 nrOfAttributes 1
 atmTrafficDescriptorId Ref ManagedElement=1,TransportNetwork=1,AtmTrafficDescriptor=U3P1000M80
)

MOSCT

# Creating the AAl2 mo's below

cat >> $MOSCRIPT$MOFILEEXTENSION << MOSCT
CREATE
(
  parent "ManagedElement=1,TransportNetwork=1"
   identity 1
   moType Aal2QosProfile
   exception none
   nrOfAttributes 0
)

CREATE
(
  parent "ManagedElement=1,TransportNetwork=1"
   identity ba1
   moType Aal2PathVccTp
   exception none
   nrOfAttributes 1
   aal2QoSProfileId Ref ManagedElement=1,TransportNetwork=1,Aal2QosProfile=1
)
CREATE
(
  parent "ManagedElement=1,TransportNetwork=1"
   identity ba2
   moType Aal2PathVccTp
   exception none
   nrOfAttributes 1
   aal2QoSProfileId Ref ManagedElement=1,TransportNetwork=1,Aal2QosProfile=1
)
CREATE
(
  parent "ManagedElement=1,TransportNetwork=1"
   identity 1
   moType Aal2QosCodePointProfile
   exception none
   nrOfAttributes 0
)
CREATE
(
  parent "ManagedElement=1,TransportNetwork=1,Aal2Sp=1"
   identity 1
   moType Aal2Ap
   exception none
   nrOfAttributes 1
   aal2QoSCodePointProfileId Ref ManagedElement=1,TransportNetwork=1,Aal2QosCodePointProfile=1
)

CREATE
(
  parent "ManagedElement=1,TransportNetwork=1,Aal2Sp=1,Aal2Ap=1"
   identity 1
   moType Aal2PathDistributionUnit
   exception none
   nrOfAttributes 0
)

CREATE
(
  parent "ManagedElement=1,TransportNetwork=1"
   identity 1
   moType Aal2RoutingCase
   exception none
   nrOfAttributes 0
)

MOSCT

#Setting the MO's below:
#### Working on this now:

 COUNT2=1
  while [ "$COUNT2" -le 8 ]
       do

            case "$COUNT2"
 in
 1) ID=bx1; VCLID="ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=Vp$RBSCOUNT,VpcTp=1,VclTp=vc32";;
 2) ID=bca; VCLID="ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=Vp$RBSCOUNT,VpcTp=1,VclTp=vc36";;
 3) ID=bda; VCLID="ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=Vp$RBSCOUNT,VpcTp=1,VclTp=vc37";;
 4) ID=bqa; VCLID="ManagedElement=1,TransportNetwork=1,AtmPort=1-1-1,VplTp=Vp$RBSCOUNT,VpcTp=1,VclTp=vc38";;
 5) ID=bx2; VCLID="ManagedElement=1,TransportNetwork=1,AtmPort=1-1-2,VplTp=Vp$RBSCOUNT,VpcTp=1,VclTp=vc33";;
 5) ID=bcb; VCLID="ManagedElement=1,TransportNetwork=1,AtmPort=1-1-2,VplTp=Vp$RBSCOUNT,VpcTp=1,VclTp=vc43";;
 5) ID=bdb; VCLID="ManagedElement=1,TransportNetwork=1,AtmPort=1-1-2,VplTp=Vp$RBSCOUNT,VpcTp=1,VclTp=vc44";;
 5) ID=bqb; VCLID="ManagedElement=1,TransportNetwork=1,AtmPort=1-1-2,VplTp=Vp$RBSCOUNT,VpcTp=1,VclTp=vc45";;
  esac

 cat >> $MOSCRIPT$MOFILEEXTENSION << MOSCT

                                               
SET
(
  mo "ManagedElement=1,TransportNetwork=1,Aal5TpVccTp=$ID"
  identity $ID
  exception none
  nrOfAttributes 2
  processorId Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=ET-MFX,PlugInUnit=1"
  vclTpId Ref $VCLID
)
MOSCT
COUNT2=`expr $COUNT2 + 1`
done

#Setting the 6 UniSaal s here

# Creating the 6 UniSaalTp's here
         COUNT2=1
         while [ "$COUNT2" -le 6 ]
          do #Start of COUNT2 reinitilized
        
        case "$COUNT2"
         in
        1) ID=b1da; AALID="ManagedElement=1,TransportNetwork=1,Aal5TpVccTp=bda";;
        2) ID=b1ca; AALID="ManagedElement=1,TransportNetwork=1,Aal5TpVccTp=bca";;
        3) ID=b1db; AALID="ManagedElement=1,TransportNetwork=1,Aal5TpVccTp=bdb";;
        4) ID=b1cb; AALID="ManagedElement=1,TransportNetwork=1,Aal5TpVccTp=bcb";;
        5) ID=b1qa; AALID="ManagedElement=1,TransportNetwork=1,Aal5TpVccTp=bqa";;
        6) ID=b1qb; AALID="ManagedElement=1,TransportNetwork=1,Aal5TpVccTp=bqb";;
        esac
cat >> $MOSCRIPT$MOFILEEXTENSION << MOSCT
SET
(
  mo "ManagedElement=1,TransportNetwork=1,UniSaalTp=$ID"
 identity $ID
 exception none
   nrOfAttributes 1
   aal5TpVccTpId Ref $AALID
   uniSaalProfileId Ref ManagedElement=1,TransportNetwork=1,UniSaalProfile=1
 )

MOSCT

COUNT2=`expr $COUNT2 + 1`
done # End of COUNT2

cat >> $MOSCRIPT$MOFILEEXTENSION << MOSCT
SET
(
mo "ManagedElement=1,TransportNetwork=1,Aal2Sp=1,Aal2Ap=1,Aal2PathDistributionUnit=1"
 identity 1
 exception none
 nrOfAttributes 1
 "aal2PathVccTpList" Array Ref 2
 "ManagedElement=1,TransportNetwork=1,Aal2PathVccTp=ba1"
 "ManagedElement=1,TransportNetwork=1,Aal2PathVccTp=ba2"

)
MOSCT

# Setting references to NbapCommon and NBapDedicatred to the UniSaalTp 

cat >> $MOSCRIPT$MOFILEEXTENSION << MOSCT
 SET
 (
 mo "ManagedElement=1,NodeBFunction=1,Iub=1,NbapCommon=1"
 identity 1
 exception none
 nrOfAttributes 2
 uniSaalTpRef2 Ref "ManagedElement=1,TransportNetwork=1,UniSaalTp=b1cb"
 uniSaalTpRef1 Ref "ManagedElement=1,TransportNetwork=1,UniSaalTp=b1ca"
 )
 SET
 (
 mo "ManagedElement=1,NodeBFunction=1,Iub=1,NbapDedicated=1"
 identity 1
 exception none
 nrOfAttributes 2
 uniSaalTpRef2 Ref "ManagedElement=1,TransportNetwork=1,UniSaalTp=b1db"
 uniSaalTpRef1 Ref "ManagedElement=1,TransportNetwork=1,UniSaalTp=b1da"
)

MOSCT

#Setting the UniSaalProfile, Aal2QosProfile, Aal2QosCodePoint Profile, AtmTrafficDescriptor1, AtmTrafficDescriptor2 and AtmTrafficDescriptor3

cat  >> $MOSCRIPT$MOFILEEXTENSION << MOSCT
MOSCT

  echo ""
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
