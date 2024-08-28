#!/bin/sh

if [ "$#" -ne 3 ]; then
 echo "Usage: $0 <sim name> <env file> <rnc num>"
 exit 1
fi


SIM=$1
ENV=$2
RNCCOUNT=$3

. ../dat/$ENV

if [ "$3" -le 9 ]; then
    RNCNAME="RNC0"$3
else
    RNCNAME="RNC"$3
fi


. utilityFunctions.sh

MOTREE=/tmp/motree_$$
MOCNT=/tmp/mocnt_$$
MMLSCRIPT=$0".mml"

INFO=$SIMDIR/log/$SIM.txt
SIMDESCRIPTION=$HOME/netsimdir/$SIM/simulation-description.txt
RELINFO=$SIMDIR/.release

/bin/rm -f $INFO

count() # motype
{
    c=`/bin/grep "^$1" $MOCNT`
    echo "$c"
}

dump() # ne
{
    /bin/rm -f $MOSCRIPT $MMLSCRIPT
    /bin/rm -f $MOTREE $MOCNT
    
    echo '.open '$SIM >> $MMLSCRIPT
    echo '.select '$1 >> $MMLSCRIPT
    echo '.start' >> $MMLSCRIPT
    echo 'dumpmotree:outputfile="'$MOTREE'";' >> $MMLSCRIPT
    
    $NETSIMDIR/$NETSIMVERSION/netsim_pipe < $MMLSCRIPT
    
    # Count all MO types created
    TOTMOs=`cat $MOTREE | wc -l`
    
    cat $MOTREE | cut -d= -f1 | sort | uniq -c | awk '{printf "%-30s %6d\n", $2, $1}' > $MOCNT

    echo "$1 - Created MO:s"
    echo "-------------------------------------" 
    cat $MOCNT

}

printVersion()
{
    echo "With Netsim version: $NETSIMVERSION"
}

### Main ###

echo "Master simulation $SIM" >> $INFO
echo "-------------------------------------" >> $INFO
echo "Created: `date '+%d %b %Y %R'`" >> $INFO

printVersion >> $INFO

if [ "$FTPHOST" != "none" ]; then
    echo "Ftp location: $FTPDIR" >> $INFO
fi
echo >> $INFO
    echo "Network elements $RNCNAME" >> $INFO
echo "-------------------------------------" >> $INFO

  RXIVERSION=`getMimType $RNCCOUNT $RXIVERSIONARRAY`
  RNCVERSION=`getMimType $RNCCOUNT $RNCVERSIONARRAY`
  RBSVERSION=`getMimType $RNCCOUNT $RBSVERSIONARRAY`

printf "%3d x RNC $RNCVERSION\n" 1 >> $INFO
printf "%3d x RXI $RXIVERSION ${RXISKIP:+(not included)}\n" $NUMOFRXI >> $INFO
printf "%3d x RBS $RBSVERSION ${RBSSKIP:+(not included)}\n" $NUMOFRBS >> $INFO

echo >> $INFO

#RNCEND=$RNCCOUNT
#while [ "$RNCCOUNT" -le "$RNCEND"  ]
#do
    RNCNAME=`rnc_name $RNCCOUNT`

    . ../dat/$ENV

    dump $RNCNAME

    echo >> $INFO
    echo "Details for $RNCNAME" >> $INFO
    echo "-------------------------------------" >> $INFO
    printf "%d cells per RBS\n" $CELLNUM >> $INFO
    #if [ "$NUMOFRBS" -eq 224 ]; then
	#printf "(RBS 169-224 have 6 cells)\n" >> $INFO
    #fi
    if [ "$TRANS" = "yes" ]; then
	echo "Transport network included" >> $INFO
    else
	echo "No transport network included" >> $INFO
    fi

    echo >> $INFO

    count UtranCell >> $INFO
    count ExternalUtranCell >> $INFO
    count ExternalGsmCell >> $INFO
    count UtranRelation >> $INFO
    count GsmRelation >> $INFO
    count CoverageRelation >> $INFO
    echo "-------------------------------------" >> $INFO
    printf "%-30s %6d\n" "RNC - Number of MO:s" $TOTMOs >> $INFO
    TOT=$TOTMOs
    
    #if [ "$RBSSKIP" != "yes" ]; then
	RBSNAME=${RNCNAME}RBS01
	dump $RBSNAME
	printf "%-30s %6d\n" "Number of RBS:s" $NUMOFRBS >> $INFO
	printf "%-30s %6d\n" "RBS - Number of MO:s" $TOTMOs >> $INFO
	TOT=`expr $TOT + \( $TOTMOs \* $NUMOFRBS \)`
    #fi
    
    #if [ "$RXISKIP" != "yes" ]; then
	RXINAME=${RNCNAME}RXI01
	dump $RXINAME
	printf "%-30s %6d\n" "Number of RXI:s" $NUMOFRXI >> $INFO
	printf "%-30s %6d\n" "RXI - Number of MO:s" $TOTMOs >> $INFO
	TOT=`expr $TOT + \( $TOTMOs \* $NUMOFRXI \)`
    #fi
    
    echo "-------------------------------------" >> $INFO
    printf "%-30s %6d\n" "Total number of MO:s" $TOT >> $INFO

#    RNCCOUNT=`expr $RNCCOUNT + 1`
#done
  

/bin/cp -f $INFO $SIMDESCRIPTION
/bin/rm -f $MOTREE $MOCNT $MMLSCRIPT 
