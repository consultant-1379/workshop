#!/bin/sh

# Created by  : Fatih ONUR
# Created in  : 27.01.2012
##
### VERSION HISTORY
# Ver1        : Created for faster sim creation
# Purpose     :
# Description :
# Date        : 27 JAN 2012
# Who         : Fatih ONUR

if [ "$#" -ne 3 ]
then
cat<<HELP

####################
# HELP
####################

Usage  : $0 <env file> <RNCSTART> <RNCEND>

Example: $0 O12-ST-12.0.7-N.env

DESCRP : This will create a new simulation and the NEs as defined  in the env file
HELP

exit 1
fi


################################
# Assign variables
################################

ENV=$1
DATE=`date +%H%M%S`
PWD=`pwd`



##############################
# Check env file exists
##############################

if [ ! -f ../dat/$ENV ]
then
 echo "The configuration file $ENV does not exist."
 exit 1
fi


#########################################
# Check that the user does not assume he
# can control where to put simulations
#########################################

if [ -n "$NETSIMDIR" ]; then
    # *** Note *** 
    # Assuming simulations are stored in default dir $HOME/netsimdir
    echo "Use of NETSIMDIR other than the default is currently not"
    echo "supported (current value: $NETSIMDIR)"
    echo "SimGen assumes that simulations are saved in $HOME/netsimdir."
    exit 1
fi

################################
# Source env file
################################

NOW=`date +"%Y_%m_%d_%T:%N"`

. ../dat/$ENV
LOGFILE=$SIMDIR/log/${PROJECT}_$NOW.log

. utilityFunctions.sh

RNCSTART=$2
RNCEND=$3


getSimname() # RNCnumber 
{
     if [ "$1" -le 9 ]
     then
	 echo "$SIMBASE"-RNC0"$1"
     else
	 echo "$SIMBASE"-RNC"$1"
     fi
}


checkExistingSimulation() #Simname
{
 if [ -f "$HOME/netsimdir/$1.zip" ]; then
     # *** Note *** 
     # Assuming simulations are stored in default dir $HOME/netsimdir
     echo "Simulation $HOME/netsimdir/$1.zip"
     echo "already exists. Delete it and run again."
     exit 2
 fi
}



################################
# Main program
################################

echo "Start at `date`" | tee -a $LOGFILE

# Just check the first simulation
#checkExistingSimulation `getSimname $RNCSTART`

COUNT=$RNCSTART

while [ "$COUNT" -le "$RNCEND" ]
do

  RNCVERSION=`getMimType $COUNT $RNCVERSIONARRAY`
  SIMBASE="RNC"$(echo $RNCVERSION | awk -F"-" '{print $1}')"-ST"

 if [ "$COUNT" -le 9 ]
 then
  SIM=$SIMBASE"-RNC0"$COUNT
 else
  SIM=$SIMBASE"-RNC"$COUNT
 fi

 echo " ***************************" >> $LOGFILE
 echo " *      $SIM               *" >> $LOGFILE
 echo " ***************************" >> $LOGFILE   

  ( ./createSimulationIPParallel.sh $SIM $COUNT $ENV  2>&1 ) | tee -a $LOGFILE &
  # sleep 2 


COUNT=`expr $COUNT + 1`
done

echo "Done at `date`" | tee -a $LOGFILE


