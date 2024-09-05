#!/bin/bash

# Copyright (c) 2024 Mark Sattolo <epistemik@gmail.com>
# modified 2024-09-05

# test 'while read; do; < find' as safer alternative to 'for in find; do' loop
# see: https://github.com/koalaman/shellcheck/wiki/SC2044

GNC_BAK=/home/marksa/dev/Gnucash/bak-files
GAB=/home/marksa/git/Python/google/auto-bak
#for x in $(find ${GNC_BAK}/ -type f -newer ${GAB}/ref-file -print); do cp "$x" ${GAB}/transfer/; done

DEST=/media/marksa/T7/BACKUP/test
while IFS= read -r -d '' file
do
  (( count++ ))
  cp "$file" ${DEST}/transfer/
  echo "Found file: $file"
done <   <(find ${GNC_BAK}/ -type f -newer ${GAB}/test-ref -print0)
echo "Found $count files"
