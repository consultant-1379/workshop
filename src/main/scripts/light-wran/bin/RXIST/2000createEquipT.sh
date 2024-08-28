#!/bin/sh


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

if [ "$3" -eq 0 ]
then
RNCNAME=
fi


. ../../dat/$ENV


PWD=`pwd`
NOW=`date +"%Y_%m_%d_%T:%N"`

max=1000000
RANDOM=$((`cat /dev/urandom|od -N1 -An -i` % $max))

MOSCRIPT=$SIMDIR/mo/$RXIDIR/equipT.mo
MMLSCRIPT=$0${NOW}:$$${RANDOM}".mml"


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

echo ""
echo "MAKING MO SCRIPT"
echo ""





#
## tmp2020createE1PhysT.sh
#
COUNT=1
while [ "$COUNT" -le 14 ]
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

NUMOFRBS=`getNumOfRBS $RNCCOUNT $RNCRBSARRAY $RBSCELLARRAY`

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

COUNT2=1
while [ "$COUNT2" -le 13 ]
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
 11) VCLTPID=vc43-RNC;;
 12) VCLTPID=vc44-RNC;;
 13) VCLTPID=vc45-RNC;;

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
while [ "$COUNT2" -le 13 ]
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
 10) VCLTPID=vc42-RBS$RBSCOUNT;;
 11) VCLTPID=vc43-RBS$RBSCOUNT;;
 12) VCLTPID=vc44-RBS$RBSCOUNT;;
 13) VCLTPID=vc45-RBS$RBSCOUNT;;
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

#
## tmp2050createAtmTrafficDescriptor.sh
#

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

#
## tmp2060createAtmCrossConnects.sh
#

NUMOFRBS=`getNumOfRBS $RNCCOUNT $RNCRBSARRAY $RBSCELLARRAY`

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

#
## tmp2070createAal5.sh
#

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

NUMOFRBS=`getNumOfRBS $RNCCOUNT $RNCRBSARRAY $RBSCELLARRAY`

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

#
## tmp2080createUniSaalProfile.sh
#

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

#
## tmp2090createUniSaalTp.sh
#

NUMOFRBS=`getNumOfRBS $RNCCOUNT $RNCRBSARRAY $RBSCELLARRAY`


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

#
## tmp2100createAal2.sh
#

NUMOFRBS=`getNumOfRBS $RNCCOUNT $RNCRBSARRAY $RBSCELLARRAY`


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

#
## tmp2110createExchangeTerminal.sh
#

NUMOFRBS=`getNumOfRBS $RNCCOUNT $RNCRBSARRAY $RBSCELLARRAY`


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

#
## tmp2120setVp.sh
#

##########################################
#
# AtmPort for RNC
#
##########################################


NUMOFRBS=`getNumOfRBS $RNCCOUNT $RNCRBSARRAY $RBSCELLARRAY`


RBSCOUNT=1
TEMP=1

while [ "$RBSCOUNT" -le "$NUMOFRBS" ]
do

echo 'SET' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  mo "ManagedElement=1,TransportNetwork=1,AtmPort=MS-24-'$TEMP',VplTp=Vp'$RBSCOUNT'"' >> $MOSCRIPT
echo '   identity Vp1' >> $MOSCRIPT
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
 1) VCI=31; VCLTPID='31-RNC-RBS'$RBSCOUNT; ATMTRAFFICDESCID=C1P4528; USERLABEL="used by Aal5 b x1 (IpAtmLink)";;
 2) VCI=32; VCLTPID='32-RNC-RBS'$RBSCOUNT; ATMTRAFFICDESCID=C1P4528; USERLABEL="used by Aal5 b x2 (IpAtmLink)";;
 3) VCI=33; VCLTPID='33-RNC-RBS'$RBSCOUNT; ATMTRAFFICDESCID=C1P4528; USERLABEL="used by Aal0 bsa (NodeSynchTp1)";;
 4) VCI=34; VCLTPID='34-RNC-RBS'$RBSCOUNT; ATMTRAFFICDESCID=C1P4528; USERLABEL="used by Aal0 bsb-x (NodeSyncT2p)";;
 5) VCI=35; VCLTPID='35-RNC-RBS'$RBSCOUNT; ATMTRAFFICDESCID=C1P4528; USERLABEL="used by Aal0 bsb (NodeSynchTp2)" ;;
 6) VCI=36; VCLTPID='36-RNC-RBS'$RBSCOUNT; ATMTRAFFICDESCID=C1P4528; USERLABEL="used by Aal0 bsb-x (NodeSyncT2p)";;
 7) VCI=37; VCLTPID='37-RNC-RBS'$RBSCOUNT; ATMTRAFFICDESCID=U3P1000M80; USERLABEL="used by Aal5 bca (Nbap Common)";;
 8) VCI=38; VCLTPID='38-RNC-RBS'$RBSCOUNT; ATMTRAFFICDESCID=U3P1000M80; USERLABEL="used by Aal5 bda (Nbap Dedicated)";;
 9) VCI=39; VCLTPID='39-RNC-RBS'$RBSCOUNT; ATMTRAFFICDESCID=U3P1000M80; USERLABEL="used by Aal5 bqa (Aal2 signalling)";;
10) VCI=42; VCLTPID='42-RNC-RBS'$RBSCOUNT; ATMTRAFFICDESCID=U3P1000M80; USERLABEL="used by Aal2 ba1 (Aal2Path)";;
11) VCI=43; VCLTPID='43-RNC'; ATMTRAFFICDESCID=C2P4000; USERLABEL="used by Aal5 bcb (Nbap Common)";;
12) VCI=44; VCLTPID='44-RNC'; ATMTRAFFICDESCID=U3P1000M80; USERLABEL="used by Aal5 bdb (Nbap Dedicated)";;
13) VCI=45; VCLTPID='45-RNC'; ATMTRAFFICDESCID=U3P1000M80; USERLABEL="used by Aal5 bqb (Aal2 signalling)" ;;
esac

echo 'SET' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  mo "ManagedElement=1,TransportNetwork=1,AtmPort=MS-24-'$TEMP',VplTp=Vp'$RBSCOUNT',VpcTp=1,VclTp=vc'$VCLTPID'"' >> $MOSCRIPT
echo '   identity vc'$VCLTPID >> $MOSCRIPT
echo '   moType VclTp' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 3' >> $MOSCRIPT
echo '   userLabel String "'$USERLABEL'"' >> $MOSCRIPT
echo '   atmTrafficDescriptorId Ref "ManagedElement=1,TransportNetwork=1,AtmTrafficDescriptor='$ATMTRAFFICDESCID'"' >> $MOSCRIPT
echo '   externalVci Integer '$VCI >> $MOSCRIPT
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
while [ "$COUNT2" -le 13 ]
do

case "$COUNT2"
in
 1) VCI=31; VCLTPID='31-RBS'$RBSCOUNT; ATMTRAFFICDESCID=C1P4528; USERLABEL="used by Aal5 b x1 (IpAtmLink)";;
 2) VCI=32; VCLTPID='32-RBS'$RBSCOUNT; ATMTRAFFICDESCID=C1P4528; USERLABEL="used by Aal5 b x2 (IpAtmLink)";;
 3) VCI=33; VCLTPID='33-RBS'$RBSCOUNT; ATMTRAFFICDESCID=C1P4528; USERLABEL="used by Aal0 bsa (NodeSynchTp1)";;
 4) VCI=34; VCLTPID='34-RBS'$RBSCOUNT; ATMTRAFFICDESCID=C1P4528; USERLABEL="used by Aal0 bsb-x (NodeSyncT2p)";;
 5) VCI=35; VCLTPID='35-RBS'$RBSCOUNT; ATMTRAFFICDESCID=C1P4528; USERLABEL="used by Aal0 bsb (NodeSynchTp2)" ;;
 6) VCI=36; VCLTPID='36-RBS'$RBSCOUNT; ATMTRAFFICDESCID=C1P4528; USERLABEL="used by Aal0 bsb-x (NodeSyncT2p)";;
 7) VCI=37; VCLTPID='37-RBS'$RBSCOUNT; ATMTRAFFICDESCID=U3P1000M80; USERLABEL="used by Aal5 bca (Nbap Common)";;
 8) VCI=38; VCLTPID='38-RBS'$RBSCOUNT; ATMTRAFFICDESCID=U3P1000M80; USERLABEL="used by Aal5 bda (Nbap Dedicated)";;
 9) VCI=39; VCLTPID='39-RBS'$RBSCOUNT; ATMTRAFFICDESCID=U3P1000M80; USERLABEL="used by Aal5 bqa (Aal2 signalling)";;
10) VCI=42; VCLTPID='42-RBS'$RBSCOUNT; ATMTRAFFICDESCID=U3P1000M80; USERLABEL="used by Aal2 ba1 (Aal2Path)";;
11) VCI=43; VCLTPID='43-RBS'$RBSCOUNT; ATMTRAFFICDESCID=C2P4000; USERLABEL="used by Aal5 bcb (Nbap Common)";;
12) VCI=44; VCLTPID='44-RBS'$RBSCOUNT; ATMTRAFFICDESCID=U3P1000M80; USERLABEL="used by Aal5 bdb (Nbap Dedicated)";;
13) VCI=45; VCLTPID='45-RBS'$RBSCOUNT; ATMTRAFFICDESCID=U3P1000M80; USERLABEL="used by Aal5 bqb (Aal2 signalling)" ;;
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

#
## tmp2130setAal5.sh
#

#########################################
#
# RNC Side
#
#########################################

NUMOFRBS=`getNumOfRBS $RNCCOUNT $RNCRBSARRAY $RBSCELLARRAY`


RBSCOUNT=1
TEMP=1

while [ "$RBSCOUNT" -le "$NUMOFRBS" ]
do

COUNT2=1
 while [ "$COUNT2" -le 2 ]
 do

 case "$COUNT2"
 in
   1) ID=b"RNC"qa; VCLID='"ManagedElement=1,TransportNetwork=1,AtmPort=MS-24-'$TEMP',VplTp=Vp'$RBSCOUNT',VpcTp=1,VclTp=vc43-RNC"';;
   2) ID=b"RNC"qb; VCLID='"ManagedElement=1,TransportNetwork=1,AtmPort=MS-24-'$TEMP',VplTp=Vp'$RBSCOUNT',VpcTp=1,VclTp=vc44-RNC"';;
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

REM=`expr $RBSCOUNT % 126`
if [ "$REM" -eq 0 ]
then
 TEMP=`expr $TEMP + 1`
fi

RBSCOUNT=`expr $RBSCOUNT + 1`
done


#############################################
#
# RBS Side
#
#############################################

COUNT=1
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
 while [ "$COUNT2" -le 2 ]
 do

 case "$COUNT2"
 in
   1) ID=b"$COUNT"qa; VCLID='"ManagedElement=1,TransportNetwork=1,AtmPort=MS-'$X'-'$Y',VplTp=Vp'$COUNT',VpcTp=1,VclTp=vc43-RBS'$COUNT'"';;
   2) ID=b"$COUNT"qb; VCLID='"ManagedElement=1,TransportNetwork=1,AtmPort=MS-'$X'-'$Y',VplTp=Vp'$COUNT',VpcTp=1,VclTp=vc44-RBS'$COUNT'"';;
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

Y=`expr $Y + 1`
COUNT=`expr $COUNT + 1`
done

#
## tmp2140setAtmCrossConnects.sh
#

NUMOFRBS=`getNumOfRBS $RNCCOUNT $RNCRBSARRAY $RBSCELLARRAY`

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
  1) VCLAID='"'$RNCATM',VclTp=vc31-RNC-RBS'$COUNT'"' ; VCLBID='"'$RBSATM',VclTp=vc31-RBS'$COUNT'"' ;;
  2) VCLAID='"'$RNCATM',VclTp=vc32-RNC-RBS'$COUNT'"' ; VCLBID='"'$RBSATM',VclTp=vc32-RBS'$COUNT'"' ;;
  3) VCLAID='"'$RNCATM',VclTp=vc33-RNC-RBS'$COUNT'"' ; VCLBID='"'$RBSATM',VclTp=vc33-RBS'$COUNT'"' ;;
  4) VCLAID='"'$RNCATM',VclTp=vc34-RNC-RBS'$COUNT'"' ; VCLBID='"'$RBSATM',VclTp=vc34-RBS'$COUNT'"' ;;
  5) VCLAID='"'$RNCATM',VclTp=vc35-RNC-RBS'$COUNT'"' ; VCLBID='"'$RBSATM',VclTp=vc35-RBS'$COUNT'"' ;;
  6) VCLAID='"'$RNCATM',VclTp=vc36-RNC-RBS'$COUNT'"' ; VCLBID='"'$RBSATM',VclTp=vc36-RBS'$COUNT'"' ;;
  7) VCLAID='"'$RNCATM',VclTp=vc37-RNC-RBS'$COUNT'"' ; VCLBID='"'$RBSATM',VclTp=vc37-RBS'$COUNT'"' ;;
  8) VCLAID='"'$RNCATM',VclTp=vc38-RNC-RBS'$COUNT'"' ; VCLBID='"'$RBSATM',VclTp=vc38-RBS'$COUNT'"' ;;
  9) VCLAID='"'$RNCATM',VclTp=vc39-RNC-RBS'$COUNT'"' ; VCLBID='"'$RBSATM',VclTp=vc39-RBS'$COUNT'"' ;;
  10) VCLAID='"'$RNCATM',VclTp=vc42-RNC-RBS'$COUNT'"' ; VCLBID='"'$RBSATM',VclTp=vc42-RBS'$COUNT'"' ;;
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

#
## tmp2150setUniSaalTp.sh
#

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
   1) ID=bRNCqa; Aal5Ref='"ManagedElement=1,TransportNetwork=1,Aal5TpVccTp=bRNCqa"';;
   2) ID=bRNCqb; Aal5Ref='"ManagedElement=1,TransportNetwork=1,Aal5TpVccTp=bRNCqb"';;
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


COUNT=`expr $COUNT + 1`
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
 while [ "$COUNT2" -le 6 ]
 do

 case "$COUNT2"
 in
   1) ID=bRBS"$COUNT"qa; Aal5Ref='"ManagedElement=1,TransportNetwork=1,Aal5TpVccTp=b'$COUNT'qa"';;
   2) ID=bRBS"$COUNT"qb; Aal5Ref='"ManagedElement=1,TransportNetwork=1,Aal5TpVccTp=b'$COUNT'qb"';;
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

COUNT=`expr $COUNT + 1`
done

#
## tmp2160setAal2.sh
#

NUMOFRBS=`getNumOfRBS $RNCCOUNT $RNCRBSARRAY $RBSCELLARRAY`


#########################################
#
# RNC Side
#
#########################################


RBSCOUNT=1
TEMP=1

while [ "$RBSCOUNT" -le "$NUMOFRBS" ]
do

echo 'SET' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  mo "ManagedElement=1,TransportNetwork=1,Aal2PathVccTp=bRNCa1"' >> $MOSCRIPT
echo '   moType Aal2PathVccTp' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 2' >> $MOSCRIPT
echo '   vclTpId Ref "ManagedElement=1,TransportNetwork=1,AtmPort=MS-24-'$TEMP',VplTp=Vp'$RBSCOUNT',VpcTp=1,VclTp=vc45-RNC"' >> $MOSCRIPT
echo '   aal2QoSProfileId Ref "ManagedElement=1,TransportNetwork=1,Aal2QosProfile=1"' >> $MOSCRIPT
echo ')' >> $MOSCRIPT
echo 'SET' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  mo "ManagedElement=1,TransportNetwork=1,Aal2Sp=1,Aal2Ap=RNC1"' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 4' >> $MOSCRIPT
echo '   aal2QoSCodePointProfileId Ref "ManagedElement=1,TransportNetwork=1,Aal2QosCodePointProfile=1"' >> $MOSCRIPT
echo '   rpuId Ref "ManagedElement=1,SwManagement=1,ReliableProgramUniter=ans_aal2ap_12_1"' >> $MOSCRIPT
echo '   sigLinkId Ref "ManagedElement=1,TransportNetwork=1,UniSaalTp=bRNCqa"' >> $MOSCRIPT
echo '   secondarySigLinkId Ref "ManagedElement=1,TransportNetwork=1,UniSaalTp=bRNCqb"' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

echo 'SET' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  mo "ManagedElement=1,TransportNetwork=1,Aal2Sp=1,Aal2Ap=RNC1,Aal2PathDistributionUnit=1"' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 2' >> $MOSCRIPT
echo '   rpuId Ref "ManagedElement=1,SwManagement=1,ReliableProgramUniter=ans_aal2cpsrc_12_1"' >> $MOSCRIPT
echo '   aal2PathVccTpList Array Ref 1' >> $MOSCRIPT
echo '    "ManagedElement=1,TransportNetwork=1,Aal2PathVccTp=bRNCa1"' >> $MOSCRIPT
echo ')' >> $MOSCRIPT


REM=`expr $RBSCOUNT % 126`
if [ "$REM" -eq 0 ]
then
 TEMP=`expr $TEMP + 1`
fi

RBSCOUNT=`expr $RBSCOUNT + 1`
done


#########################################
#
# RBS Side
#
#########################################
COUNT=1
X=25
Y=1
while [ "$COUNT" -le "$NUMOFRBS" ]
do

if [ "$Y" -eq 9 ]
then
Y=1
X=`expr $X + 1`
fi



echo 'SET' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  mo "ManagedElement=1,TransportNetwork=1,Aal2PathVccTp=b'$COUNT'a1"' >> $MOSCRIPT
echo '   moType Aal2PathVccTp' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 2' >> $MOSCRIPT
echo '   vclTpId Ref "ManagedElement=1,TransportNetwork=1,AtmPort=MS-'$X'-'$Y',VplTp=Vp'$COUNT',VpcTp=1,VclTp=vc45-RBS'$COUNT'"' >> $MOSCRIPT
echo '   aal2QoSProfileId Ref "ManagedElement=1,TransportNetwork=1,Aal2QosProfile=1"' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

Y=`expr $Y + 1`

COUNT=`expr $COUNT + 1`
done


COUNT=1
while [ "$COUNT" -le "$NUMOFRBS" ]
do

echo 'SET' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  mo "ManagedElement=1,TransportNetwork=1,Aal2Sp=1,Aal2Ap=RBS'$COUNT'"' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 4' >> $MOSCRIPT
echo '   aal2QoSCodePointProfileId Ref "ManagedElement=1,TransportNetwork=1,Aal2QosCodePointProfile=1"' >> $MOSCRIPT
echo '   rpuId Ref "ManagedElement=1,SwManagement=1,ReliableProgramUniter=ans_aal2ap_12_1"' >> $MOSCRIPT
echo '   sigLinkId Ref "ManagedElement=1,TransportNetwork=1,UniSaalTp=bRBS'$COUNT'qa"' >> $MOSCRIPT
echo '   secondarySigLinkId Ref "ManagedElement=1,TransportNetwork=1,UniSaalTp=bRBS'$COUNT'qb"' >> $MOSCRIPT
echo ')' >> $MOSCRIPT


echo 'SET' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  mo "ManagedElement=1,TransportNetwork=1,Aal2RoutingCase=RBS'$COUNT'"' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 2' >> $MOSCRIPT
echo '   routeList Array Ref 1' >> $MOSCRIPT
echo '    "ManagedElement=1,TransportNetwork=1,Aal2Sp=1,Aal2Ap=RBS'$COUNT'"' >> $MOSCRIPT
echo '   routePriorityList Array Integer 1' >> $MOSCRIPT
echo '   3' >> $MOSCRIPT
echo ')' >> $MOSCRIPT



COUNT=`expr $COUNT + 1`
done

COUNT=1
while [ "$COUNT" -le "$NUMOFRBS" ]
do
echo 'SET' >> $MOSCRIPT
echo '(' >> $MOSCRIPT
echo '  mo "ManagedElement=1,TransportNetwork=1,Aal2Sp=1,Aal2Ap=RBS'$COUNT',Aal2PathDistributionUnit=1"' >> $MOSCRIPT
echo '   identity 1' >> $MOSCRIPT
echo '   exception none' >> $MOSCRIPT
echo '   nrOfAttributes 2' >> $MOSCRIPT
echo '   rpuId Ref "ManagedElement=1,SwManagement=1,ReliableProgramUniter=ans_aal2cpsrc_12_1"' >> $MOSCRIPT
echo '   aal2PathVccTpList Array Ref 1' >> $MOSCRIPT
echo '    "ManagedElement=1,TransportNetwork=1,Aal2PathVccTp=b'$COUNT'a1"' >> $MOSCRIPT
echo ')' >> $MOSCRIPT

COUNT=`expr $COUNT + 1`
done

#
## tmp2170setAtmPort.sh
#

NUMOFRBS=`getNumOfRBS $RNCCOUNT $RNCRBSARRAY $RBSCELLARRAY`


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
# Make MML Script
#########################################


RXINES='.*RXI.*'

echo '.open '$SIMNAME >> $MMLSCRIPT
echo '.select '$RNCNAME'RXI0'$COUNT >> $MMLSCRIPT
echo '.start ' >> $MMLSCRIPT
echo 'useattributecharacteristics:switch="off";' >> $MMLSCRIPT
echo 'kertayle:file="'$MOSCRIPT'";' >> $MMLSCRIPT


$NETSIMDIR/$NETSIMVERSION/netsim_pipe < $MMLSCRIPT


rm $PWD/$MMLSCRIPT
rm $PWD/$MMLSCRIPT

echo "//...$0:$SIMNAME rxi script ended running at "`date`
echo "//"

