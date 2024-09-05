#!/bin/bash

# Copyright (c) 2024 Mark Sattolo <epistemik@gmail.com>
# modified 2024-09-04

RSYNC='rsync -aq'

#  rsync my home folder to the Samsung T5
${RSYNC} --exclude-from='/home/marksa/dev/rsync.samsung.exclude' /home/marksa/ /media/marksa/Samsung_T5/BACKUP/marksa/

#  rsync important information to backup locations
HOME_GNC=/home/marksa/Documents/Financial/Gnucash
HOME_DLS=/home/marksa/.local/share
SEAGATE=/home/marksa/Seagate/BACKUP/DIOMEDES/HOME
SAMSUNGT7=/media/marksa/T7/BACKUP

# gnucash data
${RSYNC} ${HOME_GNC}/ /mhs2/FIN/Gnucash/
${RSYNC} ${HOME_GNC}/ ${SEAGATE}/Documents/Financial/Gnucash/
${RSYNC} ${HOME_GNC}/ ${SAMSUNGT7}/Documents/Financial/Gnucash/
# gnucash metadata
${RSYNC} ${HOME_DLS}/gnucash/ /mhs2/dot-local-share/gnucash/

# .local/share
${RSYNC} --exclude-from='/home/marksa/dev/rsync.seagate.exclude' ${HOME_DLS}/ ${SEAGATE}/.local/share/
${RSYNC} ${HOME_DLS}/ ${SAMSUNGT7}/local/share/

# python files
PYTHON=/home/marksa/dev/git/Python
${RSYNC} --exclude-from='/home/marksa/dev/rsync.seagate.exclude' ${PYTHON}/ ${SEAGATE}/git/Python/
${RSYNC} ${PYTHON}/ ${SAMSUNGT7}/dev/git/Python/

# google dev files
${RSYNC} ${PYTHON}/google/ /mhs2/Google/

# write a log record
date >> /home/marksa/dev/logs/rsync.log
