#!/bin/bash

# Copyright (c) 2024 Mark Sattolo <epistemik@gmail.com>
# modified 2024-09-05

# send any newer HouseHold.gnucash or HouseHold.gnucash.gcm to Google drive

GNC_BAK=/home/marksa/dev/Gnucash/bak-files
cp -pf /home/marksa/Documents/Financial/Gnucash/HouseHold.gnucash ${GNC_BAK}/hh.gnc
cp -pf /home/marksa/.local/share/gnucash/books/HouseHold.gnucash.gcm ${GNC_BAK}/hh.gnc.gcm

GOOG=/home/marksa/git/Python/google
GAB=${GOOG}/auto-bak
#for x in $(find ${GNC_BAK}/ -type f -newer ${GAB}/ref-file -print); do cp "$x" ${GAB}/transfer/; done
while IFS= read -r -d '' file
do
  cp "$file" ${GAB}/transfer/
done <   <(find ${GNC_BAK}/ -type f -newer ${GAB}/ref-file -print0)

source "/home/marksa/dev/Python/VENV/venvcron/bin/activate"
python ${GOOG}/drive/driveAccess.py -s ${GAB}/transfer -p gnucash -l /home/marksa/dev/logs
deactivate

mv -f ${GAB}/transfer/* ${GAB}/sent/
touch ${GAB}/ref-file
