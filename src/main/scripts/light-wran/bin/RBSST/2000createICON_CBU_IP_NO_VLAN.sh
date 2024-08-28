#!/bin/sh

# Created by  : Fatih ONUR
# Created in  : 18.07.2012
##
### VERSION HISTORY
# Ver1        : Created for WRAN TERE 13A
# Purpose     : ICON configuration
# Description : Assume that simulation is no transport and some dependent MOs are already created during radio n/w setup
#                 Script is tested against no transport simulation (after 1's series script run against nodes)
#		  In the case of error please check 1's series script run properly
# Date        : 19 JUL 2012
# Who         : Fatih ONUR

###########################################
# Ver3        : Created for WRAN TERE 13B
# Purpose     : ICON configuration
# Description : Assume that simulation is no transport and some dependent MOs are already created during radio n/w setup
#               Updated IpHostLink mo interfacename to be the same as the IpOam mo NodeInterfaceName
#                 In the case of error please check 1's series script run properly
# Date        : 25 Feb 2013
# Who         : Rob Guinan

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
   

    echo "**** $RNCNAME$RBSNAME$COUNT ****"
    # read ICON config data from the ICONCONFIGFILE
    #
    LINE=`grep "$RNCNAME$RBSNAME$COUNT", ${PWD}/$FILE`

    # ICON related MOs Attributes: Dynamic
    #
    echo "---Dynamic:--- ICON related MOs Attributes---"

    IP_nodeIpAddress=`echo $LINE | awk -F "," '{print $2}' | awk -F"=" '{print $2}'`    
    echo "IP_nodeIpAddress="$IP_nodeIpAddress

    IPHOSTLINK_ipAddress=`echo $LINE | awk -F "," '{print $3}' | awk -F "&" '{print $1}' | awk -F"=" '{print $2}'`
    echo "IPHOSTLINK_ipAddress="$IPHOSTLINK_ipAddress
    IPHOSTLINK_ipv4Addresses[0]=`echo $LINE | awk -F "," '{print $3}' | awk -F "&" '{print $2}' | awk -F"=" '{print $2}'`
    echo "IPHOSTLINK_ipv4Addresses[0]="${IPHOSTLINK_ipv4Addresses[0]}

    IPINTERFACE01_defaultRouter0=`echo $LINE | awk -F "," '{print $4}' | awk -F "&" '{print $1}' | awk -F"=" '{print $2}'`
    echo "IPINTERFACE01_defaultRouter0=$IPINTERFACE01_defaultRouter0"
    IPINTERFACE01_subnet=`echo $LINE | awk -F "," '{print $4}' | awk -F "&" '{print $2}' | awk -F"=" '{print $2}'`
    echo "IPINTERFACE01_subnet="$IPINTERFACE01_subnet

    #IPINTERFACE02_defaultRouter0=`echo $LINE | awk -F "," '{print $5}' | awk -F "&" '{print $1}' | awk -F"=" '{print $2}'`
    #echo "IPINTERFACE02_defaultRouter0="$IPINTERFACE02_defaultRouter0
    #IPINTERFACE02_subnet=`echo $LINE | awk -F "," '{print $5}' | awk -F "&" '{print $2}' | awk -F"=" '{print $2}'`
    #echo "IPINTERFACE02_subnet="$IPINTERFACE02_subnet

    IPACCESSHOSTET_ipAddress=`echo $LINE | awk -F "," '{print $6}' | awk -F "&" '{print $1}' | awk -F"=" '{print $2}'`
    echo "IPACCESSHOSTET_ipAddress="$IPACCESSHOSTET_ipAddress

    # ICON related MOs Attributes: Manual
    #
    echo "---Manual:--- ICON related MOs Attributes---"
    IPINTERFACE01_networkPrefixLength=29
    IPINTERFACE01_vLan="false"
    IPINTERFACE01_vid=0

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
      identity $COUNT
        exception none
        nrOfAttributes 0
      )
MOSCT
    let COUNTX=$COUNTX+1
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
    CREATE
    (
      parent "ManagedElement=1,SwManagement=1"
       identity 1
       moType PiuType
       exception none 
       nrOfAttributes 0
    )
MOSCT

  COUNTX=1
  while [ "$COUNTX" -le 2 ]
  do

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

    if [ "$SLOTID" == "CBU" ]
    then

    ################################### CREATE
    ###################################### MO
 
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
     do
       
        echo "CREATE ">> $MOSCRIPT$MOFILEEXTENSION 
        echo "(" >> $MOSCRIPT$MOFILEEXTENSION
        echo "   parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=ET-MFX,PlugInUnit=1,ExchangeTerminalIp=1,EthernetSwitch=1"" >> $MOSCRIPT$MOFILEEXTENSION
        echo "    identity $VAR" >> $MOSCRIPT$MOFILEEXTENSION
        echo "    moType EthernetSwitchPort" >> $MOSCRIPT$MOFILEEXTENSION
        echo "    exception none " >> $MOSCRIPT$MOFILEEXTENSION
        echo "    nrOfAttributes 0 " >> $MOSCRIPT$MOFILEEXTENSION
        echo ") " >> $MOSCRIPT$MOFILEEXTENSION
 
       VAR=`expr $VAR + 1`
     done

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

  COUNTX=1
  while [ "$COUNTX" -le 2 ]
  do
    cat >> $MOSCRIPT$MOFILEEXTENSION << MOSCT

      CREATE
      (
        parent "ManagedElement=1,IpSystem=1,IpAccessHostEt=1"
         identity $COUNTX
         moType IpSyncRef
         exception none
         nrOfAttributes 0
      )
MOSCT

    COUNTX=`expr $COUNTX + 1`
  done


  COUNTY=1
  while [ "$COUNTY" -le 2 ]
  do

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
	   sctpRef Ref "ManagedElement=1,TransportNetwork=1,Sctp=1"

      )
MOSCT

    COUNTY=`expr $COUNTY + 1`
  done

  cat >> $MOSCRIPT$MOFILEEXTENSION << MOSCT

    CREATE
    (
      parent "ManagedElement=1,TransportNetwork=1"
       identity 1
       moType Synchronization
       exception none
       nrOfAttributes 0
         syncRefPriority Array Integer 8
           1
           2
           0
           0
           0
           0
           0
           0
         syncReference Array Ref 8
          "ManagedElement=1,IpSystem=1,IpAccessHostEt=1,IpSyncRef=1"
          "ManagedElement=1,IpSystem=1,IpAccessHostEt=1,IpSyncRef=2"
          "null"
          "null"
          "null"
          "null"
          "null"
          "null"	
    )

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

    CREATE
    (
      parent "ManagedElement=1,IpOam=1,Ip=1"
       identity "1"
       moType IpHostLink
       exception none
       nrOfAttributes 6
         interfaceName String "le0"
         ipInterfaceMoRef Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=ET-MFX,PlugInUnit=1,ExchangeTerminalIp=1,InternalEthernetPort=1,IpInterface=1" 
    )
MOSCT

   ############################ SET 
   ################################# MO

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
       mo "ManagedElement=1,IpOam=1,Ip=1,IpHostLink=1"
        identity 1
        exception none
        nrOfAttributes 1
          userLabel String ICON
          ipAddress String "$IPHOSTLINK_ipAddress"
          ipv4Addresses Array String 1
            "${IPHOSTLINK_ipv4Addresses[0]}"
          ipInterfaceMoRef Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=ET-MFX,PlugInUnit=1,ExchangeTerminalIp=1,InternalEthernetPort=1,IpInterface=1"
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

