#!/bin/sh


if [ "$#" -ne 2  ]
then
 echo
 echo "Usage: $0 <sim> <config file>"
 echo
 echo "Example: $0 G50-RNC01 SIM1.env"
 echo
 exit 1
fi


SIM=$1
ENV=$2

. ../dat/$ENV

if [ "$FTPHOST" = "none" ]; then
    echo "No ftp"
    exit
fi


echo "...script started running at "`date`
echo ""

DIR=$FTPDIR
echo "Ftp to $DIR..."

# *** Note *** 
# Assuming simulations are stored in default dir $HOME/netsimdir

ftp -n $FTPHOST << EOF
user $FTPUSER $FTPPASSWD
cd $DIR
lcd $SIMDIR/log
put $SIM-mo.txt
bin
lcd $HOME/netsimdir
put $SIM.zip
bye
EOF


echo "...script ended at "`date`
echo ""

