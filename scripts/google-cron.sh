#!/bin/bash

# Copyright (c) 2021 Mark Sattolo <epistemik@gmail.com>

GNC_APPF=/home/marksa/dev/Gnucash/app-files

# send any newer HouseHold.gnucash or HouseHold.gnucash.gcm to Google drive
cp -pf /home/marksa/Documents/Financial/Gnucash/HouseHold.gnucash ${GNC_APPF}/hh.gnc
cp -pf /home/marksa/.local/share/gnucash/books/HouseHold.gnucash.gcm ${GNC_APPF}/hh.gnc.gcm

for x in $(find /home/marksa/dev/Gnucash/app-files/ -type f -newer /home/marksa/git/Python/google/auto-bak/ref-file -print); do cp $x /home/marksa/git/Python/google/auto-bak/transfer/; done

source "/home/marksa/dev/Python/VENV/venvcron/bin/activate"

python /home/marksa/git/Python/google/drive/driveAccess.py -s /home/marksa/git/Python/google/auto-bak/transfer -p gnucash -l /home/marksa/dev/logs

mv -f ${GOOGLE}/auto-bak/transfer/* ${GOOGLE}/auto-bak/sent/
touch ${GOOGLE}/auto-bak/ref-file
