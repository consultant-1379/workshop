#!/bin/bash

a=3
b=3
c=4
d=5
if [ $a -eq 2 ] && [ $c -eq 4 ] \
 || [ $b -eq 3 ] && [ $d -eq 3 ]
then
  echo "a=$a and b=$b"
fi

p="0"

#if [ $a -eq 10 || -z "$p" ]
if [ ! -z $p ] && [ $a -eq 3 ]
then
   echo "empty"
fi
