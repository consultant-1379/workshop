#!/bin/sh

# Created by  : unknown
# Created in  : unknown
##
### VERSION HISTORY
#############################################################################################################################################
# Ver1        : Moddified for TERE 10.0
# Purpose     : 
# Description : Creates Utran relation according to TERE 10.0 
#             : ((109x3x2 + 78x6x5)sameRBS,sameRNC,sameNetwork-IntraRelation, 18x795)diffRBS,sameRNC,sameNetwrok-IntraRelation, 
#	      :   (6x795)diffRBS,diffRNC,sameNetwork-InterRelation, (4x795)diffRBS,diffRNC,diffNetwork-ExternalRelation)x32RNC(RNC01-RNC32);
#	      :   (18x795)diffRBS,sameRNC,sameNetwrok-IntraRelation, (6x795)diffRBS,diffRNC,sameNetwork-InterRelation, 
#	      :   (4x795)diffRBS,diffRNC,diffNetwork-ExternalRelation)x32RNC(RNC01-RNC32);
# Date        : 01 09 2009
# Who         : Fatih ONUR
#############################################################################################################################################
# Ver2        : Moddified for TERE 10.2
# Purpose     : 
# Description : 
# Date        : 10 01 2010
# Who         : Fatih ONUR
#############################################################################################################################################
# Ver3        : Created for WRAN deployment o.10.2.4, req id:3645
# Purpose     : To recreate all Utran Relations except intra relations within same RBS
# Description :
# Date        : 29.05.2010
# Who         : Fatih ONUR
#############################################################################################################################################
# Ver4        : Created for WRAN deployment O.10.3, req id:2598
# Purpose     : Modify Inter and External relations according to TERE.  
# Description : Inter Relations redesigned completely from the beginning to make them comply with bi-directional relations. 
#		External Relations redesigned completely from the beginning to distribute relations among to new ExternalUtranCells
# Date        : 05.07.2010
# Who         : Fatih ONUR
#############################################################################################################################################
# Ver5        : Created for WRAN deployment O.10.3
# Purpose     : Fixing IurLink Error
# Description : TARGETRNCCOUNT variable modified due to wrong switch value from current IurLink to next level IurLink.
# Date        : 14.07.2010
# Who         : Fatih ONUR
#############################################################################################################################################
# Ver6        : Created for WRAN deployment O.10.3
# Purpose     : Fixing Relation types
# Description : nodeRelationType and frequencyRelationType are set according to relation type
# Date        : 19.07.2010
# Who         : Fatih ONUR
#############################################################################################################################################
# Ver7        : Created for WRAN deployment O.10.3
# Purpose     : WCC modification
# Description : maximumTransmissionPower attribute of UtranCell is set to 398
# Date        : 24.07.2010
# Who         : Fatih ONUR
#############################################################################################################################################
# Ver8        : Created for WRAN TERE O.11.0 and reqId:5171
# Purpose     : 
# Description : Majaority of InterRelations are distribueted 6cells and above RBS
# Date        : 09.08.2010
# Who         : Fatih ONUR
############################################################################################################################################
# Ver9        : Moddified for TERE 0-11.2 and reqId:6201
# Purpose     : WRAN to WRAN IRATHOM feature added to sims
# Description : WRAN_2 Network ExternalUtranCells Modified
# Date        : 21 03 2011
# Who         : Fatih ONUR
#############################################################################################################################################
# Ver10       : Moddified for TERE 0-11.2 and reqId:6201
# Purpose     : Wrong setup on intra relations for other RBS FIXED
# Description : ENV FILE MUST SET NUMOFRBS=154, Otherwise there might be another error
# Date        : 24 03 2011
# Who         : Fatih ONUR
#############################################################################################################################################
# Ver10       : Moddified for TERE O13A
# Purpose     : Update Relations
# Description : 
# Date        : 06 Sep 2012
# Who         : Fatih ONUR
############################################################################################################################################



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
# Functions
################################

################################
# MAIN
################################


SIMNAME=$1
ENV=$2
RNCID=$3

if [ "$3" -le 9 ]
then
  RNCNAME="RNC0"$3
  RNCCOUNT="0"$3
else
  RNCNAME="RNC"$3
  RNCCOUNT=$3
fi

if [ "$RNCCOUNT" -ge 107 ]
then
  echo "//..Do not execute this script for RNC107 to RNC111"
  exit 1
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

# *** Note ***
# Assuming UTRANDATA input file exist
if [ ! -f "$PWD/$UTRANDATAFILE" ]
then
  echo "//File: "$PWD/$UTRANDATAFILE" does not exist"
  echo "//Check the file and run again"
  exit
fi



#########################################
# 
# Make MO Script
#
#########################################

##echo ""
##echo "MAKING MO SCRIPT"
##echo ""

######################################################################################################
# START OF INTRA RELATIONS
######################################################################################################

######################################################################################################
# END OF INTRA RELATIONS
######################################################################################################

######################################################################################################
# START OF INTER RELATIONS
######################################################################################################

######################################################################################################
# END OF INTER RELATIONS
######################################################################################################


######################################################################################################
# START OF EXTERNAL RELATIONS
######################################################################################################

moFileName=`printf "%s%02d%s" "rnc" "$RNCID" ".mo"`

echo "//::moFileName=$moFileName"

cat $PWD/JAVAFILES/$moFileName
exit

