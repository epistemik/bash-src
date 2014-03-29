#!/bin/bash

# GO THROUGH ALL THE SUBDIRS OF THE CWD AND RUN A SCRIPT

param1=$1
echo "first param: $param1"
param2=$2
echo "second param: $param2"

# get current directory
current_directory=$( pwd )
echo "Current Directory: $current_directory"

for file in *
  do
    echo "current file: $file"
    if [[ -d $file ]] ; then
      echo "found a dir: $file; call $param1 $param2" ;
    else
      echo "$file is NOT a directory!" ;
    fi
    # found one
    case $file in
      *.[Ww][Mm][Aa])
        echo -e "found wma file: $file\n" ;;
    esac
  done

echo -e "DONE\n"

