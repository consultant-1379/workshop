#!/bin/sh

# Created by  : Fatih ONUR
# Created in  : 17 OCT 2012
##
### VERSION HISTORY
# Ver1        : Created fro O13A
# Purpose     :
# Description :
# Date        : 17.10.2012
# Who         : Fatih ONUR

if [ "$#" -ne 3  ]
then
cat<<HELP

####################
# HELP
####################

Usage  : $0 <sim name> <env file> <rnc num>

Example: $0 RNCS1100-ST-RNC01 O13-ST-13A-40K.env 1

HELP

exit
fi

SIMNAME=$1
ENV=$2
COUNT=$3

. ../dat/$ENV
. utilityFunctions.sh



cd $SIMDIR/bin/$RNCDIR

RNCCOUNT=$COUNT
if [ "$COUNT" -le 9 ]
then
 RNCNAME="RNC0"$3
else
 RNCNAME="RNC"$3
fi



RNC_TRANSPORT_SCRIPT_ID=`getItemFromArray $RNCCOUNT $RNCTRANSPORTARRAY`
RNC_TRANSPORT_SCRIPT=`getTransportScript $RNC_TRANSPORT_SCRIPT_ID $RNC_TRANSPORT_SCRIPTS`


    echo '****************************************************' 
    echo "./$RNC_TRANSPORT_SCRIPT $SIMNAME $ENV $COUNT" 
    echo '****************************************************' 
    ./$RNC_TRANSPORT_SCRIPT $SIMNAME $ENV $RNCCOUNT 


echo "" 
echo "$SIMNAME: RNC TRANSPORT LAYER CREATION ENDED at "`date` 
echo "" 

