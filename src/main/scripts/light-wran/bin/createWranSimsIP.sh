#!/bin/sh

# Created by  : unknown
# Created in  : unknown
##
### VERSION HISTORY
# Ver1        : Moddified for TERE 10.0
# Purpose     :
# Description :
# Date        : 10 09 2009
# Who         : Fatih ONUR

if [ "$#" -ne 1 ]
then
cat<<HELP

####################
# HELP
####################

Usage  : $0 <env file>

Example: $0 R7-ST-K-N.env

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

. ../dat/$ENV

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

# Just check the first simulation
#checkExistingSimulation `getSimname $RNCSTART`


./createSimulationIP.sh $ENV
./createData.sh $ENV

