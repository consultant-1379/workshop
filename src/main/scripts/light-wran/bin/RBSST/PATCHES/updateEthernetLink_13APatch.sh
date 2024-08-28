#!/bin/sh

# Created by  : unknown
# Created in  : unknown
##
### VERSION HISTORY
# Ver1        : Moddified for TERE 13A
# Purpose     : 
# Description : LA and SA share increased to 80
# Date        : 07 09 2012
# Who         : Reshma
##############################################

if [ "$#" -ne 1  ]
then
cat<<HELP

####################
# HELP
####################

Usage  : $0 <rnc num>

Example: $0 RNCL130-ST-RNC01 1

HELP

exit 1
fi


################################
# ENV VARIABLES
################################
# RNC Distribution
# [ TYPE=1, NUMOFRC=52, NUMOFRBS=75] ; [..] ; [..] ; [..]
RNCRBSARRAY="1,53,75;"\
"2,41,65;"\
"3,9,146;"\
"4,1,260;"\
"5,1,344;"\
"6,1,421;"

# RBS CELL Distribution
# TYPE1[ TOTALNUMOFCELLS,NUMOFRBS-CELLNUM,NUMOFRBS-CELLNUM,...] ; TYPE2[..] ; TYPE3[..] ; TYPE4[..]
RBSCELLARRAY="320,8-1,37-3,25-6,3-9,2-12;"\
"245,5-1,40-3,20-6,0-9,0-12;"\
"725,5-1,74-3,45-6,12-9,10-12;"\
"1450,10-1,110-3,80-6,30-9,30-12;"\
"2305,10-1,110-3,80-6,81-9,63-12;"\
"3021,21-1,100-3,100-6,100-9,100-12;"

getNumOfRBS() # RNCCOUNT RNCRBSARRAY RBSCELLARRAY
{

RNCCOUNT=$1
RNCRBSARRAY=$2
RBSCELLARRAY=$3

NUMOFRNC=0
IFS=";"
for x in $RNCRBSARRAY
do
  NUMOFRNC=`expr $NUMOFRNC + $(echo $x | awk -F"," '{print $2}')`

  if [ "$RNCCOUNT" -le "$NUMOFRNC" ]
  then
    TYPE=$(echo $x | awk -F"," '{print $1}')
    TOTALCELLS=`echo $RBSCELLARRAY  | awk -F" " '{print $'\$TYPE'}' | awk -F"," '{print $1}'`
    NUMOFRBS=`echo $x | awk -F"," '{print $3}'`

    #echo "RNCCOUNT="$RNCCOUNT
    #echo "NUMOFRBS="$NUMOFRBS
    echo $NUMOFRBS
    #echo "NUMOFRNC="$NUMOFRNC
    #echo "TYPE="$TYPE
    #echo "TOTALCELLS="$TOTALCELLS
    #echo $TOTALCELLS
    break
  fi
done;
}
#END

################################
# MAIN
################################
RNCID=$1

if [ "$RNCID" -le 9 ]
then
  RNCNAME="RNC0"$RNCID
  RNCCOUNT="0"$RNCID
else
  RNCNAME="RNC"$RNCID
  RNCCOUNT=$RNCID
fi

PWD=`pwd`
NOW=`date +"%Y_%m_%d_%T:%N"`

max1=1000000
RANDOM1=$((`cat /dev/urandom|od -N1 -An -i` % $max1))

MOSCRIPT=$0${NOW}:$RNCNAME:${RANDOM1}:$$".mo"
MMLSCRIPT=$0${NOW}:$RNCNAME:${RANDOM1}:$$".mml"


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

SIMNAME=`ls /netsim/netsimdir | egrep ${RNCNAME} | grep ST | grep -m1 -v zip`
SUCCESS=$?
echo "SUCCESS="$SUCCESS

if [ $SUCCESS -eq 1 ]
then
  echo "no simulation found!"
  echo "exiting..."
  echo ""
  exit
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
RBSSTART=1
NUMOFRBS=`getNumOfRBS $RNCCOUNT $RNCRBSARRAY $RBSCELLARRAY`
RBSEND=$NUMOFRBS

if [ "$RNCID" -eq 106 ]
then
  RBSSTART=127
  RBSEND=252
fi
 
COUNT=$RBSSTART
STOP=$RBSEND
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
  # Creating the ethernet link below.
  cat >> $MOSCRIPT$MOFILEEXTENSION << MOSCT
  SET
  (
  mo "ManagedElement=1,IpOam=1,Ip=1,EthernetLink=1"
  exception none
  nrOfAttributes 1
  ipAddress String 0.0.0.0
  )
MOSCT

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
 /netsim/inst/netsim_pipe < $MMLSCRIPT

#############################
rm $PWD/$MMLSCRIPT
. $DEL1
rm $DEL1


echo "//...$0:$SIMNAME rbs_trans script ended running at "`date`
echo "//"
