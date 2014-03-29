#!/bin/bash

# CONVERT WMA FILES

# get current directory
current_directory=$( pwd )

for file in *.[Ww][Mm][Aa]
  do
    # remove spaces
    echo "remove spaces from: $file"
    nn=`echo $file | tr -d [:blank:]`
    echo "new name: $nn"
    mv -f "$file" "$nn"
    
    # convert uppercase
    echo "convert uppercase AMW in: $nn"
    sn=`echo $nn | tr [AMW] [amw]`
    mv -f "$nn" "$sn"
    echo "small name: $sn"
  done

echo -e "DONE\n"

