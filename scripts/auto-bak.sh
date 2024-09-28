#!/bin/bash

# Copyright (c) 2024 Mark Sattolo <epistemik@gmail.com>
# modified 2024-09-28

# DAILY backups with rsync
RSYNC='rsync -aq'

#  rsync my home folder to the Samsung T5
${RSYNC} --exclude-from='/home/marksa/dev/rsync.samsung.exclude' /home/marksa/ /media/marksa/Samsung_T5/BACKUP/marksa/

#  rsync important information to backup locations
HOME_GNC=/home/marksa/Documents/Financial/Gnucash
HOME_DLS=/home/marksa/.local/share
SEAGATE=/home/marksa/Seagate
SAMSUNGT7=/media/marksa/T7/BACKUP

# gnucash data
${RSYNC} ${HOME_GNC}/ /mhs2/FIN/Gnucash/
${RSYNC} ${HOME_GNC}/ ${SEAGATE}/Documents/Financial/Gnucash/
${RSYNC} ${HOME_GNC}/ ${SAMSUNGT7}/Documents/Financial/Gnucash/
# gnucash metadata
${RSYNC} ${HOME_DLS}/gnucash/ /mhs2/dot-local/share/gnucash/
${RSYNC} /home/marksa/.config/gnucash/ /mhs2/dot-config/gnucash/
#${RSYNC} /etc/gnucash/ /mhs2/etc-gnc/ # >> needs sudo

# .local/share
${RSYNC} --exclude-from='/home/marksa/dev/rsync.seagate.exclude' ${HOME_DLS}/ ${SEAGATE}/.local/share/
${RSYNC} ${HOME_DLS}/ ${SAMSUNGT7}/local/share/

# python files
DEV_PYTHON=/home/marksa/dev/Python
${RSYNC} -f'- /VENV/' ${DEV_PYTHON}/ ${SEAGATE}/dev/Python/
${RSYNC} -f'- /VENV/' ${DEV_PYTHON}/ ${SAMSUNGT7}/dev/Python/
${RSYNC} -f'- /VENV/' ${DEV_PYTHON}/ /mhs2/dev-python/
GIT_PYTHON=/home/marksa/dev/git/Python
${RSYNC} ${GIT_PYTHON}/ ${SEAGATE}/git/Python/
${RSYNC} ${GIT_PYTHON}/ ${SAMSUNGT7}/dev/git/Python/
${RSYNC} ${GIT_PYTHON}/ /mhs2/git-python/

# write a log record
echo "auto-bak finish @ $(date)" >> /home/marksa/dev/logs/rsync.log
