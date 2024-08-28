#!/bin/sh -xv

# Created by  : unknown
# Created in  : unknown
##
### VERSION HISTORY
# Ver1        : Moddified for WRAN TERE R6.2
##################################################
# Ver2        : Moddified for WRAN TERE O.11.0
# Purpose     :
# Description :
# Date        : 12 08 2010
# Who         : Fatih ONUR
##################################################
# Ver3        : Moddified for WRAN TERE O.11.2
# Purpose     : Reduce num of carrier to 4
# Description :
# Date        : 27 02 2011
# Who         : Fatih ONUR
##################################################
# Ver4        : Moddified for WRAN TERE O.12.0
# Purpose     : 1200,1202,1210 scripts combined into this script
# Description :
# Date        : 2011.08.16
# Who         : Fatih ONUR
##################################################
# Ver4        : Moddified for WRAN TERE 13A
# Purpose     : Run the mml script once for all the RBS in a simualtion.
# Description :
# Date        : 2012.08.23
# Who         : Fatih ONUR
##################################################
# Ver4        : Moddified for WRAN TERE 13B
# Purpose     : Run the mml script once for all the RBS in a simualtion.
# Description :
# Date        : 2013.01.28
# Who         : RESHMA
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
RNCIDCOUNT=$3

. ../../dat/$ENV
. ../utilityFunctions.sh

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

#echo "//...$0:$SIMNAME script started running at "`date`
#echo "//"


PWD=`pwd`
NOW=`date +"%Y_%m_%d_%T:%N"`

MOSCRIPT=$0:${NOW}:$SIMNAME
MMLSCRIPT=$0:${NOW}:$SIMNAME".mml"

SCRIPTNAME=`basename "$0"`
DELETE_ALL_MO_SCRIPTS="DELETE_ALL_MO_SCRIPTS_${SIMNAME}_${SCRIPTNAME}"

if [ -f $PWD/$MOSCRIPT ]
then
  rm -r  $PWD/$MOSCRIPT
  echo "old "$PWD/$MOSCRIPT" removed"
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
      echo "$RNCNAME$RBSNAME${RBSCOUNT}; NUMOFCELL=$NUMOFCELL; NUMOFSECTOR=$NUMOFSECTOR; NUMOFCARRIER=$NUMOFCARRIER;"
    elif [ "$COMBINEDCELLCOUNT" -le "$TOTALCOMBINEDCELLS" ]   
    then
      NUMOFSECTOR=3
      NUMOFCARRIER=1
      echo "$RNCNAME$RBSNAME${RBSCOUNT}; NUMOFCELL=$NUMOFCELL; NUMOFSECTOR=$NUMOFSECTOR; NUMOFCARRIER=$NUMOFCARRIER;"
    fi

    #echo "$RNCNAME$RBSNAME${RBSCOUNT}; NUMOFCELL=$NUMOFCELL; NUMOFSECTOR=$NUMOFSECTOR; NUMOFCARRIER=$NUMOFCARRIER; CELLCOUNT=$CELLCOUNT" 
 
    XCOUNT=1 
  while [ "$XCOUNT" -le "$NUMOFSECTOR" ]
  do

    YCOUNT=1
    while [ "$YCOUNT" -le "$NUMOFCARRIER" ]
    do
      #################################
      # create Carrier MO
      #################################

      #echo "    >> ManagedElement=1,NodeBFunction=1,Sector=$XCOUNT,Carrier=$YCOUNT"

      echo 'DELETE' >> $MOSCRIPT$MOFILEEXTENSION
      echo '(' >> $MOSCRIPT$MOFILEEXTENSION
      echo "  mo \"ManagedElement=1,NodeBFunction=1,Sector=$XCOUNT,Carrier=$YCOUNT\"" >> $MOSCRIPT$MOFILEEXTENSION
      echo ')' >> $MOSCRIPT$MOFILEEXTENSION

      #################################
      # set RbsLocalCell MO
      #################################


      YCOUNT=`expr $YCOUNT + 1`
    done
   
    echo 'DELETE' >> $MOSCRIPT$MOFILEEXTENSION
    echo '(' >> $MOSCRIPT$MOFILEEXTENSION
    echo "  mo \"ManagedElement=1,NodeBFunction=1,Sector=$XCOUNT\"" >> $MOSCRIPT$MOFILEEXTENSION
    echo ')' >> $MOSCRIPT$MOFILEEXTENSION

 
    
	XCOUNT=`expr $XCOUNT + 1`
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
  kertayle:file="$PWD/$MOSCRIPT$MOFILEEXTENSION";

MMLSCT


  #echo "rm $PWD/$MOSCRIPT$MOFILEEXTENSION " >> $DELETE_ALL_MO_SCRIPTS # Script to clean up all the generated MO scripts


  if [ "$NUMOFCELL" -eq 6 ]
  then
    SIXCELLRBSCOUNT=`expr $SIXCELLRBSCOUNT + 1`
  fi

  COUNT=`expr $COUNT + 1`
  
  MOFILECOUNT=`expr $MOFILECOUNT + 1`
done

