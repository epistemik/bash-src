#!/bin/bash

# check current dir & all subdirs for WMA files to convert to MP3 format

# get current directory
curdir=$( pwd )

# pass each WMA file found to my script 'file-wma2mp3'
find $curdir -iname *.wma -execdir file-wma2mp3 {} \;

