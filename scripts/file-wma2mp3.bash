#!/bin/bash

# convert WMA file to MP3 format
# can be called from 'find' to convert all files in a dir & subdirs
# e.g. my scripts 'execsubdirs.bash' and 'dir-wma2mp3.bash'

if [[ ! $1 ]] ; then
  echo -e "No file name provided! ...exiting\n"
  exit
fi

file=$1
# make sure we have a wma file
if [[ ! $file =~ .*\.[Ww][Mm][Aa] ]] ; then
  echo -e "'$file' is NOT a wma file!\n"
  exit
else
  echo -e "\n\t file to convert: '$file'"
fi

# remove spaces
echo "remove any whitespace from: $file"
nn=`echo $file | tr -d [:blank:]`
if test "$file" != "$nn" ; then
  mv -f "$file" "$nn"
  echo "new name: $nn"
fi
  
# convert uppercase
echo "convert any uppercase [AMW] in: $nn"
sn=`echo $nn | tr [AMW] [amw]`
if test "$sn" != "$nn" ; then
  mv -f "$nn" "$sn"
  echo "small name: $sn"
fi

# get basename
bn=`basename $sn .wma`
echo "basename: $bn"

# see if we have already converted this file
if [[ -e $bn.mp3 ]] ; then
  echo -e "$bn.mp3 already exists! ...exiting\n"
  exit
fi

# Rip to wav format with Mplayer - default output is 'audiodump.wav'
echo "Rip $sn with Mplayer"
mplayer -vo null -vc dummy -af resample=44100 -ao pcm:waveheader $sn

# encode wav file with LAME ...if it exists - rip may have failed
if [[ -e audiodump.wav ]] ; then
  echo "Encode with LAME"
  lame -m s audiodump.wav -o $bn.mp3
  echo "rename audiodump.wav to $bn.wav"
  mv audiodump.wav "$bn.wav"
else
  echo "Problem with Mplayer... NO audiodump.wav ?!"
fi
  
echo -e "DONE\n"

