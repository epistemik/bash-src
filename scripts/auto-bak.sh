#!/bin/bash

# Copyright (c) 2022 Mark Sattolo <epistemik@gmail.com>

#  rsync my home folder to the Samsung drive
rsync -aq --exclude-from='/home/marksa/dev/rsync.samsung.exclude' /home/marksa/ /media/marksa/Samsung_T5/BACKUP/marksa/
#  rsync my home folder to the Seagate drive
SEAGATE=/home/marksa/Seagate/BACKUP/DIOMEDES/HOME
#rsync -aq --exclude-from='/home/marksa/dev/rsync.seagate.exclude' /home/marksa/ ${SEAGATE}/

#  rsync important information to the backup partition
HOME_GNC=/home/marksa/Documents/Financial/Gnucash
# gnucash data
rsync -aq ${HOME_GNC}/ /mhs2/FIN/Gnucash/
rsync -aq ${HOME_GNC}/ ${SEAGATE}/Documents/Financial/Gnucash/

# gnucash / metadata
HOME_DLS=/home/marksa/.local/share
rsync -aq ${HOME_DLS}/gnucash/ /mhs2/dot-local-share/gnucash/
rsync -aq ${HOME_DLS}/ ${SEAGATE}/.local/share/

# python files
PYTHON=/home/marksa/git/Python
rsync -aq ${PYTHON}/ ${SEAGATE}/git/Python/

# google dev files
rsync -aq ${PYTHON}/google/ /mhs2/Google/

# write a log record
date >> /home/marksa/dev/logs/rsync.log
