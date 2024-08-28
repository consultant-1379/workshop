#!/bin/sh 

# Created by  : Fatih ONUR
# Created in  : 07 04 2011
##
### VERSION HISTORY
###########################################
# Ver1        : Moddified for TERE 11.2
# Purpose     : To create sims faster
# Description :
# Date        : 07 04 2011
# Who         : Fatih ONUR
###########################################
# Ver2        : Moddified for TERE 13A
# Purpose     : Node add/remove modularity added
# Description :
# Date        : 07 08 2012
# Who         : Fatih ONUR
###########################################


if [ "$#" -ne 3  ]
then
cat<<HELP

####################
# HELP
####################

Usage  : $0 <sim name> <count> <env file>

Example: $0 RNCS1100-ST-RNC10 10 O13-ST-13A-40K.env 

HELP

exit
fi

SIM=$1
COUNT=$2
ENV=$3

# Initilize the allBGP 
echo "" &
allBGP=$!

. ../dat/$ENV
. utilityFunctions.sh



#LOGFILE=$SIMDIR/log/${PROJECT}_$NOW.log


echo "//"
echo "//..$SIM:$0 start at `date`" 


if [ "$RADIO" != "YES" ]
then
  echo "//----$SIM:No Radio Layer Data populated!!"
fi

if [ $TRANSPORT == "YES" ] && [ $RESTORE_NE_DB_FOR_NO_TRANSPORT == "YES" ]
then
   echo -e ".select network \n .stop -parallel \n .restorenedatabase /netsim/netsimdir/$SIM/saved/dbs/noTransportConfigForSim" | /netsim/inst/netsim_pipe -sim $SIM -ne network
fi



  if [ "$RBS_NODE_DATA_CREATION" == "YES" ] && [ "$RADIO" == "YES" ]
  then
     ( ./startSimulations.sh $SIM 2>&1 ) &
     wait $!
     EXIT_CODE=$?
     echo "$SIM:EXIT_CODE=$EXIT_CODE"
     if [[ $EXIT_CODE -ne 0 ]]
     then
         echo "$SIM:..\"starting\" error occured on `date`"
         #echo "$SIM:..exiting due to \"starting\" error on `date`"
         #exit 123
     fi
  fi

#### RXI NODES
#
if [ "$RXI_NODE_CREATION" == "YES" ] && [ "$RXI_NODE_DATA_CREATION" != "NO" ] && [ "$RADIO" == "YES" ] \
 || ([ "$UPDATE" == "YES" ] && [ "$RXI_NODE_CREATION" == "NO" ] && [ "$RXI_NODE_DATA_CREATION" != "NO" ] && [ "$RADIO" == "YES" ])
then
  NUMOFRXI=`getItemFromArray $COUNT $NUMOFRXIARRAY`
  if [ $NUMOFRXI -ne 0 ]
  then
    ./createRXIdata.sh $SIM $ENV $COUNT &
    createRXIdataBGP=$!
    allBGP=`echo $allBGP" "$createRXIdataBGP`
  fi
else
  if [ "$RADIO" == "YES" ]; then echo "//-----$SIM:No RXI radio data populated!!";  fi
fi

#### PICO NODES
#
if [ "$PICO_NODE_CREATION" == "YES" ] && [ "$PICO_NODE_DATA_CREATION" != "NO" ] && [ "$RADIO" == "YES" ] \
 || ([ "$UPDATE" == "YES" ] && [ "$PICO_NODE_CREATION" == "NO" ] && [ "$PICO_NODE_DATA_CREATION" != "NO" ] && [ "$RADIO" == "YES" ])
then
  NUMOFPICO=`getNumOfPICO $COUNT $RNCPICOARRAY`
  if [ $NUMOFPICO -ne 0 ]
  then
    ./createPICOdata.sh $SIM $ENV $COUNT &
    createPICOdataBGP=$!
    allBGP=`echo $allBGP" "$createPICOdataBGP`
  fi
else
  if [ "$RADIO" == "YES" ]; then echo "//-----$SIM:No PICO radio data populated!!";  fi
fi


#### RBS NODES
#
if [ "$RBS_NODE_CREATION" == "YES" ] && [ "$RBS_NODE_DATA_CREATION" != "NO" ] && [ "$RADIO" == "YES" ] \
 || ([ "$UPDATE" == "YES" ] && [ "$RBS_NODE_CREATION" == "NO" ] && [ "$RBS_NODE_DATA_CREATION" != "NO" ] && [ "$RADIO" == "YES" ])
then
  ./createRBSdata.sh $SIM $ENV $COUNT &
  createRBSdataBGP=$!
  allBGP=`echo $allBGP" "$createRBSdataBGP`
else
  if [ "$RADIO" == "YES" ]; then echo "//-----$SIM:No RBS radio data populated!!"; fi
fi


#### RNC NODES
#
#if [ "$RNC_NODE_CREATION" == "YES" ] && [ "$RNC_NODE_DATA_CREATION" != "NO" ] && [ "$RADIO" == "YES" ] \
#  || ([ "$UPDATE" == "YES" ] && [ "$RNC_NODE_CREATION" == "NO" ])
#then
#  echo "RNCTEST=pass"
#fi
if [ "$RNC_NODE_CREATION" == "YES" ] && [ "$RNC_NODE_DATA_CREATION" != "NO" ] && [ "$RADIO" == "YES" ] \
 || ([ "$UPDATE" == "YES" ] && [ "$RNC_NODE_CREATION" == "NO" ] && [ "$RNC_NODE_DATA_CREATION" != "NO" ] && [ "$RADIO" == "YES" ])
then
 ./createRNCdata.sh $SIM $ENV $COUNT &
  createRNCdataBGP=$!
  allBGP=`echo $allBGP" "$createRNCdataBGP`
else
  if [ "$RADIO" == "YES" ]; then echo "//-----$SIM:No RNC radio data populated!!"; fi
fi


wait $allBGP
allBGP=""


if [ "$SAVE_DATABASE_FOR_NO_TRANSPORT" == "YES" ] && [ "$RADIO" == "YES" ] 
then
  ./saveNetworkDB.sh $SIM noTransportConfigForSim
fi


#### Transport will be inserted here
#
if [ "$TRANSPORT" == "YES" ]
then

  #############################
  # START:RNC TRANSPORT LAYER
  #############################
  TRANSPORT_SCRIPT_ID=`getItemFromArray $COUNT $RNCTRANSPORTARRAY`
  #echo "TRANSPORT_SCRIPT_ID="$TRANSPORT_SCRIPT_ID
  if [ ! -z "$TRANSPORT_SCRIPT_ID" ] && [ $TRANSPORT_SCRIPT_ID -ne 0 ]
  then
    echo ""
    echo "$SIM: RNC TRANSPORT LAYER CREATION STARTED at "`date` | tee -a $SIMDIR"/log/"$SIM"-RNC-Transport.log"
    echo "" | tee -a $SIMDIR"/log/"$SIM"-RNC-Transport.log"

    cd $SIMDIR/bin/
    (./createRNC_Transport_Data.sh $SIM $ENV $COUNT  2>&1 | tee -a $SIMDIR"/log/"$SIM"-RNC-Transport.log")&
    BGP=$!
    allBGP=$allBGP" "$BGP
  else
    echo "//----$SIM:No RNC_Transport_Data populated!!"
  fi

  # END:RNC TRANSPORT LAYER
  #############################

  #############################
  # START:RBS TRANSPORT LAYER
  #############################
  TRANSPORT_SCRIPT_ID=`getItemsFromArray $COUNT $RBSTRANSPORTARRAY`
  #echo "RBS TRANSPORT_SCRIPT_ID="$TRANSPORT_SCRIPT_ID
  if [ ! -z "$TRANSPORT_SCRIPT_ID" ] && [ "$TRANSPORT_SCRIPT_ID" != "0" ]
  then
    echo ""
    echo "$SIM:RBS TRANSPORT LAYER CREATION STARTED at "`date` | tee -a $SIMDIR"/log/"$SIM"-RBS-Transport.log"
    echo ""  | tee -a $SIMDIR"/log/"$SIM"-RBS-Transport.log"

    cd $SIMDIR/bin/
    (./createRBS_Transport_Data.sh $SIM $ENV $COUNT | tee -a $SIMDIR"/log/"$SIM"-RBS-Transport.log")&
    BGP=$!
    allBGP=$allBGP" "$BGP
  else
    echo "//----$SIM:No RBS_Transport_Data populated!!"
  fi

  # END:RBS TRANSPORT LAYER
  #############################

  #############################
  # START:RXI TRANSPORT LAYER
  #############################
  TRANSPORT_SCRIPT_ID=`getItemFromArray $COUNT $RXITRANSPORTARRAY`
  #echo "TRANSPORT_SCRIPT_ID="$TRANSPORT_SCRIPT_ID
  if [ ! -z "$TRANSPORT_SCRIPT_ID" ] && [ $TRANSPORT_SCRIPT_ID -ne 0 ]
  then
    echo ""
    echo "$SIM:RXI TRANSPORT LAYER CREATION STARTED at "`date` | tee -a $SIMDIR"/log/"$SIM"-RXI-Transport.log"
    echo ""  | tee -a $SIMDIR"/log/"$SIM"-RXI-Transport.log"

    cd $SIMDIR/bin/
    (./createRXI_Transport_Data.sh $SIM $ENV $COUNT | tee -a $SIMDIR"/log/"$SIM"-RXI-Transport.log")&
    BGP=$!
    allBGP=$allBGP" "$BGP
  else
    echo "//----$SIM:No RXI_Transport_Data populated!!"
  fi

  # END:RXI TRANSPORT LAYER
  #############################

  #echo "//...waiting for Transport Layer Data to be populated...`date`"
  wait $allBGP

else
  echo "//----$SIM:No Transport Layer Data populated!!"
fi


if [ "$SAVE_DATABASE_FOR_FULL_NETWORK_RECOVERY" == "YES" ]
then
  ./saveNetworkDB.sh $SIM fullNetworkConfigRecoveryForSim
fi


if [ "$SAVE_AND_COMPRESS_SIMS" == "YES" ]
then
  ./saveAndCompressSimulation.sh $SIM $ENV 
fi


if [ "$UPLOAD_TO_FTP" == "YES" ]
then
  ./ftp.sh $SIM $ENV 
fi


echo "//"
echo "//..$SIM:$0 end at `date`" 
