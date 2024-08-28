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





































