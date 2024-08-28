#!/bin/sh

# Created by  : Fatih ONUR
# Created in  : 18.11.2010
##
### VERSION HISTORY
##############################################
# Ver1        : Created for ST-IRATHOM, WRAN-TERE:11.2 
# Purpose     :
# Description :
# Date        : 18 NOV 2010
# Who         : Fatih ONUR
##############################################

if [ "$#" -ne 3  ]
then
cat<<HELP

####################
# HELP
####################

Usage  : $0 <sim name> <env file> <rnc num>

Example: $0  RNCM125-ST-RNC01 R7-ST-11.0.6-N.env 1

HELP

exit 1
fi


################################
# MAIN
################################


SIMNAME=$1
ENV=$2
RNC=$3

. ../../dat/$ENV
. ../utilityFunctions.sh


if [ "$3" -le 9 ]
then
  RNCNAME=RNC0$RNC
  RNCCOUNT="0"$RNC
else
  RNCNAME=RNC$RNC
  RNCCOUNT=$RNC
fi

#RUN="YE" # YES to enable run | NO to disable run
#EXTGSMCELLS_RELATION=$RUN

if [ "$EXTGSMCELLS_RELATION" == "YES" ]
then

echo "//...$0:$RNCNAME script started running at "`date`
echo "//"

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


#########################################
# 
# Make MO Script
#
#########################################

echo "//...$0:$RNCNAME MAKING MO SCRIPT started running at "`date` >> $MOSCRIPT
echo "//" >> $MOSCRIPT


#echo ""
#echo "MAKING MO SCRIPT"
#echo ""

# Total Numof UtranCell for Each RNC
TOTALCELLS=`getTotalCells $RNCCOUNT $RNCRBSARRAY $RBSCELLARRAY`

# CellId for Each Cell within Utran Network
CIDSTART=`getCumulativeTotalCells $RNCCOUNT 1 $RNCRBSARRAY $RBSCELLARRAY`
CID=$CIDSTART

######################################################################################################
# START OF EXTGSMCELL RELATIONS FOR IRATHOM
######################################################################################################

if [ "$RNCCOUNT" -le 41 ]
then

# Total Numof ExtGsmCell for Each RNC
TARGET_TOTALCELLS=300

# NumOf UtranCell will have relation against ExtGsmCell
#END_COUNT=`expr $TOTALCELLS - 9`
END_COUNT=`expr $TOTALCELLS - 1`

 # IRATHOM cell range ends at 12039
 if [ "$RNCCOUNT" -eq "41" ] 
 then
    END_COUNT=39
 fi

# NumOf ExtGsmCell Relation per each UtranCell
GSMRELATIONNUM=13

COUNT=1
CELLCOUNT=1
RBSCOUNT=1
VAR=1

while [ "$COUNT" -le "$END_COUNT" ]
do

  NUMOFCELL=`getNumOfCell $RNCCOUNT $RBSCOUNT $RNCRBSARRAY $RBSCELLARRAY` # NUMOFCELL for each RBS
  CELLNUM=$NUMOFCELL
  CELLSTOP=`expr $NUMOFCELL + 1`

  if [ "$CELLCOUNT" -eq "$CELLSTOP" ]
  then
    CELLCOUNT=1
    RBSCOUNT=`expr $RBSCOUNT + 1`
  fi

  CREATE_RELATION=YES

  UTRANCELLID=`cell_name $RNCCOUNT $RBSCOUNT $CELLCOUNT`

  ######################################################
  #
  # (1)  Create GsmRelation to ExternalGsmCells 
  #
  ######################################################

  #echo "##############################################"
  #echo "# GSMRELATION: From UtranCell to ExternalGsmCell"
  #echo "##############################################"
  #echo "COUNT="$COUNT



  if [ "$CREATE_RELATION" == "YES" ]
  then

      ######################################################################
      #
      # Visit each TargetCell according to necessary number of relations for the current Cell
      #  NUMOFELMOF_CELLGROUP defines number of relations for each current cell
      #
      #######################################################################
      NUMOFELMOF_CELLGROUP=$GSMRELATIONNUM
      SWITCH_TO_NEW_EXTGSMCELL_ID_FOR_NEW_SIM=4993

      CELLGROUP=`getGroup $COUNT $NUMOFELMOF_CELLGROUP`

      START_EXTGSMIDCOUNT=`expr $NUMOFELMOF_CELLGROUP \* $CELLGROUP - \( $NUMOFELMOF_CELLGROUP - 1 \) + \( $RNCCOUNT - 1 \) \* $TARGET_TOTALCELLS` 
      STOP_EXTGSMIDCOUNT=`expr $START_EXTGSMIDCOUNT + $NUMOFELMOF_CELLGROUP - 1`
      EXTGSMIDCOUNT=$START_EXTGSMIDCOUNT

      START=1
      STOP=$NUMOFELMOF_CELLGROUP

      TARGETCELLCOUNT=$EXTGSMIDCOUNT


      LOC_COUNT=1
      while [ "$LOC_COUNT" -le "$STOP" ]
      do
         UCELLREF='ManagedElement=1,RncFunction=1,ExternalGsmNetwork='$GSMMNC',ExternalGsmCell='$TARGETCELLCOUNT

         # Output of relation for testing(original)
         ## echo -n "TOT-CELL-"$COUNT" LOC-CELL-"$CELLCOUNT" TOT-RELATION-"$VAR": LOC-RELATION-"$LOC_COUNT": "$UTRANCELLID" UCID="$CID
         ## echo "-> EXTGSMCID:"$TARGETCELLCOUNT" (ExtGsmNetwork="$GSMMNC")"

         #IRATHOM only
         # echo -n "$UTRANCELLID UCID=$CID (wran sim=$RNCCOUNT) has gsm relation($LOC_COUNT) to " 
         # echo "-> EXTGSMCID:"$TARGETCELLCOUNT" (ExtGsmNetwork="$GSMMNC") "

         echo 'CREATE' >> $MOSCRIPT
         echo '(' >> $MOSCRIPT
         echo '  parent "ManagedElement=1,RncFunction=1,UtranCell='$UTRANCELLID'"' >> $MOSCRIPT
         echo ' identity '$LOC_COUNT >> $MOSCRIPT
         echo ' moType GsmRelation' >> $MOSCRIPT
         echo ' exception none' >> $MOSCRIPT
         echo ' nrOfAttributes 1' >> $MOSCRIPT
         echo ' externalGsmCellRef Ref '$UCELLREF >> $MOSCRIPT
         echo ')' >> $MOSCRIPT

         VAR=`expr $VAR + 1`
	 LOC_COUNT=`expr $LOC_COUNT + 1`
         TARGETCELLCOUNT=`expr $TARGETCELLCOUNT + 1`
      done


  else
    echo "// DO NOT CREATE ANY GSM-RELATION FOR THIS CELL: "$UTRANCELLID
  fi

  CID=`expr $CID + 1`
  CELLCOUNT=`expr $CELLCOUNT + 1`
  COUNT=`expr $COUNT + 1`

  # For testing. To quit ar required amount
  #if [ "$COUNT" -eq 1112 ]
  #then
  #  break
  #    exit 1
  #fi

done

fi
######################################################################################################
# END OF EXTGSMCELL RELATIONS FOR IRATHOM
######################################################################################################

#exit

######################################################################################################
# START OF EXTGSMCELL RELATIONS FOR OTHER NETWORKS GSMNETWOK: 5, 6, 7
######################################################################################################

if [ "$RNCCOUNT" -ge 42 ] && [ "$RNCCOUNT" -le 109 ] 
then


#echo "EXTGSMCELL RELATIONS FOR OTHER NETWORKS GSMNETWOK: 5, 6, 7"
#echo "-"

  GSMMNC=4
 # NUMOF_GSM_REL=27

  if [ "$RNCCOUNT" -ge 42 ] && [ "$RNCCOUNT" -le 96 ]
  then
    EXTGSMCELL_RANGE=1520
    NW_RANGE=`expr $EXTGSMCELL_RANGE / 1`
    PLUS=`expr $EXTGSMCELL_RANGE - 1`
    INITIAL=20000
    DISCARDED_NUM_OF_RNC=41
    NUMOF_GSM_REL=26

    # Start from RNC40 to 94 see more detail in workingOnWRAN.xml
    NUM_OF_RNC_GROUP=11

    BELONGS_TO_GROUP=`getGroup $(( $RNCCOUNT - $DISCARDED_NUM_OF_RNC )) $NUM_OF_RNC_GROUP`
  fi

  if [ "$RNCCOUNT" -ge 97 ] && [ "$RNCCOUNT" -le 103 ]
  then
    EXTGSMCELL_RANGE=3872
    NW_RANGE=`expr $EXTGSMCELL_RANGE / 1`
    PLUS=`expr $EXTGSMCELL_RANGE - 1`
    INITIAL=27700
    DISCARDED_NUM_OF_RNC=96
    NUMOF_GSM_REL=25


    # Start from RNC97 to 103 see more detail in workingOnWRAN.xml
    NUM_OF_RNC_GROUP=7

    BELONGS_TO_GROUP=`getGroup $(( $RNCCOUNT - $DISCARDED_NUM_OF_RNC )) $NUM_OF_RNC_GROUP`
  fi


  if [ "$RNCCOUNT" -ge 104 ] && [ "$RNCCOUNT" -le 106 ]
  then
    EXTGSMCELL_RANGE=5055
    NW_RANGE=`expr $EXTGSMCELL_RANGE / 1`
    PLUS=`expr $EXTGSMCELL_RANGE - 1`
    INITIAL=32000
    DISCARDED_NUM_OF_RNC=103

    #Start from RNC104 to 106 see more detail in workingOnWRAN.xml
    NUM_OF_RNC_GROUP=3

    BELONGS_TO_GROUP=`getGroup $(( $RNCCOUNT - $DISCARDED_NUM_OF_RNC )) $NUM_OF_RNC_GROUP`
    NUMOF_GSM_REL=25

  fi

  if [ "$RNCCOUNT" -ge 107 ] && [ "$RNCCOUNT" -le 109 ]
  then
    EXTGSMCELL_RANGE=9600
    NW_RANGE=`expr $EXTGSMCELL_RANGE / 1`
    PLUS=`expr $EXTGSMCELL_RANGE - 1`
    INITIAL=38000
    DISCARDED_NUM_OF_RNC=106

    #Start from RNC107 to 109 see more detail in workingOnWRAN.xml
    NUM_OF_RNC_GROUP=3

    BELONGS_TO_GROUP=`getGroup $(( $RNCCOUNT - $DISCARDED_NUM_OF_RNC )) $NUM_OF_RNC_GROUP`
    NUMOF_GSM_REL=25

  fi

   
 
  START_EXTGSMCELL_COUNT=`expr $INITIAL + \( $BELONGS_TO_GROUP \) \* $EXTGSMCELL_RANGE - \( $EXTGSMCELL_RANGE - 1 \)`
  STOP_EXTGSMCELL_COUNT=`expr $START_EXTGSMCELL_COUNT + $PLUS`

  #echo "STOP_EXTGSMCELL_COUNT:$STOP_EXTGSMCELL_COUNT"

  TARGETCELLCOUNT=$START_EXTGSMCELL_COUNT
  END_COUNT=$TOTALCELLS

  COUNT=1
  CELLCOUNT=1
  RBSCOUNT=1
  VAR=1

  while [ "$COUNT" -le "$END_COUNT" ]
  do

    NUMOFCELL=`getNumOfCell $RNCCOUNT $RBSCOUNT $RNCRBSARRAY $RBSCELLARRAY` # NUMOFCELL for each RBS
    CELLNUM=$NUMOFCELL
    CELLSTOP=`expr $NUMOFCELL + 1`

    if [ "$CELLCOUNT" -eq "$CELLSTOP" ]
    then
      CELLCOUNT=1
      RBSCOUNT=`expr $RBSCOUNT + 1`
    fi
  
    UTRANCELLID=`cell_name $RNCCOUNT $RBSCOUNT $CELLCOUNT`


    if [ "$TARGETCELLCOUNT" -ge "$STOP_EXTGSMCELL_COUNT" ]
    then
      TARGETCELLCOUNT=$START_EXTGSMCELL_COUNT
    fi

    #echo "##############################################"
    #echo "# GSMRELATION: From UtranCell to ExternalGsmCell"
    #echo "##############################################"

      SWITCH_TO_NETWORK_C=`expr $START_EXTGSMCELL_COUNT + $NW_RANGE`
      SWITCH_TO_NETWORK_D=`expr $SWITCH_TO_NETWORK_C + $NW_RANGE`
      SWITCH_TO_NETWORK_B=`expr $SWITCH_TO_NETWORK_D + $NW_RANGE`

      START=1
      STOP=$NUMOF_GSM_REL

      LOC_COUNT=$START
      while [ "$LOC_COUNT" -le "$STOP" ]
      do
       

         if [ "$TARGETCELLCOUNT" -gt "$STOP_EXTGSMCELL_COUNT" ]
         then
           TARGETCELLCOUNT=$START_EXTGSMCELL_COUNT
         fi

#        if [ "$TARGETCELLCOUNT" -eq "$SWITCH_TO_NETWORK_C" ]
#        then
#          GSMMNC=2
#        fi

#        if [ "$TARGETCELLCOUNT" -eq "$SWITCH_TO_NETWORK_D" ]
#        then
#          GSMMNC=1
#        fi

#        if [ "$TARGETCELLCOUNT" -eq "$SWITCH_TO_NETWORK_B" ]
#        then
#          GSMMNC=3
#          TARGETCELLCOUNT=$START_EXTGSMCELL_COUNT
#        fi

         EXTGSMCELLREF='ManagedElement=1,RncFunction=1,ExternalGsmNetwork='$GSMMNC',ExternalGsmCell='$TARGETCELLCOUNT

         # Output of relation for testing
         # echo -n "TOT-CELL-"$COUNT" LOC-CELL-"$CELLCOUNT" TOT-RELATION-"$VAR": LOC-RELATION-"$LOC_COUNT": "$UTRANCELLID" UCID="$CID
         # echo "-> EXTGSMCID:"$TARGETCELLCOUNT" (ExtGsmNetwork="$GSMMNC")"

          echo 'CREATE' >> $MOSCRIPT
          echo '(' >> $MOSCRIPT
          echo '  parent "ManagedElement=1,RncFunction=1,UtranCell='$UTRANCELLID'"' >> $MOSCRIPT
          echo ' identity '$LOC_COUNT >> $MOSCRIPT
          echo ' moType GsmRelation' >> $MOSCRIPT
          echo ' exception none' >> $MOSCRIPT
          echo ' nrOfAttributes 1' >> $MOSCRIPT
          echo ' externalGsmCellRef Ref '$EXTGSMCELLREF >> $MOSCRIPT
          echo ')' >> $MOSCRIPT

         VAR=`expr $VAR + 1`
	 LOC_COUNT=`expr $LOC_COUNT + 1`
         TARGETCELLCOUNT=`expr $TARGETCELLCOUNT + 1`
      done

    CID=`expr $CID + 1`
    CELLCOUNT=`expr $CELLCOUNT + 1`
    COUNT=`expr $COUNT + 1`

    # For testing. To quit ar required amount
    #if [ "$COUNT" -eq 12 ]
    #then
    #  break
    #    exit 1
    #fi
  done

fi

######################################################################################################
# END OF EXTGSMCELL RELATIONS FOR OTHER NETWORKS GSMNETWOK: 5, 6, 7
######################################################################################################

echo "//...$0:$RNCNAME MAKING MO SCRIPT ended at "`date` 
echo "//...$0:$RNCNAME MAKING MO SCRIPT ended at "`date` >> $MOSCRIPT
echo "//" >> $MOSCRIPT

cat $PWD/$MOSCRIPT
rm $PWD/$MOSCRIPT

fi # END FOR EXTGSMCELLS_RELATION IF/ELSE

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

echo "...$0:RNCNAME script ended at "`date`
echo ""

