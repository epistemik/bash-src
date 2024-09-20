#!/bin/bash

# Copyright (c) 2024 Mark Sattolo <epistemik@gmail.com>
# modified 2024-09-19

# test 'while read; do; < find' as safer alternative to 'for in find; do' loop
# see: https://github.com/koalaman/shellcheck/wiki/SC2044

T7=/media/marksa/T7/BACKUP
GNC_BAK=${T7}/dev/Gnucash/bak-files
# identify each day's files
today=$(date +%F)
echo "${today}"
cp -pf /home/marksa/Documents/Financial/Gnucash/HouseHold.gnucash "${GNC_BAK}/hh_${today}.gnc"
cp -pf /home/marksa/.local/share/gnucash/books/HouseHold.gnucash.gcm "${GNC_BAK}/hh_gnc_${today}.gcm"

GAB=/home/marksa/git/Python/google/auto-bak
#for x in $(find ${GNC_BAK}/ -type f -newer ${GAB}/ref-file -print); do cp "$x" ${GAB}/transfer/; done

DEST=${T7}/test
while IFS= read -r -d '' file
do
  (( count++ ))
  cp "$file" ${DEST}/transfer/
  echo "Found file: $file"
done <   <(find ${GNC_BAK}/ -type f -newer ${GAB}/test-ref -print0)
echo "Found $count files"
