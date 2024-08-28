#!/bin/sh

# Created by  : unknown
# Created in  : unknown
##
### VERSION HISTORY
# Ver1        : Unknown/No deteails exist
##################################################
# Ver2        : Moddified for TERE 10.2
# Purpose     : Req id: 3425
# Description : RAC decreased to 256
# Date        : 18 03 2010
# Who         : Fatih ONUR
##################################################
# Ver2        : Created for WRAN deployment O.10.2.4, req id:3922
# Purpose     : 
# Description : RAC decreased to 255 due to MOM which it can support up to 255
# Date        : 29.05.2010
# Who         : Fatih ONUR
##################################################
# Ver3        : Created for WRAN deployment O.10.3
# Purpose     :
# Description : Minor changes for RA and LA values
# Date        : 10.07.2010
# Who         : Fatih ONUR
##################################################
# Ver4        : Created for WRAN deployment O.10.3
# Purpose     : WCC modification
# Description : maximumTransmissionPower attribute of UtranCell is set to 398
# Date        : 24.07.2010
# Who         : Fatih ONUR
##################################################
# Ver5        : Moddified for TERE 0-11.0 
# Purpose     : 
# Description :
# Date        : 19 08 2010
# Who         : Fatih ONUR
##################################################
# Ver6        : Moddified for TERE 0-11.2 
# Purpose     : UtranCells attributes are set for IRATHOM WRANtoGRAN
# Description :
# Date        : 27 02 2011
# Who         : Fatih ONUR
##################################################
# Ver7        : Moddified for TERE 0-11.2
# Purpose     : UtranCells attribute:aministratitiveState is set to UNLOCK, reqId:6185
# Description :
# Date        : 27 02 2011
# Who         : Fatih ONUR
##################################################
# Ver8        : Moddified for TERE 0-11.2 and reqId:6201
# Purpose     : WRAN to WRAN IRATHOM feature added to sims
# Description : WRAN_2 Network ExternalUtranCells Modified
# Date        : 21 03 2011
# Who         : Fatih ONUR
##################################################
# Ver6        : Moddified for TERE 0-11.2 and reqId:6632
# Purpose     : maxTxPowerUl value changed from 100 to 30 which allowed range [-50 .. 33]
# Description :
# Date        : 23 03 2011
# Who         : Fatih ONUR
##################################################



if [ "$#" -ne 3  ]
then
cat<<HELP

####################
# HELP
####################

Usage  : $0 <sim name> <env file> <rnc num>

Example: $0 RNCL130-ST-RNC01 R7-ST-G-N.env 1

HELP

exit 1
fi


################################
# MAIN
################################


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

echo "//...$0:$RNCNAME script started running at "`date`
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
# 
# Make MO Script
#
#########################################

echo "//" >> $MOSCRIPT
echo "//$0:$RNCNAME MAKING MO SCRIPT started at "`date` >> $MOSCRIPT
echo "//" >> $MOSCRIPT

echo "//" 
echo "//$0:$RNCNAME MAKING MO SCRIPT started at "`date` 
echo "//" 



NUMOF_EUTRANFREQ=8
START_EUTRANFREQ=1
STOP_EUTRANFREQ=$NUMOF_EUTRANFREQ

COUNT=$START_EUTRANFREQ
while [ "$COUNT" -le "$STOP_EUTRANFREQ" ]
do

  #echo ":: ManagedElement=1,RncFunction=1,EutraNetwork=1,EutranFrequency="$COUNT

  echo 'CREATE' >> $MOSCRIPT
  echo '(' >> $MOSCRIPT
  echo '  parent "ManagedElement=1,RncFunction=1,EutraNetwork=1' >> $MOSCRIPT
  echo "    identity "$COUNT >> $MOSCRIPT
  echo '    moType EutranFrequency' >> $MOSCRIPT
  echo '    exception none' >> $MOSCRIPT
  echo "    earfcnDl Integer "$COUNT >> $MOSCRIPT
  echo ')' >> $MOSCRIPT

  COUNT=`expr $COUNT + 1`
done
#echo""
######################
# END EutranFrequency
######################


COUNT=1
RBSCOUNT=1
CELLCOUNT=1

#########################################
# Total num of cells per RNC
#########################################
TOTALCELLS=`getTotalCells $RNCCOUNT $RNCRBSARRAY $RBSCELLARRAY`
#echo "TOTALCELLS="$TOTALCELLS

#exit

# Num of cell has sharing same LA/RA
# values comes from env file
#SHARE1 
#SHARE2

START_CUMTOTALCELLS=`getCumulativeTotalCells $RNCCOUNT 1 $RNCRBSARRAY $RBSCELLARRAY`

CID=$START_CUMTOTALCELLS

LASTART=`getLAStart $RNCCOUNT $SHARE1 $RNCRBSARRAY $RBSCELLARRAY`
LA=$LASTART

#### RNC109 is a special case: Max num of LAs exceeds for SHARE=56
#
if [ $RNCCOUNT -eq 109 ] 
then
  SHARE1=$SHARE2
fi

TCELLCOUNT=1

while [ "$COUNT" -le "$TOTALCELLS" ]
do

  MOD=`expr $LA % 255`
  if [ $MOD -eq 0 ]
  then
    RA=255
  else
    RA=`expr $LA % 255`
  fi

  SA=$CID

  NUMOFCELL=`getNumOfCell $RNCCOUNT $RBSCOUNT $RNCRBSARRAY $RBSCELLARRAY`
  CELLSTOP=`expr $NUMOFCELL + 1`

  if [ "$CELLCOUNT" -eq "$CELLSTOP" ]
  then
    CELLCOUNT=1
    RBSCOUNT=`expr $RBSCOUNT + 1`
  fi

  UTRANCELLID=`cell_name $RNCCOUNT $RBSCOUNT $CELLCOUNT`

  # Utrancell attribute set
  #URAREF="ManagedElement=1,RncFunction=1,Ura="$URAID
  UARFCNDL=`expr \( \( $RNCCOUNT \* 1 \) + 0 \) % 16384`
  #echo "TARGETRNCCOUNT="$RNCCOUNT" NUMOFRBS="$NUMOFRBS" RBSCOUNT="$RBSCOUNT

  UARFCNUL=12
  PRIMSCRCODE=`expr $COUNT % 512`
  PRIMARYCPICHPOWER=300
  QRXLEVMIN=-115
  QQUALMIN=-24
  MAXIMUMTRANSMISSIONPOWER=398
  MAXTXPOWERUL=30

  USEDFREQTHRESH2DRSCP=-100
  USEDFREQTHRESH2DECNO=-12
  SRATSEARCH=4

  ADMINISTRATIVESTATE=1 # 0-LOCKED, 1-UNLOCKED, 2-SHUTTING_DOWN
  OPERATIONALSTATE=1  # 0-DISABLED, 1-ENABLED
  

  #### tCell attribute max value is 9
  if [ "$TCELLCOUNT" -gt 9 ]
  then
    TCELLCOUNT=1
  fi



  NUMOF_EUTRANFREQ_REL=`getNumOfEutranFreqRel $COUNT $TOTALCELLS`
  START_EUTRANFREQ_REL=1
  STOP_EUTRANFREQ_REL=$NUMOF_EUTRANFREQ_REL

  LOC_COUNT=1

  VAR=$START_EUTRANFREQ_REL
  VAR=1
  VARSTOP=$STOP_EUTRANFREQ_REL

  while [ "$VAR" -le "$VARSTOP" ]
  do

    UCREF1="ManagedElement=1,RncFunction=1,EutraNetwork=1,EutranFrequency="$VAR

    #echo "TOT-CELL-"$COUNT" LOC-CELL-"$CELLCOUNT" TOT-RELATION-"$VAR": LOC-RELATION-"$LOC_COUNT": "$UTRANCELLID" -> $UCREF1"

    LOC_COUNT=`expr $LOC_COUNT + 1`

    echo 'CREATE' >> $MOSCRIPT
    echo '(' >> $MOSCRIPT
    echo '  parent "ManagedElement=1,RncFunction=1,UtranCell='$UTRANCELLID'"' >> $MOSCRIPT
    echo '   identity '$VAR >> $MOSCRIPT
    echo '    moType EutranFreqRelation' >> $MOSCRIPT
    echo '    exception none' >> $MOSCRIPT
    echo '    nrOfAttributes 1' >> $MOSCRIPT
    echo "      eutranFrequencyRef Ref "$UCREF1 >> $MOSCRIPT
    echo '      EutranFreqRelationId String '$VAR >> $MOSCRIPT
    echo "      userLabel String \"Ref to EutranFrequency=$VAR (ManagedElement=1,RncFunction=1,EutraNetwork=1,EutranFrequency=$VAR)\" " >> $MOSCRIPT
    echo ')' >> $MOSCRIPT

    VAR=`expr $VAR + 1`
  done


  #########################################
  # END EutranFreqRelation (tmp1500createExtEutranFreqRelation.sh)
  #########################################


  CID=`expr $CID + 1`

  # For testing. To quit at required amount
  #if [ "$COUNT" -eq 3 ]
  #then
  #  break
  #  exit 1
  #fi

  CELLCOUNT=`expr $CELLCOUNT + 1`
  TCELLCOUNT=`expr $TCELLCOUNT + 1`
  COUNT=`expr $COUNT + 1`
done


echo "//"
echo "//$0:$RNCNAME MAKING MO SCRIPT ended at "`date`

echo "//" >> $MOSCRIPT
echo "//$0:$RNCNAME MAKING MO SCRIPT ended at "`date` >> $MOSCRIPT

cat $PWD/$MOSCRIPT
#rm $PWD/$MOSCRIPT
exit

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
#echo 'kertayle:file="'$PWD'/'$MOSCRIPT'",skip_verify=skip;' >> $MMLSCRIPT

# $NETSIMDIR/$NETSIMVERSION/netsim_pipe < $MMLSCRIPT

#rm $PWD/$MOSCRIPT
rm $PWD/$MMLSCRIPT

echo "...$0:$RNCNAME script ended at "`date`
echo ""
