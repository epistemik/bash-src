#!/bin/bash

# run a program on every file in the current dir & all subdirs

if [[ ! $1 ]] ; then
  echo "No program name given! ...exiting"
  exit
fi

prog=$1
echo -e "prog to run: '$prog'"

# get current directory
curdir=$( pwd )
echo -e "current directory: '$curdir'\n"

# find each file and pass to the program
find "$curdir" -type f -execdir $prog {} \;

