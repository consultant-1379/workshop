#!/bin/sh

if [ "$#" -ne 3 ] || [ "$2" != "ST" ] && [ "$2" != "FT" ]  
then
cat << HELP
*************************************************************

Usage:$0 <RNC MIM Version> <TYPE(ST or FT)> <RNC NO>

Eg:
$0 K70 ST 03 

*************************************************************
HELP
exit 1
fi

if [ "$3" -le "9" ]
then
SIM=RNC${1}-${2}-RNC0${3}
else
SIM=RNC${1}-${2}-RNC${3}
fi


LIST1=`ls -ltr ../log/${SIM}* | awk '{print $8}'`
for ENTRY1 in $LIST1
do
    echo ""
    echo ""
    echo "Scanning "$ENTRY1"..."
    echo "*****************************************************************"
    ERRORCOUNT=0
    DUPERROR=0
    LIST2=`grep -n kertayle $ENTRY1 | awk -F: '{print $1}'`
    for ENTRY2 in $LIST2
    do
      result=`sed -n \`expr ${ENTRY2} + 1\`p $ENTRY1`
      if [ "$result" != "OK" ]
      then
         SCRIPTNAME=`sed -n ${ENTRY2}p $ENTRY1 | awk -F\" '{print $2}'` 
         if [ "$SCRIPTNAME" != "$PRESCRIPTNAME" ]
         then   
              echo $SCRIPTNAME
              sed -n `expr ${ENTRY2} + 1`,`expr ${ENTRY2} + 3`p $ENTRY1
              ERRORCOUNT=`expr $ERRORCOUNT + 1`  
              echo ""
         else
              DUPERROR=`expr $DUPERROR + 1` 
         fi
         PRESCRIPTNAME=$SCRIPTNAME
      fi
    done
    if [ $DUPERROR -ne 0 ]
    then
        echo "Errors Found: "$ERRORCOUNT"+"$DUPERROR
    else
        echo "Errors Found: "$ERRORCOUNT
    fi
done     
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
echo "Check completed"
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"

