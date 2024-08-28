
SIMNAME=$1
ENV=$2
COUNT=$3



SCRIPTLIST=`ls 4*.sh`

  for script in $SCRIPTLIST
  do
    echo '****************************************************' | tee -a $LOGFILE
    echo "./$script $SIMNAME $ENV $COUNT" | tee -a $LOGFILE
    echo '****************************************************' | tee -a $LOGFILE
    ./$script $SIMNAME $ENV $COUNT 2>&1 | tee -a $LOGFILE
  done



