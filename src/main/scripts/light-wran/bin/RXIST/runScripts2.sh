#!/bin/sh

if [ "$#" -ne 3  ]
then
 echo
 echo "Usage: $0 <sim name> <env file> <rnc num> <script number>"
 echo
 echo "Example: $0 RNCH2030-FT-RNC01 SIM1.env 1 3"
 echo
 exit 1
fi


SIMNAME=$1
ENV=$2
COUNT=$3
SCRIPTNO=$4


    echo '****************************************************' | tee -a $LOGFILE
    echo "./6000createRXI_Aal2Switched.sh $SIMNAME $ENV $COUNT" | tee -a $LOGFILE
    echo '****************************************************' | tee -a $LOGFILE
    ./6000createRXI_Aal2Switched.sh $SIMNAME $ENV $COUNT 2>&1 | tee -a $LOGFILE



