#!/bin/ksh

#question mode
make -q

if [ "$?" != "0" ]; then
  echo "Target is [1;31m NOT [0m up-to-date" ;
else
    echo "Target is up-to-date." ;
fi
