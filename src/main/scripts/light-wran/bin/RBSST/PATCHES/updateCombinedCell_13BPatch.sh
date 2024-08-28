#!/bin/sh

# Created by  : unknown
# Created in  : unknown
##
### VERSION HISTORY
# Ver1        : Moddified for WRAN TERE R6.2
##################################################
# Ver2        : Created for updating Combined Cells
# Purpose     :
# Description :
# Date        : 25 04 2013
# Who         : RESHMA
###################################################


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
RNCRBSARRAY="1,53,69;"\
"2,41,66;"\
"3,9,144;"\
"4,1,186;"\
"5,2,344;"\
"6,2,326;"\
"7,1,436;"

#### RBS CELL Distribution
# TYPE1[ TOTALNUMOFCELLS,NUMOFRBS-CELLNUM,NUMOFRBS-CELLNUM,...] ; TYPE2[..] ; TYPE3[..] ; TYPE4[..]
RBSCELLARRAY="300,9-1,30-3,25-6,3-9,2-12;"\
"251,5-1,40-3,21-6,0-9,0-12;"\
"723,3-1,74-3,45-6,12-9,10-12;"\
"1200,6-1,54-3,65-6,30-9,31-12;"\
"2305,10-1,110-3,80-6,81-9,63-12;"\
"2521,16-1,60-3,70-6,85-9,95-12;"\
"4551,18-1,15-3,13-6,90-9,300-12;"\


#FUNCTIONS
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

getTotalCells() # RNCCOUNT RNCRBSARRAY RBSCELLARRAY 
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
    #echo "NUMOFRNC="$NUMOFRNC
    #echo "TYPE="$TYPE
    #echo "TOTALCELLS="$TOTALCELLS
    echo $TOTALCELLS
    break
  fi
done;
}

getNumOfRBSofCellType() # RNCCOUNT CELLTYPE RNCRBSARRAY RBSCELLARRAY
{
RNCCOUNT=$1
CELLTYPE=$2
RNCRBSARRAY=$3
RBSCELLARRAY=$4

case "$CELLTYPE"
in
  1) CELLTYPE=2;; #POSITION in the RBSCELLARRAY
  3) CELLTYPE=3;;
  6) CELLTYPE=4;;
  9) CELLTYPE=5;;
  12) CELLTYPE=6;;
esac


NUMOFRNC=0
IFS=";"
for x in $RNCRBSARRAY
do
  NUMOFRNC=`expr $NUMOFRNC + $(echo $x | awk -F"," '{print $2}')`

  if [ "$RNCCOUNT" -le "$NUMOFRNC" ]
  then
    TYPE=$(echo $x | awk -F"," '{print $1}')
    NUMOFRBS_FOR_CELLTYPE=`echo $RBSCELLARRAY  | awk -F" " '{print $'\$TYPE'}' | awk -F"," '{print $'\$CELLTYPE'}' | awk -F"-" '{print $1}'`

    echo $NUMOFRBS_FOR_CELLTYPE
    break
  fi
done;
}

getNumOfCell() # RNCCOUNT RBSCOUNT RNCRBSARRAY RBSCELLARRAY
{
RNCCOUNT=$1
RBSCOUNT=$2
RNCRBSARRAY=$3
RBSCELLARRAY=$4

NUMOFRNC=0
IFS=";"

for x in $RNCRBSARRAY
do
  NUMOFRNC=`expr $NUMOFRNC + $(echo $x | awk -F"," '{print $2}')`

  if [ "$RNCCOUNT" -le "$NUMOFRNC" ]
  then
    TYPE=$(echo $x | awk -F"," '{print $1}')
    RBSCELLARRAYATR=`echo $RBSCELLARRAY  | awk -F" " '{print $'\$TYPE'}'`
    #echo "RBSCELLARRAYATR="$RBSCELLARRAYATR

    IFS=","
    bar=( $RBSCELLARRAYATR )
    TOTALSUBNUMOFRBS=0
    #echo "bar="${bar[0]}

    for (( i=1; i<${#bar[@]}; i++ )); do
      SUBNUMOFRBS=`echo ${bar[$i]} | awk -F "-" '{print $1}'`
      TOTALSUBNUMOFRBS=`expr $SUBNUMOFRBS + $TOTALSUBNUMOFRBS`

      #echo "["$i"] "${bar[$i]};
      #echo "SUBNUMOFRBS="$SUBNUMOFRBS

      if [ "$RBSCOUNT" -le "$TOTALSUBNUMOFRBS" ]
      then
        NUMOFCELL=`echo ${bar[$i]} | awk -F "-" '{print $2}'`
        #echo "NUMOFCELL="$NUMOFCELL
        break
      fi
    done;
    #echo "TOTALSUBNUMOFRBS="$TOTALSUBNUMOFRBS

    #echo "RNCCOUNT="$RNCCOUNT
    #echo "RBSCOUNT="$RBSCOUNT
    #echo "NUMOFCELL="$NUMOFCELL
    echo $NUMOFCELL
    #echo "TYPE="$TYPE
    break
  fi
done;
}




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
DEL1="DELETE_ALL_MO_SCRIPTS"
DELETE_ALL_MO_SCRIPTS="DELETE_ALL_MO_SCRIPTS_${SIMNAME}_${SCRIPTNAME}"

if [ -f $PWD/$DEL1 ]
then
  rm -r  $PWD/$DEL1
  echo "//..old "$PWD/$DEL1" removed"
fi



#########################################
# 
# Make MO Script
#
#########################################

#echo ""
#echo "MAKING MO SCRIPT"
#echo ""


#    echo "************************************"
#    echo "* RNCCOUNT="$RNCCOUNT
#    echo "************************************"

NUMOFRBS=`getNumOfRBS $RNCCOUNT $RNCRBSARRAY $RBSCELLARRAY`
TOTALCELLS=`getTotalCells $RNCCOUNT $RNCRBSARRAY $RBSCELLARRAY`

##########################
#Percentage of Combined Cells
##########################

PERC_COMBINED_CELLS=5

TOTALCOMBINEDCELLS=`expr \( $TOTALCELLS \* $PERC_COMBINED_CELLS \) / 100`

###########################
#Percentage of Combined Cells with 2COMBINEDCELLS_TWO_SECTOR Sectors
###########################

PERC_CELLS_TWO_SECTOR=50
COMBINEDCELLS_TWO_SECTOR=`expr \( $TOTALCOMBINEDCELLS \* $PERC_CELLS_TWO_SECTOR \) / 100`

COMBINEDCELLS_THREE_SECTOR=`expr $TOTALCOMBINEDCELLS - $COMBINEDCELLS_TWO_SECTOR`

#echo "TOTALCOMBINEDCELLS=$TOTALCOMBINEDCELLS"
#echo "COMBINEDCELLS_TWO_SECTOR=$COMBINEDCELLS_TWO_SECTOR"
#echo "COMBINEDCELLS_THREE_SECTOR=$COMBINEDCELLS_THREE_SECTOR"

###########################
# Percantage of RBS with 3 sectors and 2 carriers for 6 cells RBS only
###########################
GROUP_A_PERC_A=50
CELLTYPE=6

NUMOFRBS_FOR_CELLTYPE=`getNumOfRBSofCellType $RNCCOUNT $CELLTYPE $RNCRBSARRAY $RBSCELLARRAY`

NUMOF_RBS_THREE_SEC_PER_RNC=`expr \( $NUMOFRBS_FOR_CELLTYPE \* $GROUP_A_PERC_A \) / 100`

COUNT=1
RBSCOUNT=1
SIXCELLRBSCOUNT=1
MOFILECOUNT=1
COMBINEDCELLCOUNT=1

while [ "$COUNT" -le "$NUMOFRBS" ]
do

  if [ "$COUNT" -le 9 ]
   then
    RBSNAME=RBS0
   else
    RBSNAME=RBS
  fi

  CELLCOUNT=1
  NUMOFCELL=`getNumOfCell $RNCCOUNT $RBSCOUNT $RNCRBSARRAY $RBSCELLARRAY`

  MOFILEEXTENSION="__"$MOFILECOUNT".mo"  
  
  while [ "$CELLCOUNT" -le "$NUMOFCELL" ]
  do

    case "$NUMOFCELL"
    in
      1) NUMOFSECTOR=1; NUMOFCARRIER=1;;
      3) NUMOFSECTOR=1; NUMOFCARRIER=3;;
      6) NUMOFSECTOR=3; NUMOFCARRIER=2;;
      9) NUMOFSECTOR=3; NUMOFCARRIER=3;;
      12) NUMOFSECTOR=6; NUMOFCARRIER=2;;
    esac

    if [ "$SIXCELLRBSCOUNT" -gt $NUMOF_RBS_THREE_SEC_PER_RNC ] && [ "$SIXCELLRBSCOUNT" -le $NUMOFRBS_FOR_CELLTYPE ]
    then
      NUMOFSECTOR=6; NUMOFCARRIER=1; 
    fi
 
    if [ "$COMBINEDCELLCOUNT" -le "$COMBINEDCELLS_TWO_SECTOR" ]
    then
      NUMOFSECTOR=2
      NUMOFCARRIER=1
      #echo "$RNCNAME$RBSNAME${RBSCOUNT}; NUMOFCELL=$NUMOFCELL; NUMOFSECTOR=$NUMOFSECTOR; NUMOFCARRIER=$NUMOFCARRIER;"
    elif [ "$COMBINEDCELLCOUNT" -le "$TOTALCOMBINEDCELLS" ]   
    then
      NUMOFSECTOR=3
      NUMOFCARRIER=1
      #echo "$RNCNAME$RBSNAME${RBSCOUNT}; NUMOFCELL=$NUMOFCELL; NUMOFSECTOR=$NUMOFSECTOR; NUMOFCARRIER=$NUMOFCARRIER;"
    fi

    #echo "$RNCNAME$RBSNAME${RBSCOUNT}; NUMOFCELL=$NUMOFCELL; NUMOFSECTOR=$NUMOFSECTOR; NUMOFCARRIER=$NUMOFCARRIER; CELLCOUNT=$CELLCOUNT" 
 
    XCOUNT=1 
  while [ "$XCOUNT" -le "$NUMOFSECTOR" ]
  do

    #################################
    # create Sector MO
    #################################
    
    #echo " :: ManagedElement=1,NodeBFunction=1,Sector="$XCOUNT
    
    echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
    echo '(' >> $MOSCRIPT$MOFILEEXTENSION
    echo '  parent "ManagedElement=1,NodeBFunction=1"' >> $MOSCRIPT$MOFILEEXTENSION
    echo '   identity '$XCOUNT >> $MOSCRIPT$MOFILEEXTENSION
    echo '   moType Sector' >> $MOSCRIPT$MOFILEEXTENSION
    echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
    echo '   nrOfAttributes 1' >> $MOSCRIPT$MOFILEEXTENSION
    echo "     sectorAntennasRef Array Ref \"ManagedElement=1,Equipment=1,SectorAntenna=1\"" >> $MOSCRIPT$MOFILEEXTENSION
    echo ')' >> $MOSCRIPT$MOFILEEXTENSION  

    YCOUNT=1
    while [ "$YCOUNT" -le "$NUMOFCARRIER" ]
    do
      #################################
      # create Carrier MO
      #################################

      #echo "    >> ManagedElement=1,NodeBFunction=1,Sector=$XCOUNT,Carrier=$YCOUNT"

      echo 'CREATE' >> $MOSCRIPT$MOFILEEXTENSION
      echo '(' >> $MOSCRIPT$MOFILEEXTENSION
      echo "  parent \"ManagedElement=1,NodeBFunction=1,Sector=$XCOUNT\"" >> $MOSCRIPT$MOFILEEXTENSION
      echo '   identity '$YCOUNT >> $MOSCRIPT$MOFILEEXTENSION
      echo '   moType Carrier' >> $MOSCRIPT$MOFILEEXTENSION
      echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
      echo '   nrOfAttributes 0' >> $MOSCRIPT$MOFILEEXTENSION
      echo ')' >> $MOSCRIPT$MOFILEEXTENSION

      #################################
      # set RbsLocalCell MO
      #################################

      #echo "  $RBSNAME-$CELLCOUNT -> Sector=$XCOUNT , Carrier=$YCOUNT"
      
      if [ "$COMBINEDCELLCOUNT" -gt "$TOTALCOMBINEDCELLS" ]
      then
      echo 'SET' >> $MOSCRIPT$MOFILEEXTENSION
      echo '(' >> $MOSCRIPT$MOFILEEXTENSION
      echo '  mo "ManagedElement=1,NodeBFunction=1,RbsLocalCell='$CELLCOUNT'"' >> $MOSCRIPT$MOFILEEXTENSION
      echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
      echo '   nrOfAttributes 1' >> $MOSCRIPT$MOFILEEXTENSION
      echo "   carrierRef Ref \"ManagedElement=1,NodeBFunction=1,Sector=$XCOUNT,Carrier=$YCOUNT\"" >> $MOSCRIPT$MOFILEEXTENSION
      echo ')' >> $MOSCRIPT$MOFILEEXTENSION
      fi
     
      #CELLCOUNT=`expr $CELLCOUNT + 1`
      YCOUNT=`expr $YCOUNT + 1`
      done

      XCOUNT=`expr $XCOUNT + 1`
    done
    
    if [ "$COMBINEDCELLCOUNT" -le "$COMBINEDCELLS_TWO_SECTOR" ]
    then
      NUMOFSECTOR=2
      echo 'SET' >> $MOSCRIPT$MOFILEEXTENSION
      echo '(' >> $MOSCRIPT$MOFILEEXTENSION
      echo '  mo "ManagedElement=1,NodeBFunction=1,RbsLocalCell='$CELLCOUNT'"' >> $MOSCRIPT$MOFILEEXTENSION
      echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
      echo '   nrOfAttributes 1' >> $MOSCRIPT$MOFILEEXTENSION
      echo "   "carriersRef" Array Ref $NUMOFSECTOR "  >> $MOSCRIPT$MOFILEEXTENSION
      echo '   "ManagedElement=1,NodeBFunction=1,Sector=1,Carrier=1"'  >> $MOSCRIPT$MOFILEEXTENSION
      echo '   "ManagedElement=1,NodeBFunction=1,Sector=2,Carrier=1"'  >> $MOSCRIPT$MOFILEEXTENSION 
      echo ')' >> $MOSCRIPT$MOFILEEXTENSION         
    elif [ "$COMBINEDCELLCOUNT" -le "$TOTALCOMBINEDCELLS" ]
    then
      NUMOFSECTOR=3
      echo 'SET' >> $MOSCRIPT$MOFILEEXTENSION
      echo '(' >> $MOSCRIPT$MOFILEEXTENSION
      echo '  mo "ManagedElement=1,NodeBFunction=1,RbsLocalCell='$CELLCOUNT'"' >> $MOSCRIPT$MOFILEEXTENSION
      echo '   exception none' >> $MOSCRIPT$MOFILEEXTENSION
      echo '   nrOfAttributes 1' >> $MOSCRIPT$MOFILEEXTENSION
      echo "   "carriersRef" Array Ref $NUMOFSECTOR "  >> $MOSCRIPT$MOFILEEXTENSION
      echo '   "ManagedElement=1,NodeBFunction=1,Sector=1,Carrier=1"'  >> $MOSCRIPT$MOFILEEXTENSION
      echo '   "ManagedElement=1,NodeBFunction=1,Sector=2,Carrier=1"'  >> $MOSCRIPT$MOFILEEXTENSION
      echo '   "ManagedElement=1,NodeBFunction=1,Sector=3,Carrier=1"'  >> $MOSCRIPT$MOFILEEXTENSION
      echo ')' >> $MOSCRIPT$MOFILEEXTENSION
    fi

    CELLCOUNT=`expr $CELLCOUNT + 1`
    COMBINEDCELLCOUNT=`expr $COMBINEDCELLCOUNT + 1`

  done
  
  # RBSCOUNT increases after CELLCOUNT reaches to END
  RBSCOUNT=`expr $RBSCOUNT + 1`


 # echo ""
 # echo "MAKING MML SCRIPT"

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
  kertayle:file="$MOSCRIPT$MOFILEEXTENSION";
  #kertayle:file="$PWD/$MOSCRIPT$MOFILEEXTENSION";

MMLSCT


  echo "rm $PWD/$MOSCRIPT$MOFILEEXTENSION " >> $DELETE_ALL_MO_SCRIPTS # Script to clean up all the generated MO scripts


  if [ "$NUMOFCELL" -eq 6 ]
  then
    SIXCELLRBSCOUNT=`expr $SIXCELLRBSCOUNT + 1`
  fi

  COUNT=`expr $COUNT + 1`
  
  MOFILECOUNT=`expr $MOFILECOUNT + 1`
done

################################################
 /netsim/inst/netsim_shell < $MMLSCRIPT

#cat $PWD/$MMLSCRIPT

#############################


rm $PWD/$MMLSCRIPT
. $DELETE_ALL_MO_SCRIPTS
rm $DELETE_ALL_MO_SCRIPTS


echo "...script ended at "`date`
echo ""
