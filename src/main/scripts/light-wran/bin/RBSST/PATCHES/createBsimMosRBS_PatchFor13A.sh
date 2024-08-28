#!/bin/sh

# Created by  : Fatih ONUR
# Created in  : 30/08/2012
##
### VERSION HISTORY
##############################################
# Ver1        : Created for WRAN deployment O13A
# Purpose     : Update missing External Utran Cells Relations for WRAN_2 network
# Description : 
# Date        : 16.10.2012
# Who         : Reshma
##############################################

if [ "$#" -ne 1 ]
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
"6,1,421;"\
"2,44,65;"\
"7,1,100;"\
"8,1,400;"\
"2,48,65;"\
"9,2,267;"\
"10,1,240;"\
"11,1,27;"\
"12,1,50;"\
"8,1,400;"

RBSCELLARRAY="320,8-1,37-3,25-6,3-9,2-12;"\
"245,5-1,40-3,20-6,0-9,0-12;"\
"725,5-1,74-3,45-6,12-9,10-12;"\
"1450,10-1,110-3,80-6,30-9,30-12;"\
"2305,10-1,110-3,80-6,81-9,63-12;"\
"3021,21-1,100-3,100-6,100-9,100-12;"\
"0,0-1,0-3,0-6,0-9,0-12;"\
"400,400-1,0-3,0-6,0-9,0-12;"\
"0,0-1,0-3,0-6,0-9,0-12;"\
"0,0-1,0-3,0-6,0-9,0-12;"\
"0,0-1,0-3,0-6,0-9,0-12;"\
"0,0-1,0-3,0-6,0-9,0-12;"

################################
# Functions
################################

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


################################
# SETUP and PRECHECKS
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

# to get rid of extra prefix when we run the command on remote server
if [ ! -f $PWD/$0 ]
  then
  PWD=""
fi

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


max1=1000000
RANDOM1=$((`cat /dev/urandom|od -N1 -An -i` % $max1))

MOSCRIPT=$0${NOW}:$RNCNAME:${RANDOM1}:$$".mo"
MMLSCRIPT=$0${NOW}:$RNCNAME:${RANDOM1}:$$".mml"

SCRIPTNAME=`basename "$0"`
DELETE_ALL_MO_SCRIPTS="DELETE_ALL_MO_SCRIPTS_${SIMNAME}_${SCRIPTNAME}"

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

#########################################
# 
# Make MO Script
#
#########################################

echo ""
echo "MAKING MO SCRIPT"
echo ""

NUMOFRBS=`getNumOfRBS $RNCCOUNT $RNCRBSARRAY $RBSCELLARRAY`
MOFILECOUNT=1
STOP=$NUMOFRBS
COUNT=1

while [ "$COUNT" -le "$STOP" ]
do

  MOFILEEXTENSION="__"$MOFILECOUNT".mo"

  echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
  echo '(' >> $MOSCRIPT$MOFILEEXTENSION
  echo '  parent "ManagedElement=1,IpSystem=1' >> $MOSCRIPT$MOFILEEXTENSION
  echo ' identity 1' >> $MOSCRIPT$MOFILEEXTENSION
  echo ' moType IpAccessHostEt' >> $MOSCRIPT$MOFILEEXTENSION
  echo ' exception none' >> $MOSCRIPT$MOFILEEXTENSION
  echo ' nrOfAttributes 0' >> $MOSCRIPT$MOFILEEXTENSION
  echo ')' >> $MOSCRIPT$MOFILEEXTENSION

  #########################################
  #
  # Make MML Script
  #
  #########################################

  cat >> $MMLSCRIPT << MMLSCT

  .open $SIMNAME
  .select $RNCNAME$RBSNAME$COUNT
  .start
  useattributecharacteristics:switch="off";
  kertayle:file="$PWD/$MOSCRIPT$MOFILEEXTENSION";

MMLSCT

  echo "rm $PWD/$MOSCRIPT$MOFILEEXTENSION " >> $DELETE_ALL_MO_SCRIPTS # Script to clean up all the generated MO scripts
  COUNT=`expr $COUNT + 1`
  MOFILECOUNT=`expr $MOFILECOUNT + 1`
done


/netsim/inst/netsim_shell < $MMLSCRIPT

rm $PWD/$MMLSCRIPT
. $DELETE_ALL_MO_SCRIPTS
rm $DELETE_ALL_MO_SCRIPTS


echo "//...$0:$SIMNAME script ended running at "`date`
echo "//"
