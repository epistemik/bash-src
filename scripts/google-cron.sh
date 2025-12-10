#!/bin/bash

# Copyright (c) 2025 Mark Sattolo <epistemik@gmail.com>
# modified 2025-12-08

# find any newer HouseHold.gnucash or HouseHold.gnucash.gcm 
# No longer able to send to Google drive @ Nov 26, 2025 with Mint 22 update

GNC_BAK=/home/marksa/dev/Gnucash/bak-files

# identify each day's files
today=$(date +%F)
cp -pf /home/marksa/Documents/Financial/Gnucash/HouseHold.gnucash "${GNC_BAK}/hh_${today}.gnc"
cp -pf /home/marksa/.local/share/gnucash/books/HouseHold.gnucash.gcm "${GNC_BAK}/hh_gnc_${today}.gcm"

GOOG=/home/marksa/git/Python/google
GAB=${GOOG}/auto-bak
find ${GNC_BAK} -type f -newer ${GAB}/ref-file -exec cp {} ${GAB}/transfer/ \;

# delete the older hh files
find ${GNC_BAK} -name "hh*" -type f -mtime +2 -delete

# send to my Google drive
#source "/home/marksa/dev/Python/VENV/venv311/bin/activate"
#python ${GOOG}/drive/driveAccess.py -s ${GAB}/transfer -p gnucash -l /home/marksa/dev/logs
#deactivate

mv -f ${GAB}/transfer/* ${GAB}/sent/
touch ${GAB}/ref-file

# clean up the 'sent' folder to only hold last 30 days worth of files
find ${GAB}/sent -name "hh*" -type f -mtime +30 -delete

# log finish
echo "google-cron finish @ $(date)" >> /home/marksa/dev/logs/google-cron.log
