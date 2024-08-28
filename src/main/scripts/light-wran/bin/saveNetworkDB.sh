#!/bin/sh
# Created by : Fatih ONUR
# Created in : 20 Aug 2012
##
### VERSION HISTORY
##################################################
# Ver1        : Created for 13A TERE
# Purpose     : To save network database e.g for noTransport config
# Description :
# Date        : 24 Aug 2012
# Who         : Fatih ONUR
##################################################

if [ "$#" -ne 2 ]
then
 echo
 echo "Usage: $0 <sim name> <database_name>"
 echo
 echo "Example: $0 RNCH2010-ST-RNC02 noTransportConfigForSim"
 echo
 exit 1
fi

SIM=$1
DBNAME=$2

PWD=`pwd`
NOW=`date +"%Y_%m_%d_%T:%N"`

MMLSCRIPT=$0:${NOW}:$SIM:".mml"

if [ -f $PWD/$MMLSCRIPT ]
then
rm -r  $PWD/$MMLSCRIPT
echo "old "$PWD/$MMLSCRIPT " removed"
fi

echo '.open '$SIM >> $MMLSCRIPT
echo '.select network'>> $MMLSCRIPT
echo '.stop -parallel' >> $MMLSCRIPT
echo '.savenedatabase '$DBNAME' force' >> $MMLSCRIPT

/netsim/inst/netsim_pipe < $MMLSCRIPT

rm $MMLSCRIPT
