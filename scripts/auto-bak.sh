#!/bin/bash

# Copyright (c) 2022 Mark Sattolo <epistemik@gmail.com>

#  rsync my home folder to the Samsung drive
rsync -aq --exclude-from='/home/marksa/dev/rsync.exclude' /home/marksa/ /media/marksa/Samsung_T5/BACKUP/marksa/

#  rsync important information to the backup partition and Seagate drive
HOME_GNC=/home/marksa/Documents/Financial/Gnucash
SEAGATE=/home/marksa/Seagate/BACKUP/DIOMEDES/HOME

# gnucash data
rsync -aq ${HOME_GNC}/ /mhs2/FIN/Gnucash/
rsync -aq ${HOME_GNC}/ ${SEAGATE}/Documents/Financial/Gnucash/

# gnucash metadata
HOME_DLS=/home/marksa/.local/share
rsync -aq ${HOME_DLS}/gnucash/ /mhs2/dot-local-share/gnucash/
rsync -aq ${HOME_DLS}/gnucash/ ${SEAGATE}/dot-local-share/gnucash/

# google secret info
GOOGLE=/home/marksa/git/Python/google
rsync -aq ${GOOGLE}/ /mhs2/Google/
rsync -aq ${GOOGLE}/ ${SEAGATE}/git/Python/google/

# write a log record
date >> /home/marksa/dev/logs/rsync.log
