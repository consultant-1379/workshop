#!/bin/sh

# VER1: To testndivudual scripts faster

if [ "$#" -ne 1  ]
then
cat<<HELP

Usage: $0 <script name>

Example: $0 1000setManagedElement.sh 

Definition: To test individual scripts with prdefined SIMNAME, ENV and RNCNUM 

HELP
 exit 1
fi
 

SCRIPT="$1"

SIMNAME=RNCL110-ST-RNC05
ENV=R7-ST-E-1-test.env
COUNT=5

echo ""
echo "SCRIPT RUNNING"
echo ""

./$SCRIPT $SIMNAME $ENV $COUNT 

