#!/bin/bash

# Copyright (c) 2021 Mark Sattolo <epistemik@gmail.com>

#  rsync to backup partition and Seagate drive
# =============================================

HOME_GNC=/home/marksa/Documents/Financial/Gnucash
SEAGATE=/home/marksa/Seagate/BACKUP/DIOMEDES/marksa

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
