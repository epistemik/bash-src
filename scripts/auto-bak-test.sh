#!/bin/bash

# Copyright (c) 2021 Mark Sattolo <epistemik@gmail.com>

#  auto-bak script
# =================

MYHOME=/home/marksa
MYDEV=${MYHOME}/dev
HOME_GNC=${MYHOME}/Documents/Financial/Gnucash
SEAGATE=${MYHOME}/Seagate/BACKUP/DIOMEDES/marksa

# gnucash data
rsync -aq ${HOME_GNC}/ /mhs2/FIN/Gnucash/
rsync -aq ${HOME_GNC}/ ${SEAGATE}/Documents/Financial/Gnucash/

# gnucash metadata
HOME_DLS=${MYHOME}/.local/share
rsync -aq ${HOME_DLS}/gnucash/ /mhs2/dot-local-share/gnucash/
rsync -aq ${HOME_DLS}/gnucash/ ${SEAGATE}/dot-local-share/gnucash/

# google info
GIT_PYTHON=${MYDEV}/git/Python
GOOGLE=${GIT_PYTHON}/google
rsync -aq ${GOOGLE}/ /mhs2/Google/
rsync -aq ${GOOGLE}/ ${SEAGATE}/git/Python/google/

GNC_APPF=${MYDEV}/Gnucash/app-files
# send any newer HouseHold.gnucash or HouseHold.gnucash.gcm to Google drive
cp -pf ${HOME_GNC}/HouseHold.gnucash ${GNC_APPF}/hh.gnc
cp -pf ${HOME_DLS}/gnucash/books/HouseHold.gnucash.gcm ${GNC_APPF}/hh.gnc.gcm

for x in $(find /home/marksa/dev/Gnucash/app-files/ -type f -newer /home/marksa/dev/git/Python/google/auto-bak/ref-file -print); do cp $x /home/marksa/dev/git/Python/google/auto-bak/transfer/; done
# Needed? export PYTHONPATH=/home/marksa/dev/Python/VENV/venv39_gnc-tag46/lib/python3.9/site-packages:$PYTHONPATH
source "${MYDEV}/Python/VENV/venv39_gnc-tag46/bin/activate"
echo $VIRTUAL_ENV
${MYDEV}/Python/VENV/venv39_gnc-tag46/bin/python ${GOOGLE}/drive/driveAccess.py -s ${GOOGLE}/auto-bak/transfer -p gnucash -l /home/marksa/dev/logs
mv -f ${GOOGLE}/auto-bak/transfer/* ${GOOGLE}/auto-bak/sent/
touch ${GOOGLE}/auto-bak/ref-file
