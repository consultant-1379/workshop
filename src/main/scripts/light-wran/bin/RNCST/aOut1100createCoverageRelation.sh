#!/bin/sh

# Created by  : unknown
# Created in  : unknown
##
### VERSION HISTORY
##############
# Ver2        : Moddified for TERE 10.2
# Purpose     : For W10B nodes and posterior versions  5 Coverage Relations, for W10A and earlier versions has 1 Coverage Relation
# Description :
# Date        : 10 FEB 2010
# Who         : Fatih ONUR
##############
# Ver3        : Moddified for TERE 10.2
# Purpose     : Req id:3645
# Description : To solve the problem of coverage relations with have relations to them selves
# Date        : 24 MAR 2010
# Who         : Fatih ONUR
##############
# Ver4        : Moddified for TERE 10.3
# Purpose     : Req id:4667
# Description : Coverage Relations reduced from 5 to 3.
# Date        : 06 JUL 2010
# Who         : Fatih ONUR
##############
# Ver5        : Moddified for WRAN TERE O.11.0
# Purpose     : 
# Description : 
# Date        : 09 AUG 2010
# Who         : Fatih ONUR
##############
# Ver6        : Moddified for WRAN TERE O.12.0
# Purpose     :
# Description :
# Date        : 12 AUG 2011
# Who         : Fatih ONUR
##############




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


MOSCRIPT=$0${NOW}:$RNCNAME".mo"
MMLSCRIPT=$0${NOW}:$RNCNAME".mml"

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

#RUN="YE" # YES to enable run | NO to disable run
#UTRANCELLS_COVERAGE_RELATION=$RUN

if [ "$UTRANCELLS_COVERAGE_RELATION" == "YES" ]
then


echo "//.....$0:$RNCNAME MAKING MO SCRIPT started at "`date` >> $MOSCRIPT
echo "//" >> $MOSCRIPT


#########################################
# 
# Make MO Script
#
#########################################

#echo ""
#echo "MAKING MO SCRIPT"
#echo ""



######################################################
#
# (1)  Create CoverageRelation  
#
######################################################

TOTALCELLS=`getTotalCells $RNCCOUNT $RNCRBSARRAY $RBSCELLARRAY`

COUNT=1 
RBSCOUNT=1 
TARRBSCOUNT=1 
CELLCOUNT=1
TARCELLCOUNT=1

NUMOFRBS=`getNumOfRBS $RNCCOUNT $RNCRBSARRAY $RBSCELLARRAY`

NODETYPE=W10B # Regarding to WRAN TERE 10.2, coverage relation section

if [ "$RNCNODETYPE" = "$NODETYPE" ]
then
  NUMOFCOVREL=3
else
  NUMOFCOVREL=1
fi

while [ "$COUNT" -le "$TOTALCELLS" ]
do

  NUMOFCELL=`getNumOfCell $RNCCOUNT $RBSCOUNT $RNCRBSARRAY $RBSCELLARRAY`
  CELLSTOP=`expr $NUMOFCELL + 1`


  if [ "$CELLCOUNT" -eq "$CELLSTOP" ]
  then
    CELLCOUNT=1
    RBSCOUNT=`expr $RBSCOUNT + 1`
  fi

  SOURCEUTRANCELLID=`cell_name $RNCCOUNT $RBSCOUNT $CELLCOUNT`

  COVCOUNT=1

  while [ "$COVCOUNT" -le "$NUMOFCOVREL" ]
  do

    TARNUMOFCELL=`getNumOfCell $RNCCOUNT $TARRBSCOUNT $RNCRBSARRAY $RBSCELLARRAY`
    TARCELLSTOP=`expr $TARNUMOFCELL + 1`

    if [ "$TARCELLCOUNT" -eq "$TARCELLSTOP" ]
    then
      TARCELLCOUNT=1
      TARRBSCOUNT=`expr $TARRBSCOUNT + 1`
    fi

    if [ "$TARRBSCOUNT" -gt "$NUMOFRBS" ]
    then 
       TARRBSCOUNT=1 ; 
       TARNUMOFCELL=`getNumOfCell $RNCCOUNT $TARRBSCOUNT $RNCRBSARRAY $RBSCELLARRAY`
       TARCELLSTOP=`expr $TARNUMOFCELL + 1`
    fi 

    TARGETUTRANCELLREF=`cell_name $RNCCOUNT $TARRBSCOUNT $TARCELLCOUNT`

    if [ "$SOURCEUTRANCELLID" = "$TARGETUTRANCELLREF" ] # added in v3
    then
     TARCELLCOUNT=`expr $TARCELLCOUNT + 1`
     continue
    fi

    #echo "Cell-"$COUNT" CoverageRelation-"$COVCOUNT" "$SOURCEUTRANCELLID" -> "$TARGETUTRANCELLREF

    echo 'CREATE' >> $MOSCRIPT
    echo '(' >> $MOSCRIPT
    echo '  parent "ManagedElement=1,RncFunction=1,UtranCell='$SOURCEUTRANCELLID'"' >> $MOSCRIPT
    echo " identity "$COVCOUNT >> $MOSCRIPT
    echo ' moType CoverageRelation' >> $MOSCRIPT
    echo ' exception none' >> $MOSCRIPT
    echo ' nrOfAttributes 1' >> $MOSCRIPT
    echo ' utranCellRef Ref "ManagedElement=1,RncFunction=1,UtranCell='$TARGETUTRANCELLREF'"' >> $MOSCRIPT
    echo ')' >> $MOSCRIPT


    TARCELLCOUNT=`expr $TARCELLCOUNT + 1`
    COVCOUNT=`expr $COVCOUNT + 1`
  done

  CELLCOUNT=`expr $CELLCOUNT + 1`
  COUNT=`expr $COUNT + 1`
done



echo "//.....$0:$RNCNAME MAKING MO SCRIPT ended at "`date` >> $MOSCRIPT
echo "//" >> $MOSCRIPT

cat $PWD/$MOSCRIPT
rm $PWD/$MOSCRIPT

fi # END FOR UTRANCELLS_COVERAGE_RELATION IF/ELSE

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
echo 'kertayle:file="'$PWD'/'$MOSCRIPT'",commit_freq=operation;' >> $MMLSCRIPT

$NETSIMDIR/$NETSIMVERSION/netsim_pipe < $MMLSCRIPT

rm $PWD/$MOSCRIPT
rm $PWD/$MMLSCRIPT

echo "...$0:$RNCNAME script ended at "`date`
echo ""
