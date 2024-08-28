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


. ../../dat/$ENV

. ../utilityFunctions.sh



PWD=`pwd`
NOW=`date +"%Y_%m_%d_%T:%N"`

max=1000000
RANDOM=$((`cat /dev/urandom|od -N1 -An -i` % $max))

MOSCRIPT=$0${NOW}:$$${RANDOM}".mo"
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

#########################################
#
# Make MML Script
#
#########################################

echo ""
echo "MAKING MML SCRIPT"
echo ""


COUNT=1

while [ "$COUNT" -le "$NUMOFRXI"  ]
do
echo '.open '$SIMNAME >> $MMLSCRIPT
echo '.select '$RNCNAME'RXI0'$COUNT >> $MMLSCRIPT
echo '.start ' >> $MMLSCRIPT
echo 'useattributecharacteristics:switch="off";' >> $MMLSCRIPT
echo 'kertayle:file="'$PWD'/'$MOSCRIPT'";' >> $MMLSCRIPT
COUNT=`expr $COUNT + 1`
done


$NETSIMDIR/$NETSIMVERSION/netsim_pipe < $MMLSCRIPT


rm $PWD/$MOSCRIPT
rm $PWD/$MMLSCRIPT


