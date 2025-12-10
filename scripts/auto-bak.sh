#!/bin/bash

# Copyright (c) 2025 Mark Sattolo <epistemik@gmail.com>
# modified 2025-12-06

# DAILY backups with rsync
RSYNC='rsync -aqh --delete --ignore-errors'

#  rsync important information to backup locations
HOME_GNC=/home/marksa/Documents/Financial/Gnucash
HOME_DLS=/home/marksa/.local/share
SAMSUNGT5=/media/marksa/SamT5/BACKUP/marksa
SAMSUNGT7=/media/marksa/SamT7/BACKUP

#  rsync my home folder to the Samsung T5
${RSYNC} --exclude-from='/home/marksa/dev/rsync.samsung.exclude' /home/marksa/ ${SAMSUNGT5}/

# gnucash data
${RSYNC} ${HOME_GNC}/ /mhs2/FIN/Gnucash/
${RSYNC} ${HOME_GNC}/ ${SAMSUNGT7}/Documents/Financial/Gnucash/
${RSYNC} /home/marksa/dev/Gnucash/ ${SAMSUNGT7}/dev/Gnucash/
# gnucash metadata
${RSYNC} ${HOME_DLS}/gnucash/ /mhs2/dot-local/share/gnucash/
${RSYNC} /home/marksa/.config/gnucash/ /mhs2/dot-config/gnucash/
${RSYNC} /home/marksa/.config/gnucash/ ${SAMSUNGT7}/config/gnucash/
${RSYNC} /home/marksa/opt/etc/gnucash/ /mhs2/opt/etc/gnucash/
${RSYNC} /home/marksa/opt/etc/gnucash/ ${SAMSUNGT7}/opt/etc/gnucash/

# .local/share
${RSYNC} ${HOME_DLS}/ ${SAMSUNGT7}/local/share/

# python files
DEV_PYTHON=/home/marksa/dev/Python
${RSYNC} -f'- /VENV/' ${DEV_PYTHON}/ /mhs2/dev-python/
${RSYNC} -f'- /VENV/' ${DEV_PYTHON}/ ${SAMSUNGT7}/dev/Python/
GIT_PYTHON=/home/marksa/dev/git/Python
${RSYNC} ${GIT_PYTHON}/ /mhs2/git-python/
${RSYNC} ${GIT_PYTHON}/ ${SAMSUNGT7}/dev/git/Python/

# write a log record
echo "auto-bak finish @ $(date)" >> /home/marksa/dev/logs/rsync.log
