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

if [ "$#" -ne 1 ]
then
cat<<HELP

####################
# HELP
####################

Usage  : $0 <env file> 

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
LOGFILE=$SIMDIR/log/AllAtOnce_${PROJECT}_$NOW.log

. utilityFunctions.sh


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

rm $SIMDIR/log/*.log

rm /netsim/simgen3/ST/bin/*.mml

rm /netsim/simgen3/ST/bin/RNCST/*.mo
rm /netsim/simgen3/ST/bin/RNCST/*.mml

rm /netsim/simgen3/ST/bin/RBST/*.mo
rm /netsim/simgen3/ST/bin/RBST/*.mml

rm /netsim/simgen3/ST/bin/RXIST/*.mo
rm /netsim/simgen3/ST/bin/RXIST/*.mml

echo "Start at `date`" | tee -a $LOGFILE

# Just check the first simulation
#checkExistingSimulation `getSimname $RNCSTART`


 echo " ***************************" >> $LOGFILE
 echo " *  ALL AT ONCE START    *" >> $LOGFILE
 echo " ***************************" >> $LOGFILE   

  RNCSTART=1;RNCEND=25
  ( ./createWranSimsParallelRNCstartRNCend.sh $ENV $RNCSTART $RNCEND 2>&1 ) | tee -a $LOGFILE 

  /netsim/inst/restart_netsim fast
  wait $!
  RNCSTART=26;RNCEND=65
  ( ./createWranSimsParallelRNCstartRNCend.sh $ENV $RNCSTART $RNCEND 2>&1 ) | tee -a $LOGFILE 
  wait $!

  /netsim/inst/restart_netsim fast 
  wait $!
  RNCSTART=65;RNCEND=77
  ( ./createWranSimsParallelRNCstartRNCend.sh $ENV $RNCSTART $RNCEND 2>&1 ) | tee -a $LOGFILE &
  sleep 5m

  RNCSTART=78;RNCEND=83
  ( ./createWranSimsParallelRNCstartRNCend.sh $ENV $RNCSTART $RNCEND 2>&1 ) | tee -a $LOGFILE



echo "Done at `date`" | tee -a $LOGFILE


