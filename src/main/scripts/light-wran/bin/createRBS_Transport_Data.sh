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



cd $SIMDIR/bin/$RBSDIR

RNCCOUNT=$COUNT
if [ "$COUNT" -le 9 ]
then
 RNCNAME="RNC0"$3
else
 RNCNAME="RNC"$3
fi

NUMOFRBS=`getNumOfRBS $RNCCOUNT $RNCRBSARRAY $RBSCELLARRAY`

#
## LIST e.g. {PERCENTAGE-RBS_TRANSPORT_SCRIPT_ID},{},{}
#
LIST=`getItemsFromArray $RNCCOUNT $RBSTRANSPORTARRAY`
#echo "RNCCOUNT=$RNCCOUNT, LIST="$LIST

RBS_TRANSPORT_DISTRIBUTION_ARRAY=`getTransportDistributionArray $NUMOFRBS $RBSTRANSPORTARRAY "$LIST"`
#echo "RBS_TRANSPORT_DISTRIBUTION_ARRAY=$RBS_TRANSPORT_DISTRIBUTION_ARRAY"


IFS=";"
for ITEM in $RBS_TRANSPORT_DISTRIBUTION_ARRAY
do

  FROM=$(echo $ITEM | awk -F"," '{print $1}' | awk -F":" '{print $1}')
  TO=$(echo $ITEM | awk -F"," '{print $1}' | awk -F":" '{print $2}')
  RBS_TRANSPORT_SCRIPT_ID=$(echo $ITEM | awk -F"," '{print $2}')

  #echo "FROM="$FROM
  #echo "TO="$TO
  #echo "RBS_TRANSPORT_SCRIPT_ID="$RBS_TRANSPORT_SCRIPT_ID

  IFS=" "
  #echo "RBS_TRANSPORT_SCRIPTS="$RBS_TRANSPORT_SCRIPTS

  RBS_TRANSPORT_SCRIPT=`getTransportScript $RBS_TRANSPORT_SCRIPT_ID $RBS_TRANSPORT_SCRIPTS`
  #echo "RBS_TRANSPORT_SCRIPT="$RBS_TRANSPORT_SCRIPT

  RBSSTART=$FROM; RBSEND=$TO;
  echo '****************************************************'
  echo "./$RBS_TRANSPORT_SCRIPT $SIMNAME $ENV $COUNT $RBSSTART $RBSEND"
  echo '****************************************************'
  ./$RBS_TRANSPORT_SCRIPT $SIMNAME $ENV $COUNT $RBSSTART $RBSEND
 
done;

echo ""
echo "$SIMNAME: RBS TRANSPORT LAYER CREATION ENDED at "`date`
echo ""

