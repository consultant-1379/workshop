#!/bin/bash


x="rnc"
for (( i=1; i<12; i++))
do

   simName=$x`printf "%02d" "$i"`
   echo "simName=$simName"

done
