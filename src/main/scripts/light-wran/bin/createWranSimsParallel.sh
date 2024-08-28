#!/bin/bash 

# Created by  : Fatih ONUR
# Created in  : 18.04.2011
##
### VERSION HISTORY
# Ver1        : Created for faster sim creation
# Purpose     :
# Description :
# Date        : 18 APR 2011
# Who         : Fatih ONUR
##########################################3
# Ver2        : Modified for faster sim creation
# Purpose     : New parelel mechanism added 
# Description : As many as scripts can be created concurrently
# Date        : 2013.03.01
# Who         : Fatih ONUR

##########################################3
# Ver3        : Modified for PICO node
# Purpose     : To include PICO also in the sim design 
# Description : Along with RNC,RBS,RXI PICO is also include for SIM design 
# Date        : 2013.08.06
# Who         : EAGACHI




if [ "$#" -ne 1 ]
then
cat<<HELP

####################
# HELP
####################

Usage  : $0 <env file>

Example: $0 O13-ST-13A-50K.env

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
#LOGFILE=$SIMDIR/log/${PROJECT}_$NOW.log
#LOGFILE=/netsim/simnet/wran/log/$NOW.log
LOGFILE=`cd ../;pwd`"/log/$NOW.log"
echo "LOGFILE=$LOGFILE"
echo "PWD=`cd ../; cd log;pwd`"
#exit
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

getSimNamingConvention()
{
	COUNT=$1

	RNCVERSION=`getMimType $COUNT $RNCVERSIONARRAY`
    if [ "$NEW_SIM_NAMING_CONVETION" == "YES" ]
    then
      
		RBSVERSION=`getMimType $COUNT $RBSVERSIONARRAY`
		RXIVERSION=`getMimType $COUNT $RXIVERSIONARRAY`
		PICOVERSION=`getMimType $COUNT $PICOVERSIONARRAY` 
	
		NUMOFRXI=`getItemFromArray $COUNT $NUMOFRXIARRAY`
		NUMOFRBS=`getNumOfRBS $COUNT $RNCRBSARRAY $RBSCELLARRAY`
		NUMOFPICO=`getNumOfPICO $COUNT $RNCPICOARRAY`
	
		SIMBASE="RNC"$(echo $RNCVERSION | awk -F"-" '{print $1}')"x1-ST"
		SIMBASE="${SIMBASE}-RBS"$(echo $RBSVERSION | awk -F"-" '{print $1}')"x${NUMOFRBS}"

		if [ "$NUMOFRXI" -ne "0" ]
		then
			SIMBASE="${SIMBASE}-RXI"$(echo $RXIVERSION | awk -F"-" '{print $1}')"x${NUMOFRXI}"
		fi

		if [ "$NUMOFPICO" -ne "0" ]
		then
			SIMBASE="${SIMBASE}-PICO"$(echo $PICOVERSION | awk -F"-" '{print $1}')"x${NUMOFPICO}"
		fi
	  	  
		SIM=$SIMBASE"-RNC"`printf "%03d" "$COUNT"`  
		  
    else
		SIMBASE="RNC"$(echo $RNCVERSION | awk -F"-" '{print $1}')"-ST"
		
		SIM=$SIMBASE"-RNC"`printf "%02d" "$COUNT"`
		
    fi

	echo $SIM
	
}


#
## catch control-c keyboard interrupts
#
control_c()
{
  echo -en "\n*** Ouch! Exiting ***\n"
  /bin/ps -eaf | grep "$ENV" | grep -v grep | awk '{print $2}' | xargs kill -9
  exit $?
}

################################
# Main program
################################

# trap keyboard interrupt (control-c)
trap control_c SIGINT


# Initilize the allBGP
echo "" &
allBGP=$!

PWD=`pwd`

rm $SIMDIR/log/*.log

rm $PWD/*.mml

rm $PWD/RNCST/*.mo
rm $PWD/RNCST/*.mml

rm $PWD/RBST/*.mo
rm $PWD/RBST/*.mml

rm $PWD/RXIST/*.mo
rm $PWD/RXIST/*.mml
rm PIDS.log
echo " "


echo "$0: started `date`" | tee -a $LOGFILE
echo "$0: started `date`" > PIDS.log

# Just check the first simulation
checkExistingSimulation `getSimname $RNCSTART`


  #MAX_CONCURRENT_NUM_OF_JOBS=20  # comes from ENV file 
  CURRENT_NUM_OF_JOBS=0
  TOTAL_NUM_OF_JOBS=`expr $RNCEND - $RNCSTART + 1`
  TOTAL_NUM_OF_JOBS_COMPLETED=0
  TOTAL_NUM_OF_JOBS_LEFT=0
  EXIT_CODES=''
  FINISHED_JOBS=''
  PIDS=''
  BGP_OUTPUT_ARRAY=()

  COUNT=$RNCSTART
  if [ $TOTAL_NUM_OF_JOBS -ge $MAX_CONCURRENT_NUM_OF_JOBS ]
  then
    STOP=`expr $COUNT + $MAX_CONCURRENT_NUM_OF_JOBS - 1`
    TOTAL_NUM_OF_JOBS_LEFT=`expr $TOTAL_NUM_OF_JOBS - $MAX_CONCURRENT_NUM_OF_JOBS`
  else
    STOP=$RNCEND 
    TOTAL_NUM_OF_JOBS_LEFT=$TOTAL_NUM_OF_JOBS
  fi

  while [ "$COUNT" -le "$STOP" ]
  do
    
	SIM=`getSimNamingConvention $COUNT`

   echo " ***************************" >> $LOGFILE
   echo " *      $SIM               *" >> $LOGFILE
   echo " ***************************" >> $LOGFILE   

 #( ./createSimulationIPParallel.sh $SIM $COUNT $ENV 2>&1 ) | tee -a $LOGFILE & 
   ( ./createSimulationIPParallel.sh $SIM $COUNT $ENV ) >> $LOGFILE 2>&1 &
 #sleep $(($RANDOM / 10000)) &
   createSimulationIPParallelBGP=$!
   PIDS="$PIDS $createSimulationIPParallelBGP" 
   allBGP="$allBGP $createSimulationIPParallelBGP"
   echo "...$COUNT=$SIM PID=$createSimulationIPParallelBGP is running" | tee -a PIDS.log
   BGP_OUTPUT="$COUNT=$SIM PID=$createSimulationIPParallelBGP" 
   BGP_OUTPUT_ARRAY[createSimulationIPParallelBGP]=$BGP_OUTPUT

 #sleep 1
   CURRENT_NUM_OF_JOBS=`expr $CURRENT_NUM_OF_JOBS + 1`
   COUNT=`expr $COUNT + 1`
  done

if [ $TOTAL_NUM_OF_JOBS_LEFT -ne 0 ]
then

  while true
  do

    #set $PIDS > /dev/null
    set -- $PIDS 
    for PID in "$@"
    do
      shift
      if kill -0 "$PID" 2>/dev/null; then
         #echo "---$PID is still running" | tee -a PIDS.log
         echo "---${BGP_OUTPUT_ARRAY[$PID]} is running" |  tee -a PIDS.log
         set -- "$@" "$PID"
      else
         wait "$PID"   
         EXIT_CODE=$?
         EXIT_CODES="$EXIT_CODES $EXIT_CODE"
         if [ $EXIT_CODE -ne 0 ]
         then
             echo "***WARNING: ${BGP_OUTPUT_ARRAY[$PID]} throw an error!!! See log files!!!"  
         fi
     
         echo "+++`date`" 
         CURRENT_NUM_OF_JOBS=$(($CURRENT_NUM_OF_JOBS - 1))
         TOTAL_NUM_OF_JOBS_COMPLETED=$(($TOTAL_NUM_OF_JOBS_COMPLETED + 1))
         TOTAL_NUM_OF_JOBS_LEFT=$(($TOTAL_NUM_OF_JOBS - $TOTAL_NUM_OF_JOBS_COMPLETED))
              
         echo "+++COMPLETED_JOB:"${BGP_OUTPUT_ARRAY[$PID]}
         echo "+++CURRENT_NUM_OF_JOBS="$CURRENT_NUM_OF_JOBS | tee -a PIDS.log
         echo "+++TOTAL_NUM_OF_JOBS_COMPLETED="$TOTAL_NUM_OF_JOBS_COMPLETED | tee -a PIDS.log
         echo "+++TOTAL_NUM_OF_JOBS_LEFT="$TOTAL_NUM_OF_JOBS_LEFT | tee -a PIDS.log

         TOTAL_EXECUTED_NUM_OF_JOBS=`expr $CURRENT_NUM_OF_JOBS + $TOTAL_NUM_OF_JOBS_COMPLETED`
       
         if [ $CURRENT_NUM_OF_JOBS -le $MAX_CONCURRENT_NUM_OF_JOBS ]\
            &&\
            [ $TOTAL_EXECUTED_NUM_OF_JOBS -lt $TOTAL_NUM_OF_JOBS ]
         then

			SIM=`getSimNamingConvention $COUNT`

            echo " ***************************" >> $LOGFILE
            echo " *      $SIM               *" >> $LOGFILE
            echo " ***************************" >> $LOGFILE

            #( ./createSimulationIPParallel.sh $SIM $COUNT $ENV 2>&1 ) | tee -a $LOGFILE &
            ( ./createSimulationIPParallel.sh $SIM $COUNT $ENV ) >> $LOGFILE 2>&1 &
            #sleep $(($RANDOM / 10000)) &
            createSimulationIPParallelBGP=$!
            PID=$createSimulationIPParallelBGP
            PIDS="$PIDS $createSimulationIPParallelBGP"
            allBGP="$allBGP $createSimulationIPParallelBGP"
            
            echo "...$COUNT=$SIM PID=$createSimulationIPParallelBGP is running" | tee -a PIDS.log
            BGP_OUTPUT="$COUNT=$SIM PID=$createSimulationIPParallelBGP" 
            BGP_OUTPUT_ARRAY[createSimulationIPParallelBGP]=$BGP_OUTPUT
         
            CURRENT_NUM_OF_JOBS=$(($CURRENT_NUM_OF_JOBS + 1)) 
            COUNT=`expr $COUNT + 1`
            echo "+++CURRENT_NUM_OF_JOBS="$CURRENT_NUM_OF_JOBS | tee -a PIDS.log
            set -- "$@" "$PID"
          fi  
        fi

        if [ $TOTAL_NUM_OF_JOBS_COMPLETED -eq $TOTAL_NUM_OF_JOBS ]
        then
           break 2
        fi
        sleep 10
      done

      PIDS=`echo "$@"`
    done
fi
echo ""
wait $allBGP
#echo "---PLEASE WAIT UNTIL ALL SCRIPTS ARE FINISHED SUCCESFULLY----" 

echo ""| tee -a $LOGFILE
echo " ***************************************" | tee -a $LOGFILE
echo " *    SIMS CREATIONS ARE COMPLETED     *" | tee -a $LOGFILE
echo " ***************************************" | tee -a $LOGFILE
echo ""| tee -a $LOGFILE
echo "$0: ended at `date`" | tee -a $LOGFILE

