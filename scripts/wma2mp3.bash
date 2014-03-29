#!/bin/bash

# CONVERT WMA FILES TO MP3 FORMAT

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

    # get basename
    bn=`basename $sn .wma`
    echo "basename = $bn"
    
    # Rip with Mplayer / encode with LAME
    echo "Rip $i with Mplayer / encode with LAME"
    mplayer -vo null -vc dummy -af resample=44100 -ao pcm:waveheader $sn && lame -m s audiodump.wav -o $bn.mp3

    # rename wav file
    echo "rename audiodump.wav to $bn.wav"
    mv audiodump.wav "$bn.wav"
    #mv "$i" "`basename "$i" .wma`.mp3"
    
    echo -e "DONE\n"
  done
#rm audiodump.wav

