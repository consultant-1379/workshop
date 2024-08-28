#!/bin/bash

for i in {1..750}
do
	if [ $i -le 10 ]
	then
		node=RNC109PRBS0$i
	else
		node=RNC109PRBS$i
	fi	
 	
	echo "$node -->" 
	echo ".open $1" >$node.mml
	echo ".select $node" >> $node.mml
	echo "netconf" >> $node.mml
	cat edit-config >> $node.mml
	echo '<rpc message-id="101" xmlns="urn:ietf:params:xml:ns:netconf:base:1.0"> <close-session/> </rpc>]]>]]>' >> $node.mml
	
	/netsim/inst/netsim_pipe < $node.mml

done

