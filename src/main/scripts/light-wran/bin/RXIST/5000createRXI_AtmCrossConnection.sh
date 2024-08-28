#!/bin/sh

#VERSION HISTORY
# Verr2        : Created for WRAN TERE 13B
# Purpose     : ATM Configuration
# Description : Assume that simulation is no transport and 1's series script run against sim
#                 Script is tested against no transport simulation.
#                 Added in all Vcltp to be fererences by ATM Cross connection. All Aal5 and Aal2
#		 references are deleted
# Date        : 25 FEB 2013
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


echo "//...$0:$SIMNAME rxi script started running at "`date`
echo "//"

. ../../dat/$ENV
. ../utilityFunctions.sh


PWD=`pwd`
NOW=`date +"%Y_%m_%d_%T:%N"`

MOSCRIPT=$0${NOW}:$SIMNAME".mo"
MMLSCRIPT=$0${NOW}:$SIMNAME".mml"


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


RXIVERSION=`getMimType $RNCCOUNT $RXIVERSIONARRAY`
NUMOFRXI=`getItemFromArray $RNCCOUNT $NUMOFRXIARRAY`
NUMOFRBS=`getNumOfRBS $RNCCOUNT $RNCRBSARRAY $RBSCELLARRAY`

#########################################
#
# Make MO Script
#
#########################################

#echo ""
#echo "MAKING MO SCRIPT"
#echo ""

echo "//.....$0:$SIMNAME MAKING MO SCRIPT RXI started running at "`date`
echo "//"


echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,SwManagement=1"' >> $MOSCRIPT
echo '   identity ans_aal2ap_12_1' >> $MOSCRIPT
echo '   moType ReliableProgramUniter' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,SwManagement=1"' >> $MOSCRIPT
echo '   identity ans_aal2cpsrc_12_1' >> $MOSCRIPT
echo '   moType ReliableProgramUniter' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT


echo 'SET' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  mo "ManagedElement=1"' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 3' >> $MOSCRIPT
echo '   faultTolerantCoreStates Array String 1'  >> $MOSCRIPT
echo '   "ManagedElement=1,Equipment=1,Subrack=MS,Slot=1,PlugInUnit=1;ftcState=Active"' >> $MOSCRIPT
echo '   mimName String '$RXIVERSION >> $MOSCRIPT
echo ')' >> $MOSCRIPT

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


echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,SystemFunctions=1"' >> $MOSCRIPT
echo ' identity 1' >> $MOSCRIPT
echo ' moType Security' >> $MOSCRIPT
echo ' exception none' >> $MOSCRIPT
echo ' nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

COUNT=1
while [ "$COUNT" -le 5 ]
do

  echo 'CREATE' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo '  parent "ManagedElement=1,TransportNetwork=1"' >> $MOSCRIPT
  echo '   identity '$COUNT >> $MOSCRIPT
  echo '   moType ImaGroup' >> $MOSCRIPT
  echo '   exception none' >> $MOSCRIPT
  echo ')' >> $MOSCRIPT

  echo 'CREATE' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo '  parent "ManagedElement=1,TransportNetwork=1,ImaGroup='$COUNT'"' >> $MOSCRIPT
  echo '   identity '$COUNT >> $MOSCRIPT
  echo '   moType ImaLink' >> $MOSCRIPT
  echo '   exception none' >> $MOSCRIPT
  echo ')' >> $MOSCRIPT

  echo 'CREATE' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo ' parent "ManagedElement=1,IpOam=1"' >> $MOSCRIPT
  echo ' identity 1' >> $MOSCRIPT
  echo ' moType Ip' >> $MOSCRIPT
  echo ' exception none' >> $MOSCRIPT
  echo ')' >> $MOSCRIPT

  echo 'CREATE' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo ' parent "ManagedElement=1,IpOam=1,Ip=1"' >> $MOSCRIPT
  echo ' identity '$COUNT >> $MOSCRIPT
  echo ' moType IpAtmLink' >> $MOSCRIPT
  echo ' exception none' >> $MOSCRIPT
  echo ')' >> $MOSCRIPT


  COUNT=`expr $COUNT + 1`
done

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,Equipment=1"' >> $MOSCRIPT
echo '   identity MS' >> $MOSCRIPT
echo '   moType Subrack' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo ')' >> $MOSCRIPT


COUNT=1
while [ "$COUNT" -le 4 ]
do

  echo 'CREATE' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo '  parent "ManagedElement=1,Equipment=1"' >> $MOSCRIPT
  echo '   identity '$COUNT >> $MOSCRIPT
  echo '   moType Subrack' >> $MOSCRIPT
  echo '   exception none' >> $MOSCRIPT
  echo ')' >> $MOSCRIPT

  COUNT2=1
  while [ "$COUNT2" -le 28 ]
  do

    echo 'CREATE' >> $MOSCRIPT
    echo '(' >> $MOSCRIPT
    echo '  parent "ManagedElement=1,Equipment=1,Subrack='$COUNT'"' >> $MOSCRIPT
    echo '   identity '$COUNT2 >> $MOSCRIPT
    echo '   moType Slot' >> $MOSCRIPT
    echo '   exception none' >> $MOSCRIPT
    echo ')' >> $MOSCRIPT

    echo 'CREATE' >> $MOSCRIPT
    echo '(' >> $MOSCRIPT
    echo '  parent "ManagedElement=1,Equipment=1,Subrack='$COUNT',Slot='$COUNT2'"' >> $MOSCRIPT
    echo '   identity 1' >> $MOSCRIPT
    echo '   moType PlugInUnit' >> $MOSCRIPT
    echo '   exception none' >> $MOSCRIPT
    echo ')' >> $MOSCRIPT

    COUNT2=`expr $COUNT2 + 1`
  done

  COUNT=`expr $COUNT + 1`
done

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=4,PlugInUnit=1' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   moType TimingUnit' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=4,PlugInUnit=1,TimingUnit=1' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   moType TuSyncRef' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT


#NUMOFRBS=`getNumOfRBS $RNCCOUNT $RNCRBSARRAY $RBSCELLARRAY`
RBSCOUNT=1
VAR=1

while [ "$RBSCOUNT" -lt "$NUMOFRBS" ]
do

  echo 'CREATE' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo '  parent "ManagedElement=1,TransportNetwork=1"' >> $MOSCRIPT
  echo '   identity MS-24-'$VAR >> $MOSCRIPT
  echo '   moType AtmPort' >> $MOSCRIPT
  echo '   exception none' >> $MOSCRIPT
  echo '   nrOfAttributes 1' >> $MOSCRIPT
  echo '   userLabel String "AtmPort for RNC"' >> $MOSCRIPT
  echo ')' >> $MOSCRIPT

  REM=`expr $RBSCOUNT % 126`
  if [ "$REM" -eq 0 ]
  then
    VAR=`expr $VAR + 1`
  fi

  RBSCOUNT=`expr $RBSCOUNT + 1`
done


RBSCOUNT=1
X=25
Y=1

while [ "$RBSCOUNT" -le "$NUMOFRBS" ]
do

  if [ "$Y" -eq 9 ]
  then
    Y=1
    X=`expr $X + 1`
  fi

  echo 'CREATE' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo '  parent "ManagedElement=1,TransportNetwork=1"' >> $MOSCRIPT
  echo '   identity MS-'$X'-'$Y >> $MOSCRIPT
  echo '   moType AtmPort' >> $MOSCRIPT
  echo '   exception none' >> $MOSCRIPT
  echo '   nrOfAttributes 1' >> $MOSCRIPT
  echo '   userLabel String "AtmPort for RBS '$RBSCOUNT'"' >> $MOSCRIPT
  echo ')' >> $MOSCRIPT

  Y=`expr $Y + 1`
  RBSCOUNT=`expr $RBSCOUNT + 1`
done


COUNT1=1
COUNT2=24
COUNT3=1

while [ "$COUNT1" -le 32 ]
do

  echo 'CREATE' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo '  parent "ManagedElement=1,TransportNetwork=1"' >> $MOSCRIPT
  echo ' identity MS-'$COUNT2'-'$COUNT3 >> $MOSCRIPT
  echo ' moType AtmPort' >> $MOSCRIPT
  echo ' exception none' >> $MOSCRIPT
  echo ' nrOfAttributes 0' >> $MOSCRIPT
  echo ')' >> $MOSCRIPT

  COUNT3=`expr $COUNT3 + 1`

  REM=`expr $COUNT1 % 8`
  if [ "$REM" -eq 0 ]
  then
    COUNT2=`expr $COUNT2 + 1`
    COUNT3=1
  fi

  COUNT1=`expr $COUNT1 + 1`
done

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,TransportNetwork=1"' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   moType Aal2Sp' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,TransportNetwork=1"' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   moType MspgExtended' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

COUNT=1
while [ "$COUNT" -le 28 ] # This was 14
do

  echo 'CREATE' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo '  parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot='$COUNT'"' >> $MOSCRIPT
  echo '   identity 1' >> $MOSCRIPT
  echo '   moType PlugInUnit' >> $MOSCRIPT
  echo '   exception none' >> $MOSCRIPT
  echo ')' >> $MOSCRIPT

    if [ "$COUNT" -ne 4 ]
    then
       echo 'CREATE' >> $MOSCRIPT
       echo '(' >> $MOSCRIPT
       echo '  parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot='$COUNT',PlugInUnit=1"' >> $MOSCRIPT
       echo '   identity 1' >> $MOSCRIPT
       echo '   moType ExchangeTerminal' >> $MOSCRIPT
       echo '   exception none' >> $MOSCRIPT
       echo ')' >> $MOSCRIPT
    fi


   COUNT2=1
   while [ "$COUNT2" -le 8 ]
   do

   if [ "$COUNT" -ne 4 ]
   then

   echo 'CREATE' >> $MOSCRIPT
   echo '(' >> $MOSCRIPT
   echo '  parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot='$COUNT',PlugInUnit=1,ExchangeTerminal=1"' >> $MOSCRIPT
   echo '   identity '$COUNT2 >> $MOSCRIPT
   echo '   moType E1PhysPathTerm' >> $MOSCRIPT
   echo '   exception none' >> $MOSCRIPT
   echo ')' >> $MOSCRIPT

   fi

   COUNT2=`expr $COUNT2 + 1`
   done


 COUNT=`expr $COUNT + 1`
done
##########################################
#
# AtmPort for RNC
#
##########################################

#NUMOFRBS=`getNumOfRBS $RNCCOUNT $RNCRBSARRAY $RBSCELLARRAY`

RBSCOUNT=1
TEMP=1

while [ "$RBSCOUNT" -le "$NUMOFRBS" ]
do

  echo 'CREATE' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo '  parent "ManagedElement=1,TransportNetwork=1,AtmPort=MS-24-'$TEMP'"' >> $MOSCRIPT
  echo '   identity Vp'$RBSCOUNT >> $MOSCRIPT
  echo '   moType VplTp' >> $MOSCRIPT
  echo '   exception none' >> $MOSCRIPT
  echo '   nrOfAttributes 0' >> $MOSCRIPT
  echo ')' >> $MOSCRIPT


  echo 'CREATE' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo '  parent "ManagedElement=1,TransportNetwork=1,AtmPort=MS-24-'$TEMP',VplTp=Vp'$RBSCOUNT'"' >> $MOSCRIPT
  echo '   identity 1' >> $MOSCRIPT
  echo '   moType VpcTp' >> $MOSCRIPT
  echo '   exception none' >> $MOSCRIPT
  echo '   nrOfAttributes 0' >> $MOSCRIPT
  echo ')' >> $MOSCRIPT

#COUNT1=1
#while [ "$COUNT1" -le "$NUMOFRBS" ]
#do

  COUNT2=1
  while [ "$COUNT2" -le 14 ]
  do

    case "$COUNT2"
    in
      1) VCLTPID=vc31-RNC-RBS$RBSCOUNT;;
      2) VCLTPID=vc32-RNC-RBS$RBSCOUNT;;
      3) VCLTPID=vc33-RNC-RBS$RBSCOUNT;;
      4) VCLTPID=vc34-RNC-RBS$RBSCOUNT;;
      5) VCLTPID=vc35-RNC-RBS$RBSCOUNT;;
      6) VCLTPID=vc36-RNC-RBS$RBSCOUNT;;
      7) VCLTPID=vc37-RNC-RBS$RBSCOUNT;;
      8) VCLTPID=vc38-RNC-RBS$RBSCOUNT;;
      9) VCLTPID=vc39-RNC-RBS$RBSCOUNT;;
      10) VCLTPID=vc42-RNC-RBS$RBSCOUNT;;
      11) VCLTPID=vc43-RNC-RBS$RBSCOUNT;;
      12) VCLTPID=vc44-RNC-RBS$RBSCOUNT;;
      13) VCLTPID=vc45-RNC-RBS$RBSCOUNT;;
      14) VCLTPID=vc40-RNC-RBS$RBSCOUNT;;

    esac

    echo 'CREATE' >> $MOSCRIPT
    echo '(' >> $MOSCRIPT
    echo '  parent "ManagedElement=1,TransportNetwork=1,AtmPort=MS-24-'$TEMP',VplTp=Vp'$RBSCOUNT',VpcTp=1"' >> $MOSCRIPT
    echo '   identity '$VCLTPID >> $MOSCRIPT
    echo '   moType VclTp' >> $MOSCRIPT
    echo '   exception none' >> $MOSCRIPT
    echo '   nrOfAttributes 0' >> $MOSCRIPT
    echo ')' >> $MOSCRIPT


    COUNT2=`expr $COUNT2 + 1`
  done


  REM=`expr $RBSCOUNT % 126`
  if [ "$REM" -eq 0 ]
  then
    TEMP=`expr $TEMP + 1`
  fi

  RBSCOUNT=`expr $RBSCOUNT + 1`
done


##########################################
#
# AtmPort for RBSs
#
##########################################


RBSCOUNT=1
X=25
Y=1

while [ "$RBSCOUNT" -le "$NUMOFRBS" ]
do

  if [ "$Y" -eq 9 ]
  then
    Y=1
    X=`expr $X + 1`
  fi


  echo 'CREATE' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo '  parent "ManagedElement=1,TransportNetwork=1,AtmPort=MS-'$X'-'$Y'"' >> $MOSCRIPT
  echo '   identity Vp'$RBSCOUNT >> $MOSCRIPT
  echo '   moType VplTp' >> $MOSCRIPT
  echo '   exception none' >> $MOSCRIPT
  echo '   nrOfAttributes 0' >> $MOSCRIPT
  echo ')' >> $MOSCRIPT

  echo 'CREATE' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo '  parent "ManagedElement=1,TransportNetwork=1,AtmPort=MS-'$X'-'$Y',VplTp=Vp'$RBSCOUNT'"' >> $MOSCRIPT
  echo '   identity 1' >> $MOSCRIPT
  echo '   moType VpcTp' >> $MOSCRIPT
  echo '   exception none' >> $MOSCRIPT
  echo '   nrOfAttributes 0' >> $MOSCRIPT
  echo ')' >> $MOSCRIPT

  COUNT2=1
  while [ "$COUNT2" -le 14 ]
  do

    case "$COUNT2"
    in
      1) VCLTPID=vc31-RBS$RBSCOUNT;;
      2) VCLTPID=vc32-RBS$RBSCOUNT;;
      3) VCLTPID=vc33-RBS$RBSCOUNT;;
      4) VCLTPID=vc34-RBS$RBSCOUNT;;
      5) VCLTPID=vc35-RBS$RBSCOUNT;;
      6) VCLTPID=vc36-RBS$RBSCOUNT;;
      7) VCLTPID=vc37-RBS$RBSCOUNT;;
      8) VCLTPID=vc38-RBS$RBSCOUNT;;
      9) VCLTPID=vc39-RBS$RBSCOUNT;;
      10) VCLTPID=vc40-RBS$RBSCOUNT;;
      11) VCLTPID=vc41-RBS$RBSCOUNT;;
      12) VCLTPID=vc42-RBS$RBSCOUNT;;
      13) VCLTPID=vc43-RBS$RBSCOUNT;;
      14) VCLTPID=vc44-RBS$RBSCOUNT;;
      14) VCLTPID=vc45-RBS$RBSCOUNT;;

    esac

    echo 'CREATE' >> $MOSCRIPT
    echo '(' >> $MOSCRIPT
    echo '  parent "ManagedElement=1,TransportNetwork=1,AtmPort=MS-'$X'-'$Y',VplTp=Vp'$RBSCOUNT',VpcTp=1"' >> $MOSCRIPT
    echo '   identity '$VCLTPID >> $MOSCRIPT
    echo '   moType VclTp' >> $MOSCRIPT
    echo '   exception none' >> $MOSCRIPT
    echo '   nrOfAttributes 0' >> $MOSCRIPT
    echo ')' >> $MOSCRIPT


    COUNT2=`expr $COUNT2 + 1`
  done



  Y=`expr $Y + 1`

  RBSCOUNT=`expr $RBSCOUNT + 1`
done


COUNT=1
while [ "$COUNT" -le 4 ]
do

  case "$COUNT"
  in
    1) ID=C1P4528;;
    2) ID=C1P5;;
    3) ID=C2P4000;;
    4) ID=U3P1000M80;;
  esac

  echo 'CREATE' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo '  parent "ManagedElement=1,TransportNetwork=1"' >> $MOSCRIPT
  echo '   identity '$ID >> $MOSCRIPT
  echo '   moType AtmTrafficDescriptor' >> $MOSCRIPT
  echo '   exception none' >> $MOSCRIPT
  echo '   nrOfAttributes 0' >> $MOSCRIPT
  echo ')' >> $MOSCRIPT

  COUNT=`expr $COUNT + 1`
done

#NUMOFRBS=`getNumOfRBS $RNCCOUNT $RNCRBSARRAY $RBSCELLARRAY`
COUNT=1
while [ "$COUNT" -le "$NUMOFRBS" ]
do

  COUNT2=1
  while [ "$COUNT2" -le 10 ]
  do

    ID=RBS-"$COUNT"-"$COUNT2"

    echo 'CREATE' >> $MOSCRIPT
    echo '(' >> $MOSCRIPT
    echo '  parent "ManagedElement=1,TransportNetwork=1"' >> $MOSCRIPT
    echo '   identity '$ID >> $MOSCRIPT
    echo '   moType AtmCrossConnection' >> $MOSCRIPT
    echo '   exception none' >> $MOSCRIPT
    echo '   nrOfAttributes 0' >> $MOSCRIPT
    echo ')' >> $MOSCRIPT

    COUNT2=`expr $COUNT2 + 1`
  done

  COUNT=`expr $COUNT + 1`
done
#########################################
#
# RNC Side
#
#########################################


COUNT=1
while [ "$COUNT" -le 2 ]
do

  case "$COUNT"
  in
    1) ID=b'RNC'qa;;
    2) ID=b'RNC'qb;;
  esac

  echo 'CREATE' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo '  parent "ManagedElement=1,TransportNetwork=1"' >> $MOSCRIPT
  echo '   identity '$ID >> $MOSCRIPT
  echo '   moType Aal5TpVccTp' >> $MOSCRIPT
  echo '   exception none' >> $MOSCRIPT
  echo '   nrOfAttributes 0' >> $MOSCRIPT
  echo ')' >> $MOSCRIPT

  COUNT=`expr $COUNT + 1`
done



################################################
#
# RBS Side
#
################################################

#NUMOFRBS=`getNumOfRBS $RNCCOUNT $RNCRBSARRAY $RBSCELLARRAY`

COUNT=1
while [ "$COUNT" -le "$NUMOFRBS" ]
do

  COUNT2=1
  while [ "$COUNT2" -le 2 ]
  do

    case "$COUNT2"
    in
      1) ID=b"$COUNT"qa;;
      2) ID=b"$COUNT"qb;;
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

  COUNT=`expr $COUNT + 1`
done


COUNT=1
while [ "$COUNT" -le 3 ]
do

  echo 'CREATE' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo '  parent "ManagedElement=1,TransportNetwork=1"' >> $MOSCRIPT
  echo '   identity '$COUNT >> $MOSCRIPT
  echo '   moType UniSaalProfile' >> $MOSCRIPT
  echo '   exception none' >> $MOSCRIPT
  echo '   nrOfAttributes 0' >> $MOSCRIPT
  echo ')' >> $MOSCRIPT

  COUNT=`expr $COUNT + 1`
done


#########################################
#
# RNC Side
#
#########################################

VAR=1
while [ "$VAR" -le 2 ]
do

  case "$VAR"
  in
    1) ID=bRNCqa ;;
    2) ID=bRNCqb ;;
  esac

  echo 'CREATE' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo '  parent "ManagedElement=1,TransportNetwork=1"' >> $MOSCRIPT
  echo '   identity '$ID >> $MOSCRIPT
  echo '   moType UniSaalTp' >> $MOSCRIPT
  echo '   exception none' >> $MOSCRIPT
  echo '   nrOfAttributes 0' >> $MOSCRIPT
  echo ')' >> $MOSCRIPT

  VAR=`expr $VAR + 1`
done


#########################################
#
# RBS Side
#
#########################################

COUNT=1
while [ "$COUNT" -le "$NUMOFRBS" ]
do

  COUNT2=1
  while [ "$COUNT2" -le 2 ]
  do

    case "$COUNT2"
    in
      1) ID=bRBS"$COUNT"qa;;
      2) ID=bRBS"$COUNT"qb;;
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

  COUNT=`expr $COUNT + 1`
done


echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,TransportNetwork=1"' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   moType Aal2Sp' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT




#####################################
#
# RNC Side
#
#####################################

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,TransportNetwork=1"' >> $MOSCRIPT
echo '   identity bRNCa1' >> $MOSCRIPT
echo '   moType Aal2PathVccTp' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,TransportNetwork=1,Aal2Sp=1"' >> $MOSCRIPT
echo '   identity RNC1' >> $MOSCRIPT
echo '   moType Aal2Ap' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,TransportNetwork=1,Aal2Sp=1,Aal2Ap=RNC1"' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   moType Aal2PathDistributionUnit' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT


#############################################
#
# RBS Side
#
#############################################

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

COUNT=1
while [ "$COUNT" -le "$NUMOFRBS" ]
do

  echo 'CREATE' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo '  parent "ManagedElement=1,TransportNetwork=1"' >> $MOSCRIPT
  echo '   identity RBS'$COUNT >> $MOSCRIPT
  echo '   moType Aal2RoutingCase' >> $MOSCRIPT
  echo '   exception none' >> $MOSCRIPT
  echo '   nrOfAttributes 0' >> $MOSCRIPT
  echo ')' >> $MOSCRIPT

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
  echo '  parent "ManagedElement=1,TransportNetwork=1,Aal2Sp=1"' >> $MOSCRIPT
  echo '   identity RBS'$COUNT >> $MOSCRIPT
  echo '   moType Aal2Ap' >> $MOSCRIPT
  echo '   exception none' >> $MOSCRIPT
  echo '   nrOfAttributes 0' >> $MOSCRIPT
  echo ')' >> $MOSCRIPT

  echo 'CREATE' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo '  parent "ManagedElement=1,TransportNetwork=1,Aal2Sp=1,Aal2Ap=RBS'$COUNT'"' >> $MOSCRIPT
  echo '   identity 1' >> $MOSCRIPT
  echo '   moType Aal2PathDistributionUnit' >> $MOSCRIPT
  echo '   exception none' >> $MOSCRIPT
  echo '   nrOfAttributes 0' >> $MOSCRIPT
  echo ')' >> $MOSCRIPT

  COUNT=`expr $COUNT + 1`
done


COUNT=1
while [ "$COUNT" -le 28 ]
do

  echo 'CREATE' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo '  parent "ManagedElement=1,Equipment=1,Subrack=4,Slot='$COUNT',PlugInUnit=1"' >> $MOSCRIPT
  echo '   identity ET-M4' >> $MOSCRIPT
  echo '   moType ExchangeTerminal' >> $MOSCRIPT
  echo '   exception none' >> $MOSCRIPT
  echo '   nrOfAttributes 0' >> $MOSCRIPT
  echo ')' >> $MOSCRIPT

  echo 'CREATE' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo '  parent "ManagedElement=1,Equipment=1,Subrack=4,Slot='$COUNT',PlugInUnit=1,ExchangeTerminal=ET-M4"' >> $MOSCRIPT
  echo '   identity 1' >> $MOSCRIPT
  echo '   moType Os155SpiTtp' >> $MOSCRIPT
  echo '   exception none' >> $MOSCRIPT
  echo '   nrOfAttributes 0' >> $MOSCRIPT
  echo ')' >> $MOSCRIPT

  echo 'CREATE' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo '  parent "ManagedElement=1,Equipment=1,Subrack=4,Slot='$COUNT',PlugInUnit=1,ExchangeTerminal=ET-M4,Os155SpiTtp=1"' >> $MOSCRIPT
  echo '   identity 1' >> $MOSCRIPT
  echo '   moType Sts3CspeTtp' >> $MOSCRIPT
  echo '   exception none' >> $MOSCRIPT
  echo '   nrOfAttributes 0' >> $MOSCRIPT
  echo ')' >> $MOSCRIPT


  COUNT=`expr $COUNT + 1`
done


echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot=4,PlugInUnit=1"' >> $MOSCRIPT
echo '   identity ET-MC41' >> $MOSCRIPT
echo '   moType ExchangeTerminal' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT



echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot=4,PlugInUnit=1,ExchangeTerminal=ET-MC41"' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   moType Os155SpiTtp' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

echo 'CREATE' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot=4,PlugInUnit=1,ExchangeTerminal=ET-MC41,Os155SpiTtp=1"' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   moType Vc4Ttp' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 0' >> $MOSCRIPT
echo ')' >> $MOSCRIPT


VCCOUNT=1
while [ "$VCCOUNT" -le 63 ]
do

  echo 'CREATE' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo '  parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot=4,PlugInUnit=1,ExchangeTerminal=ET-MC41,Os155SpiTtp=1,Vc4Ttp=1"' >> $MOSCRIPT
  echo '   identity '$VCCOUNT >> $MOSCRIPT
  echo '   moType Vc12Ttp' >> $MOSCRIPT
  echo '   exception none' >> $MOSCRIPT
  echo '   nrOfAttributes 0' >> $MOSCRIPT
  echo ')' >> $MOSCRIPT

  echo 'CREATE' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo '  parent "ManagedElement=1,Equipment=1,Subrack=MS,Slot=4,PlugInUnit=1,ExchangeTerminal=ET-MC41,Os155SpiTtp=1,Vc4Ttp=1,Vc12Ttp='$VCCOUNT'"' >> $MOSCRIPT
  echo '   identity 1' >> $MOSCRIPT
  echo '   moType E1Ttp' >> $MOSCRIPT
  echo '   exception none' >> $MOSCRIPT
  echo '   nrOfAttributes 0' >> $MOSCRIPT
  echo ')' >> $MOSCRIPT


  VCCOUNT=`expr $VCCOUNT + 1`
done

RBSCOUNT=1
VAR=1

while [ "$RBSCOUNT" -lt "$NUMOFRBS" ]
do


  echo 'SET' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo ' mo "ManagedElement=1,TransportNetwork=1,AtmPort=MS-24-'$VAR'"' >> $MOSCRIPT
  echo ' identity MS-24-1' >> $MOSCRIPT
  echo ' exception none' >> $MOSCRIPT
  echo ' nrOfAttributes 1' >> $MOSCRIPT
  echo ' uses Ref "ManagedElement=1,Equipment=1,Subrack=4,Slot='$VAR',PlugInUnit=1,ExchangeTerminal=ET-M4,Os155SpiTtp=1,Sts3CspeTtp=1"' >> $MOSCRIPT
  echo ')' >> $MOSCRIPT

  REM=`expr $RBSCOUNT % 126`
  if [ "$REM" -eq 0 ]
  then
    VAR=`expr $VAR + 1`
  fi

  RBSCOUNT=`expr $RBSCOUNT + 1`
done


RBSCOUNT=1
X=25
Y=1

while [ "$RBSCOUNT" -le "$NUMOFRBS" ]
do

  if [ "$Y" -eq 9 ]
  then
    Y=1
    X=`expr $X + 1`
  fi


  echo 'SET' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo '  mo "ManagedElement=1,TransportNetwork=1,AtmPort=MS-'$X'-'$Y',VplTp=Vp'$RBSCOUNT'"' >> $MOSCRIPT
  echo '   identity Vp'$RBSCOUNT >> $MOSCRIPT
  echo '   exception none' >> $MOSCRIPT
  echo '   nrOfAttributes 2' >> $MOSCRIPT
  echo '   atmTrafficDescriptor Ref "ManagedElement=1,TransportNetwork=1,AtmTrafficDescriptor=C1P4528"' >> $MOSCRIPT
  echo '   externalVpi Integer '$RBSCOUNT >> $MOSCRIPT
  echo ')' >> $MOSCRIPT

  COUNT2=1
  while [ "$COUNT2" -le 10 ]
  do

    case "$COUNT2"
    in
      1) VCI=32; VCLTPID='32-RBS'$RBSCOUNT; ATMTRAFFICDESCID=U3P1000M80; USERLABEL="used by ATM CC";;
      2) VCI=33; VCLTPID='33-RBS'$RBSCOUNT; ATMTRAFFICDESCID=U3P1000M80; USERLABEL="used by ATM CC";;
      3) VCI=36; VCLTPID='36-RBS'$RBSCOUNT; ATMTRAFFICDESCID=U3P1000M80; USERLABEL="used by ATM CC";;
      4) VCI=43; VCLTPID='43-RBS'$RBSCOUNT; ATMTRAFFICDESCID=C2P4000; USERLABEL="used by  ATM CC";;
      5) VCI=37; VCLTPID='37-RBS'$RBSCOUNT; ATMTRAFFICDESCID=U3P1000M80; USERLABEL="used by ATM CC";;
      6) VCI=44; VCLTPID='44-RBS'$RBSCOUNT; ATMTRAFFICDESCID=U3P1000M80; USERLABEL="used by ATM CC" ;;
      7) VCI=38; VCLTPID='38-RBS'$RBSCOUNT; ATMTRAFFICDESCID=U3P1000M80; USERLABEL="used by ATM CC" ;;
      8) VCI=45; VCLTPID='45-RBS'$RBSCOUNT; ATMTRAFFICDESCID=U3P1000M80; USERLABEL="used by ATM CC" ;;
      9) VCI=39; VCLTPID='39-RBS'$RBSCOUNT; ATMTRAFFICDESCID=U3P1000M80; USERLABEL="used by ATM CC" ;;
      10) VCI=40; VCLTPID='40-RBS'$RBSCOUNT; ATMTRAFFICDESCID=U3P1000M80; USERLABEL="used by ATM CC" ;;
    esac

    echo 'SET' >> $MOSCRIPT
    echo '(' >> $MOSCRIPT
    echo '   mo "ManagedElement=1,TransportNetwork=1,AtmPort=MS-'$X'-'$Y',VplTp=Vp'$RBSCOUNT',VpcTp=1,VclTp=vc'$VCLTPID'"' >> $MOSCRIPT
    echo '   identity vc'$VCLTPID >> $MOSCRIPT
    echo '   exception none' >> $MOSCRIPT
    echo '   nrOfAttributes 2' >> $MOSCRIPT
    echo '   atmTrafficDescriptorId Ref "ManagedElement=1,TransportNetwork=1,AtmTrafficDescriptor='$ATMTRAFFICDESCID'"' >> $MOSCRIPT
    echo '   externalVci Integer '$VCI >> $MOSCRIPT
    echo ')' >> $MOSCRIPT


    COUNT2=`expr $COUNT2 + 1`
  done


  Y=`expr $Y + 1`

  RBSCOUNT=`expr $RBSCOUNT + 1`
done
#########################################
#
# RNC Side
#
#########################################


#########################################
#Rob commented out Aal5, Aal2 MO's and UniSaalProfile references on 25-Feb-2013.
#as all Vcltp are cross connected via RXI with ATM CC MO's.
#The MO's are created just to keep the MO count high on the RXI, but their 
#references are not set, only the ATMCC MO's are set.

########################################
#RBSCOUNT=1
#TEMP=1

#while [ "$RBSCOUNT" -le "$NUMOFRBS" ]
#do

#  COUNT2=1
#  while [ "$COUNT2" -le 2 ]
#  do

#    case "$COUNT2"
#    in
#      1) ID=b"RNC"qa; VCLID='"ManagedElement=1,TransportNetwork=1,AtmPort=MS-24-'$TEMP',VplTp=Vp'$RBSCOUNT',VpcTp=1,VclTp=vc43-RNC-RBS'$RBSCOUNT'"';;
#      2) ID=b"RNC"qb; VCLID='"ManagedElement=1,TransportNetwork=1,AtmPort=MS-24-'$TEMP',VplTp=Vp'$RBSCOUNT',VpcTp=1,VclTp=vc44-RNC-RBS'$RBSCOUNT'"';;
#    esac

#    echo 'SET' >> $MOSCRIPT
#    echo '(' >> $MOSCRIPT
#    echo '  mo "ManagedElement=1,TransportNetwork=1,Aal5TpVccTp='$ID'"' >> $MOSCRIPT
#    echo '   identity '$ID >> $MOSCRIPT
#    echo '   exception none' >> $MOSCRIPT
#    echo '   nrOfAttributes 2' >> $MOSCRIPT
#    echo '    processorId Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=24,PlugInUnit=1"' >> $MOSCRIPT
#    echo '    vclTpId Ref '$VCLID >> $MOSCRIPT
#    echo ')' >> $MOSCRIPT


#    COUNT2=`expr $COUNT2 + 1`
#  done


#  REM=`expr $RBSCOUNT % 126`
#  if [ "$REM" -eq 0 ]
#  then
#    TEMP=`expr $TEMP + 1`
#  fi

#  RBSCOUNT=`expr $RBSCOUNT + 1`
#done


#############################################
#
# RBS Side
#
#############################################

#COUNT=1
#X=25
#Y=1
#while [ "$COUNT" -le "$NUMOFRBS" ]
#do

#  if [ "$Y" -eq 9 ]
#  then
#    Y=1
#    X=`expr $X + 1`
#  fi



#  COUNT2=1
#  while [ "$COUNT2" -le 2 ]
#  do
#
#    case "$COUNT2"
#    in
#      1) ID=b"$COUNT"qa; VCLID='"ManagedElement=1,TransportNetwork=1,AtmPort=MS-'$X'-'$Y',VplTp=Vp'$COUNT',VpcTp=1,VclTp=vc43-RBS'$COUNT'"';;
#      2) ID=b"$COUNT"qb; VCLID='"ManagedElement=1,TransportNetwork=1,AtmPort=MS-'$X'-'$Y',VplTp=Vp'$COUNT',VpcTp=1,VclTp=vc44-RBS'$COUNT'"';;
#    esac

#    echo 'SET' >> $MOSCRIPT
#    echo '(' >> $MOSCRIPT
#    echo '  mo "ManagedElement=1,TransportNetwork=1,Aal5TpVccTp='$ID'"' >> $MOSCRIPT
#    echo '   identity '$ID >> $MOSCRIPT
#    echo '   exception none' >> $MOSCRIPT
#    echo '   nrOfAttributes 2' >> $MOSCRIPT
#    echo '    processorId Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=24,PlugInUnit=1"' >> $MOSCRIPT
#    echo '    vclTpId Ref '$VCLID >> $MOSCRIPT
#    echo ')' >> $MOSCRIPT
#
#    COUNT2=`expr $COUNT2 + 1`
#  done

#  Y=`expr $Y + 1`
#  COUNT=`expr $COUNT + 1`
#done

COUNT=1
TEMP=1
X=25
Y=1
while [ "$COUNT" -le "$NUMOFRBS" ]
do

  if [ "$Y" -eq 9 ]
  then
    Y=1
    X=`expr $X + 1`
  fi


  COUNT2=1
  while [ "$COUNT2" -le 10 ]
  do

    ID=RBS-"$COUNT"-"$COUNT2"

    RBSATM='ManagedElement=1,TransportNetwork=1,AtmPort=MS-'$X'-'$Y',VplTp=Vp'$COUNT',VpcTp=1'
    RNCATM='ManagedElement=1,TransportNetwork=1,AtmPort=MS-24-'$TEMP',VplTp=Vp'$COUNT',VpcTp=1'

    case "$COUNT2"
    in
      1) VCLAID='"'$RNCATM',VclTp=vc32-RNC-RBS'$COUNT'"' ; VCLBID='"'$RBSATM',VclTp=vc32-RBS'$COUNT'"' ;;
      2) VCLAID='"'$RNCATM',VclTp=vc33-RNC-RBS'$COUNT'"' ; VCLBID='"'$RBSATM',VclTp=vc33-RBS'$COUNT'"' ;;
      3) VCLAID='"'$RNCATM',VclTp=vc36-RNC-RBS'$COUNT'"' ; VCLBID='"'$RBSATM',VclTp=vc36-RBS'$COUNT'"' ;;
      4) VCLAID='"'$RNCATM',VclTp=vc43-RNC-RBS'$COUNT'"' ; VCLBID='"'$RBSATM',VclTp=vc43-RBS'$COUNT'"' ;;
      5) VCLAID='"'$RNCATM',VclTp=vc37-RNC-RBS'$COUNT'"' ; VCLBID='"'$RBSATM',VclTp=vc37-RBS'$COUNT'"' ;;
      6) VCLAID='"'$RNCATM',VclTp=vc44-RNC-RBS'$COUNT'"' ; VCLBID='"'$RBSATM',VclTp=vc44-RBS'$COUNT'"' ;;
      7) VCLAID='"'$RNCATM',VclTp=vc38-RNC-RBS'$COUNT'"' ; VCLBID='"'$RBSATM',VclTp=vc38-RBS'$COUNT'"' ;;
      8) VCLAID='"'$RNCATM',VclTp=vc45-RNC-RBS'$COUNT'"' ; VCLBID='"'$RBSATM',VclTp=vc45-RBS'$COUNT'"' ;;
      9) VCLAID='"'$RNCATM',VclTp=vc39-RNC-RBS'$COUNT'"' ; VCLBID='"'$RBSATM',VclTp=vc39-RBS'$COUNT'"' ;;
      10) VCLAID='"'$RNCATM',VclTp=vc40-RNC-RBS'$COUNT'"' ; VCLBID='"'$RBSATM',VclTp=vc40-RBS'$COUNT'"' ;;
    esac


    echo 'SET' >> $MOSCRIPT
    echo '(' >> $MOSCRIPT
    echo '  mo "ManagedElement=1,TransportNetwork=1,AtmCrossConnection='$ID'"' >> $MOSCRIPT
    echo '   identity '$ID >> $MOSCRIPT
    echo '   exception none' >> $MOSCRIPT
    echo '   nrOfAttributes 2' >> $MOSCRIPT
    echo '   vclTpAId Ref '$VCLAID >> $MOSCRIPT
    echo '   vclTpBId Ref '$VCLBID >> $MOSCRIPT
    echo ')' >> $MOSCRIPT

    COUNT2=`expr $COUNT2 + 1`
  done

  Y=`expr $Y + 1`


  REM=`expr $COUNT % 126`
  if [ "$REM" -eq 0 ]
  then
    TEMP=`expr $TEMP + 1`
  fi


  COUNT=`expr $COUNT + 1`
done


#########################################
#
# RNC Side
#
#########################################

#COUNT=1
#while [ "$COUNT" -le 2 ]
#do

#  case "$COUNT"
#  in
#    1) ID=bRNCqa; Aal5Ref='"ManagedElement=1,TransportNetwork=1,Aal5TpVccTp=bRNCqa"';;
#    2) ID=bRNCqb; Aal5Ref='"ManagedElement=1,TransportNetwork=1,Aal5TpVccTp=bRNCqb"';;
#  esac

#  echo 'SET' >> $MOSCRIPT
#  echo '(' >> $MOSCRIPT
#  echo '  mo "ManagedElement=1,TransportNetwork=1,UniSaalTp='$ID'"' >> $MOSCRIPT
#  echo '   identity '$ID >> $MOSCRIPT
#  echo '   exception none' >> $MOSCRIPT
#  echo '   nrOfAttributes 2' >> $MOSCRIPT
#  echo '   aal5TpVccTpId Ref '$Aal5Ref >> $MOSCRIPT
#  echo '   uniSaalProfileId Ref "ManagedElement=1,TransportNetwork=1,UniSaalProfile=1"' >> $MOSCRIPT
#  echo ')' >> $MOSCRIPT


#  COUNT=`expr $COUNT + 1`
#done


#########################################
#
# RBS Side
#
#########################################


#COUNT=1
#while [ "$COUNT" -le "$NUMOFRBS" ]
#do

#  COUNT2=1
#  while [ "$COUNT2" -le 6 ]
#  do

#    case "$COUNT2"
#    in
#      1) ID=bRBS"$COUNT"qa; Aal5Ref='"ManagedElement=1,TransportNetwork=1,Aal5TpVccTp=b'$COUNT'qa"';;
#      2) ID=bRBS"$COUNT"qb; Aal5Ref='"ManagedElement=1,TransportNetwork=1,Aal5TpVccTp=b'$COUNT'qb"';;
#    esac

#    echo 'SET' >> $MOSCRIPT
#    echo '(' >> $MOSCRIPT
#    echo '  mo "ManagedElement=1,TransportNetwork=1,UniSaalTp='$ID'"' >> $MOSCRIPT
#    echo '   identity '$ID >> $MOSCRIPT
#    echo '   exception none' >> $MOSCRIPT
#    echo '   nrOfAttributes 2' >> $MOSCRIPT
#    echo '   aal5TpVccTpId Ref '$Aal5Ref >> $MOSCRIPT
#    echo '   uniSaalProfileId Ref "ManagedElement=1,TransportNetwork=1,UniSaalProfile=1"' >> $MOSCRIPT
#    echo ')' >> $MOSCRIPT

#    COUNT2=`expr $COUNT2 + 1`
#  done

#  COUNT=`expr $COUNT + 1`
#done


#########################################
#
# RNC Side
#
#########################################


#RBSCOUNT=1
#TEMP=1

#while [ "$RBSCOUNT" -le "$NUMOFRBS" ]
#do

#  echo 'SET' >> $MOSCRIPT
#  echo '(' >> $MOSCRIPT
#  echo '  mo "ManagedElement=1,TransportNetwork=1,Aal2PathVccTp=bRNCa1"' >> $MOSCRIPT
#  echo '   moType Aal2PathVccTp' >> $MOSCRIPT
#  echo '   exception none' >> $MOSCRIPT
#  echo '   nrOfAttributes 2' >> $MOSCRIPT
#  echo '   vclTpId Ref "ManagedElement=1,TransportNetwork=1,AtmPort=MS-24-'$TEMP',VplTp=Vp'$RBSCOUNT',VpcTp=1,VclTp=vc45-RNC-RBS'$RBSCOUNT'"' >> $MOSCRIPT
#  echo '   aal2QoSProfileId Ref "ManagedElement=1,TransportNetwork=1,Aal2QosProfile=1"' >> $MOSCRIPT
#  echo ')' >> $MOSCRIPT

#  echo 'SET' >> $MOSCRIPT
#  echo '(' >> $MOSCRIPT
#  echo '  mo "ManagedElement=1,TransportNetwork=1,Aal2Sp=1,Aal2Ap=RNC1"' >> $MOSCRIPT
#  echo '   identity 1' >> $MOSCRIPT
#  echo '   exception none' >> $MOSCRIPT
#  echo '   nrOfAttributes 4' >> $MOSCRIPT
#  echo '   aal2QoSCodePointProfileId Ref "ManagedElement=1,TransportNetwork=1,Aal2QosCodePointProfile=1"' >> $MOSCRIPT
#  echo '   rpuId Ref "ManagedElement=1,SwManagement=1,ReliableProgramUniter=ans_aal2ap_12_1"' >> $MOSCRIPT
#  echo '   sigLinkId Ref "ManagedElement=1,TransportNetwork=1,UniSaalTp=bRNCqa"' >> $MOSCRIPT
#  echo '   secondarySigLinkId Ref "ManagedElement=1,TransportNetwork=1,UniSaalTp=bRNCqb"' >> $MOSCRIPT
#  echo ')' >> $MOSCRIPT

#  echo 'SET' >> $MOSCRIPT
#  echo '(' >> $MOSCRIPT
#  echo '  mo "ManagedElement=1,TransportNetwork=1,Aal2Sp=1,Aal2Ap=RNC1,Aal2PathDistributionUnit=1"' >> $MOSCRIPT
#  echo '   identity 1' >> $MOSCRIPT
#  echo '   exception none' >> $MOSCRIPT
#  echo '   nrOfAttributes 2' >> $MOSCRIPT
#  echo '   rpuId Ref "ManagedElement=1,SwManagement=1,ReliableProgramUniter=ans_aal2cpsrc_12_1"' >> $MOSCRIPT
#  echo '   aal2PathVccTpList Array Ref 1' >> $MOSCRIPT
#  echo '    "ManagedElement=1,TransportNetwork=1,Aal2PathVccTp=bRNCa1"' >> $MOSCRIPT
#  echo ')' >> $MOSCRIPT


#  REM=`expr $RBSCOUNT % 126`
#  if [ "$REM" -eq 0 ]
#  then
#    TEMP=`expr $TEMP + 1`
#  fi

#  RBSCOUNT=`expr $RBSCOUNT + 1`
#done


#########################################
#
# RBS Side
#
#########################################

#COUNT=1
#X=25
#Y=1
#while [ "$COUNT" -le "$NUMOFRBS" ]
#do

#  if [ "$Y" -eq 9 ]
#  then
#    Y=1
#    X=`expr $X + 1`
#  fi



#  echo 'SET' >> $MOSCRIPT
#  echo '(' >> $MOSCRIPT
#  echo '  mo "ManagedElement=1,TransportNetwork=1,Aal2PathVccTp=b'$COUNT'a1"' >> $MOSCRIPT
#  echo '   moType Aal2PathVccTp' >> $MOSCRIPT
#  echo '   exception none' >> $MOSCRIPT
#  echo '   nrOfAttributes 2' >> $MOSCRIPT
#  echo '   vclTpId Ref "ManagedElement=1,TransportNetwork=1,AtmPort=MS-'$X'-'$Y',VplTp=Vp'$COUNT',VpcTp=1,VclTp=vc45-RBS'$COUNT'"' >> $MOSCRIPT
#  echo '   aal2QoSProfileId Ref "ManagedElement=1,TransportNetwork=1,Aal2QosProfile=1"' >> $MOSCRIPT
#  echo ')' >> $MOSCRIPT

#  Y=`expr $Y + 1`

#  COUNT=`expr $COUNT + 1`
#done


#COUNT=1
#while [ "$COUNT" -le "$NUMOFRBS" ]
#do
#
#  echo 'SET' >> $MOSCRIPT
#  echo '(' >> $MOSCRIPT
#  echo '  mo "ManagedElement=1,TransportNetwork=1,Aal2Sp=1,Aal2Ap=RBS'$COUNT'"' >> $MOSCRIPT
#  echo '   identity 1' >> $MOSCRIPT
#  echo '   exception none' >> $MOSCRIPT
#  echo '   nrOfAttributes 4' >> $MOSCRIPT
#  echo '   aal2QoSCodePointProfileId Ref "ManagedElement=1,TransportNetwork=1,Aal2QosCodePointProfile=1"' >> $MOSCRIPT
#  echo '   rpuId Ref "ManagedElement=1,SwManagement=1,ReliableProgramUniter=ans_aal2ap_12_1"' >> $MOSCRIPT
#  echo '   sigLinkId Ref "ManagedElement=1,TransportNetwork=1,UniSaalTp=bRBS'$COUNT'qa"' >> $MOSCRIPT
#  echo '   secondarySigLinkId Ref "ManagedElement=1,TransportNetwork=1,UniSaalTp=bRBS'$COUNT'qb"' >> $MOSCRIPT
#  echo ')' >> $MOSCRIPT


#  echo 'SET' >> $MOSCRIPT
#  echo '(' >> $MOSCRIPT
#  echo '  mo "ManagedElement=1,TransportNetwork=1,Aal2RoutingCase=RBS'$COUNT'"' >> $MOSCRIPT
#  echo '   identity 1' >> $MOSCRIPT
#  echo '   exception none' >> $MOSCRIPT
#  echo '   nrOfAttributes 2' >> $MOSCRIPT
#  echo '   routeList Array Ref 1' >> $MOSCRIPT
#  echo '    "ManagedElement=1,TransportNetwork=1,Aal2Sp=1,Aal2Ap=RBS'$COUNT'"' >> $MOSCRIPT
#  echo '   routePriorityList Array Integer 1' >> $MOSCRIPT
#  echo '   3' >> $MOSCRIPT
#  echo ')' >> $MOSCRIPT



#  COUNT=`expr $COUNT + 1`
#done

#COUNT=1
#while [ "$COUNT" -le "$NUMOFRBS" ]
#do

#  echo 'SET' >> $MOSCRIPT
#  echo '(' >> $MOSCRIPT
#  echo '  mo "ManagedElement=1,TransportNetwork=1,Aal2Sp=1,Aal2Ap=RBS'$COUNT',Aal2PathDistributionUnit=1"' >> $MOSCRIPT
#  echo '   identity 1' >> $MOSCRIPT
#  echo '   exception none' >> $MOSCRIPT
#  echo '   nrOfAttributes 2' >> $MOSCRIPT
#  echo '   rpuId Ref "ManagedElement=1,SwManagement=1,ReliableProgramUniter=ans_aal2cpsrc_12_1"' >> $MOSCRIPT
#  echo '   aal2PathVccTpList Array Ref 1' >> $MOSCRIPT
#  echo '    "ManagedElement=1,TransportNetwork=1,Aal2PathVccTp=b'$COUNT'a1"' >> $MOSCRIPT
#  echo ')' >> $MOSCRIPT

#  COUNT=`expr $COUNT + 1`
#done



##########################################
#
# AtmPort for RBSs
#
##########################################


RBSCOUNT=1
X=25
Y=1

VC12COUNT=1

while [ "$RBSCOUNT" -le "$NUMOFRBS" ]
do

  if [ "$Y" -eq 9 ]
  then
    Y=1
    X=`expr $X + 1`
  fi

  if [ "$VC12COUNT" -eq 64 ]
  then
    VC12COUNT=1
  fi


  echo 'SET' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo '   mo "ManagedElement=1,TransportNetwork=1,AtmPort=MS-'$X'-'$Y'"' >> $MOSCRIPT
  echo '   identity MS-'$X'-'$Y >> $MOSCRIPT
  echo '   exception none' >> $MOSCRIPT
  echo '   nrOfAttributes 1' >> $MOSCRIPT
  echo '   uses Ref "ManagedElement=1,Equipment=1,Subrack=MS,Slot=4,PlugInUnit=1,ExchangeTerminal=ET-MC41,Os155SpiTtp=1,Vc4Ttp=1,Vc12Ttp='$VC12COUNT',E1Ttp=1"' >> $MOSCRIPT
  echo ')' >> $MOSCRIPT

  Y=`expr $Y + 1`

  VC12COUNT=`expr $VC12COUNT + 1`



  RBSCOUNT=`expr $RBSCOUNT + 1`
done

echo "//.....$0:$SIMNAME MAKING MO SCRIPT RXI ended running at "`date`
echo "//"

#########################################
#
# Make MML Script
#
#########################################

RXINES='.*RXI.*'

echo '.open '$SIMNAME >> $MMLSCRIPT
echo '.selectregexp simne '$RXINES >> $MMLSCRIPT
echo '.start -parallel ' >> $MMLSCRIPT
echo 'useattributecharacteristics:switch="off";' >> $MMLSCRIPT


if [ "$SKIP_VERIFY_KERTAYLE" == "YES" ]
then
  echo 'kertayle:file="'$PWD'/'$MOSCRIPT'",skip_verify=skip;' >> $MMLSCRIPT
else
  echo 'kertayle:file="'$PWD'/'$MOSCRIPT'";' >> $MMLSCRIPT
fi


$NETSIMDIR/$NETSIMVERSION/netsim_pipe < $MMLSCRIPT


rm $PWD/$MOSCRIPT
rm $PWD/$MMLSCRIPT

echo "//...$0:$SIMNAME rxi script ended running at "`date`
echo "//"

