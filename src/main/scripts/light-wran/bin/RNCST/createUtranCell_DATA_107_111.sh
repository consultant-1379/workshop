#!/bin/sh

# Created by  : Fatih ONUR
# Created in  : 2010.12.10
##
### VERSION HISTORY
##################################################
# Ver1        : Created for WRAN 12.0 sims
# Purpose     : 
# Description : 
# Date        : 10 08 2011
# Who         : Fatih ONUR
##################################################
# Ver2        : Created for WRAN 13A sims
# Purpose     :
# Description : Cell and LA updated
# Date        : 22 08 2012
# Who         : Reshma
##################################################



if [ "$#" -ne 2 ]
then
cat<<HELP

Usage: $0 <start_rnc_num> <end_rnc_num>

Example: $0 1 1

DESCRPTN: Creates UtranCell attributes report for WRAN to GRAN IRATHOM

HELP
 exit 1
fi

################################
# CONFIGURATION VARIABLES
################################

# RNC Distribution
# [ TYPE=1, NUMOFRC=52, NUMOFRBS=75] ; [..] ; [..] ; [..]
#RNCRBSARRAY="1,52,75;2,25,65;3,5,130;4,1,260;1,1,75"
#RNCRBSARRAY="1,53,75;"\ ->>   1-53
#"2,41,65;"\             ->>  54-94
#"3,9,130;"\             ->>  95-103
#"4,1,260;"\             ->> 104-104
#"5,1,340;"\             ->> 105-105
#"6,2,421;"\             ->> 106-107
#"5,2,340;"\             ->> 108-109 
#"4,2,260;"              ->> 110-111


RNCRBSARRAY="1,53,75;"\
"2,41,65;"\
"3,9,146;"\
"4,1,260;"\
"5,1,340;"\
"6,2,421;"\
"5,2,340;"\
"4,2,260;"


# RBS CELL Distribution
# TYPE1[ TOTALNUMOFCELLS,NUMOFRBS-CELLNUM,NUMOFRBS-CELLNUM,...] ; TYPE2[..] ; TYPE3[..] ; TYPE4[..]

RBSCELLARRAY="320,8-1,37-3,25-6,3-9,2-12;"\
"245,5-1,40-3,20-6,0-9,0-12;"\
"725,5-1,74-3,45-6,12-9,10-12;"\
"1450,10-1,110-3,80-6,30-9,30-12;"\
"2301,6-1,110-3,80-6,81-9,63-12;"\
"3021,21-1,100-3,100-6,100-9,100-12;"


################################
# FUNCTIONS
################################

#
# calculates  group
#   eg. COUNT=5 NUMOFELM=3; GROUP-1= 1,2,3  GROUP-2= 4,5,6... so 5 is under group-2
#
getGroup() # COUNT NUMOFELM
{
COUNT=$1
NUMOFELM=$2

MOD=`expr $COUNT % $NUMOFELM`
DIV=`expr $COUNT / $NUMOFELM`

if [ "$MOD" -eq 0 ]
then
  GROUP=$DIV
else
  GROUP=`expr $DIV + 1`
fi

echo $GROUP
}
####GetLASTART############################
getLAStart() # RNCCOUNT SHARE RNCRBSARRAY RBSCELLARRAY
{
RNCCOUNT=$1
SHARE=$2
RNCRBSARRAY=$3
RBSCELLARRAY=$4

NUMOFLAS=0
TOTALNUMOFLAS=0

COUNT=1
while [ "$COUNT" -le $RNCCOUNT ]
do
  NUMOFCELLS=`getTotalCells $COUNT $RNCRBSARRAY $RBSCELLARRAY`
  #echo "NUMOFCELLS="$NUMOFCELLS
  NUMOFLAS=`getGroup $NUMOFCELLS $SHARE`
  #echo "NUMOFLAS="$NUMOFLAS
  TOTALNUMOFLAS=`expr $TOTALNUMOFLAS + $NUMOFLAS`

  COUNT=`expr $COUNT + 1`
done

echo $(($TOTALNUMOFLAS + 1 - $NUMOFLAS))

}


#GETLA###############

getLA() # CELLCOUNT SHARE LASTART TOTALCELLS RNCCOUNT
{
CELLCOUNT=$1
SHARE=$2
LASTART=$3
TOTALCELLS=$4
RNCCOUNT=$5

COUNT=`expr $CELLCOUNT - \( $TOTALCELLS \* \( $RNCCOUNT - 1 \) \)`

INC=`getGroup $COUNT $SHARE`
LACOUNT=`expr $LASTART + $INC - 1`
echo $LACOUNT

}


#
## get total cumulative num of cells up to specified cell count and rnc
#
getCumulativeTotalCells() # RNCCOUNT $COUNT RNCRBSARRAY RBSCELLARRAY
{
RNCCOUNT=$1
COUNT=$2
RNCRBSARRAY=$3
RBSCELLARRAY=$4

NUMOFRNC=0
CUM=0
IFS=";"

for x in $RNCRBSARRAY
do
  NUMOFRNC=`expr $NUMOFRNC + $(echo $x | awk -F"," '{print $2}')`
  #echo "NUMOFRNC="$NUMOFRNC

  TYPE=$(echo $x | awk -F"," '{print $1}')
  TOTALCELLS=`echo $RBSCELLARRAY  | awk -F" " '{print $'\$TYPE'}' | awk -F"," '{print $1}'`
  NUMOFRBS=`echo $x | awk -F"," '{print $3}'`
  CURRENT_NUMOFRNC=$(echo $x | awk -F"," '{print $2}')
  #echo "CURRENT_NUMOFRNC="$CURRENT_NUMOFRNC

  if [ "$RNCCOUNT" -le "$NUMOFRNC" ]
  then

    PRE_NUMOFRNC=`expr $NUMOFRNC - $(echo $x | awk -F"," '{print $2}')`
    DIFF=`expr $RNCCOUNT - $PRE_NUMOFRNC`
    CUM=`expr $CUM + $DIFF \* $TOTALCELLS`
    CUM=`expr $CUM - \( $TOTALCELLS - $COUNT \)`

    #echo "PRE_NUMOFRNC="$PRE_NUMOFRNC
    #echo "DIFF="$DIFF
    #echo "RNCCOUNT="$RNCCOUNT
    #echo "NUMOFRBS="$NUMOFRBS
    #echo "NUMOFRNC="$NUMOFRNC
    #echo "TYPE="$TYPE
    #echo "TOTALCELLS="$TOTALCELLS
    echo $CUM
    break
  else
    CUM=`expr $CUM + $CURRENT_NUMOFRNC \* $TOTALCELLS`
  fi

done;
}

#
# get total num of cell per each RBS
#
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


# Add leading zeros
zero() { # number, length
    # Need to remove leading 0, might cause the value to be 
    # interpreted as octal
    case "$1" in
	0) 
	    N="$1"
	    ;;
	0*)
	    N=`echo "$1"| cut -c2-`
	    ;;
	*) 
	    N="$1"
	    ;;
    esac
    case "$2" in
	2) 
         printf "%.2d" "$N"
	 ;;
	3) 
         printf "%.3d" "$N"
	 ;;
	*) 
         printf "%d" "$N"
	 ;;
    esac
}

rbs_name() # rncnumber rbsnumber
{
    echo "`rnc_name $1`RBS`zero $2 2`"
}
rxi_name() # rncnumber rxinumber
{
    echo "`rnc_name $1`RXI`zero $2 2`"
}
rnc_name() # rncnumber
{
    echo "RNC`zero $1 2`"
}
 
cell_name() # rncnumber rbsnumber cellnumber
{
    case  "$CELLNAME" in
	gsm) 
	   echo "`zero $1 2``zero $2 3`_$3"
	   ;;

	*)
           echo "`rnc_name $1`-$2-$3"
	   ;;
    esac
}

#
## get total numb of cells for defined num of RBS
#
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



################################
# MAIN
################################

echo "...script started running at "`date`
echo ""

#########################################
# CREATE REPORT FOR IRATHOM
#########################################

echo ""
echo "CREATING A REPORT FOR IRATHOM (supported by qfatonu)"
echo ""

RNCSTART=$1
RNCEND=$2
RCOUNT=$RNCSTART

while [ "$RCOUNT" -le "$RNCEND" ]
do

RNC=$RCOUNT

if [ "$RNC" -le 9 ]
then
  RNCNAME="RNC0"$RNC
  RNCCOUNT="0"$RNC
else
  RNCNAME="RNC"$RNC
  RNCCOUNT=$RNC
fi



################################
# ENVIRONMENT VALUES
################################

COUNT=1
RBSCOUNT=1
CELLCOUNT=1

TOTALCELLS=`getTotalCells $RNCCOUNT $RNCRBSARRAY $RBSCELLARRAY`

# Num of cell has sharing same LA/RA
SHARE=100

##

START_CUMTOTALCELLS=`getCumulativeTotalCells $RNCCOUNT 1 $RNCRBSARRAY $RBSCELLARRAY`

CID=$START_CUMTOTALCELLS

echo "###################################"
echo "# "$RNCNAME
echo "###################################"

while [ "$COUNT" -le "$TOTALCELLS" ]
do

  ########################
  # LA, RA, SA
  ########################
  #LA=`getGroup $(getCumulativeTotalCells $RNCCOUNT $COUNT $RNCRBSARRAY $RBSCELLARRAY) $SHARE`
  LASTART=`getLAStart $RNCCOUNT $SHARE $RNCRBSARRAY $RBSCELLARRAY`
  LA=`getLA $(getCumulativeTotalCells $RNCCOUNT $COUNT $RNCRBSARRAY $RBSCELLARRAY) $SHARE $LASTART $TOTALCELLS $RNCCOUNT`

  RA=$LA
  SA=$CID

  NUMOFCELL=`getNumOfCell $RNCCOUNT $RBSCOUNT $RNCRBSARRAY $RBSCELLARRAY`
  CELLSTOP=`expr $NUMOFCELL + 1`

  if [ "$CELLCOUNT" -eq "$CELLSTOP" ]
  then
    CELLCOUNT=1
    RBSCOUNT=`expr $RBSCOUNT + 1`
  fi

  UTRANCELLID=`cell_name $RNCCOUNT $RBSCOUNT $CELLCOUNT`
  

  #URAREF="ManagedElement=1,RncFunction=1,Ura="$URAID
  UARFCNDL=`expr \( \( $RNCCOUNT \* 1 \) + 0 \) % 16384`
  PRIMSCRCODE=`expr $COUNT % 512`
  PRIMARYCPICHPOWER=300
  QRXLEVMIN=-115
  QQUALMIN=-24
  SRATSEARCH=4
  MAXIMUMTRANSMISSIONPOWER=398

  USEDFREQTHRESH2DRSCP=-100
  USEDFREQTHRESH2DECNO=-12
  SRATSEARCH=4

  ###################################################
  #
  # According to your need modify output from below
  # START: OUTPUT
  ###################################################

  #echo "RNCID:"$RNCCOUNT" CI:"$CID" USERLABEL:"$UTRANCELLID" FDDARFCN:"$UARFCNDL" SCRCODE:"$PRIMSCRCODE" PRIMARYCPICHPOWER:"$PRIMARYCPICHPOWER
  #echo -n "  QQUALMIN:"$QQUALMIN" LAC:"$LA" QRXLEVMIN:"$QRXLEVMIN" USEDFREQTHRESH2DECNO:"$USEDFREQTHRESH2DECNO
  #echo " USEDFREQTHRESH2DRSCP:"$USEDFREQTHRESH2DRSCP" SRATSEARCH:"$SRATSEARCH
  #echo ""

  echo "CID=$CID;UTRANCELLID=$UTRANCELLID;RNCCOUNT=$RNCCOUNT;RBSCOUNT=$RBSCOUNT;CELLCOUNT=$CELLCOUNT"
  

  # END: OUTPUT
  ######################################################


  CID=`expr $CID + 1`
  
  # For testing. To quit at required amount
  #if [ "$COUNT" -eq 13 ]
  #then
  #  break
  #  exit 1
  #fi

  CELLCOUNT=`expr $CELLCOUNT + 1`
  COUNT=`expr $COUNT + 1`
done

  RCOUNT=`expr $RCOUNT + 1`
done


echo "...script ended at "`date`
echo ""
