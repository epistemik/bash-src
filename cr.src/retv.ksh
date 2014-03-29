#!/bin/ksh

# display return value from a command

$1
val=$?

if [ $val != 0 ]; then
#if [ "$?" != "0" ]; then
  echo "Return Value is $val" ;
#  echo "Return Value is $?" ;
else
    echo "Return Value is 0" ;
fi
