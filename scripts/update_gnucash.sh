#!/bin/bash

ULB_GNC=/usr/local/bak/gnc
GNC_HOME=/home/marksa/Documents/Financial/Gnucash
rm ${ULB_GNC}/HouseHold.gnucash.oldest
cp -p ${ULB_GNC}/HouseHold.gnucash.older ${ULB_GNC}/HouseHold.gnucash.oldest
rm ${ULB_GNC}/HouseHold.gnucash.older
cp -p ${ULB_GNC}/HouseHold.gnucash.old ${ULB_GNC}/HouseHold.gnucash.older
rm ${ULB_GNC}/HouseHold.gnucash.old
cp -p ${ULB_GNC}/HouseHold.gnucash.ark ${ULB_GNC}/HouseHold.gnucash.old
rm ${ULB_GNC}/HouseHold.gnucash.ark
cp -p ${ULB_GNC}/HouseHold.gnucash.bak ${ULB_GNC}/HouseHold.gnucash.ark
rm ${ULB_GNC}/HouseHold.gnucash.bak
cp -p ${ULB_GNC}/HouseHold.gnucash ${ULB_GNC}/HouseHold.gnucash.bak
rm ${ULB_GNC}/HouseHold.gnucash
cp -p ${GNC_HOME}/HouseHold.gnucash ${ULB_GNC}/HouseHold.gnucash

GNC_APPF=/home/marksa/dev/Gnucash/app-files
GNC_APPF_BK=${GNC_APPF}/bak
rm ${GNC_APPF_BK}/xx.gnc
cp -p ${GNC_APPF_BK}/hh5.gnc ${GNC_APPF_BK}/xx.gnc
rm ${GNC_APPF_BK}/hh5.gnc
cp -p ${GNC_APPF_BK}/hh4.gnc ${GNC_APPF_BK}/hh5.gnc
rm ${GNC_APPF_BK}/hh4.gnc
cp -p ${GNC_APPF_BK}/hh3.gnc ${GNC_APPF_BK}/hh4.gnc
rm ${GNC_APPF_BK}/hh3.gnc
cp -p ${GNC_APPF_BK}/hh2.gnc ${GNC_APPF_BK}/hh3.gnc
rm ${GNC_APPF_BK}/hh2.gnc
cp -p ${GNC_APPF_BK}/hh1.gnc ${GNC_APPF_BK}/hh2.gnc
rm ${GNC_APPF_BK}/hh1.gnc
cp -p ${GNC_APPF_BK}/hh.gnc ${GNC_APPF_BK}/hh1.gnc
rm ${GNC_APPF_BK}/hh.gnc
cp -p ${GNC_APPF_BK}/main.gnc ${GNC_APPF_BK}/hh.gnc
rm ${GNC_APPF_BK}/main.gnc
cp -p ${GNC_HOME}/HouseHold.gnucash ${GNC_APPF_BK}/main.gnc

rm ${GNC_APPF}/main.gnc
cp -p ${GNC_HOME}/HouseHold.gnucash ${GNC_APPF}/main.gnc
rm ${GNC_APPF}/family.gnc
cp -p ${GNC_HOME}/HouseHold.gnucash ${GNC_APPF}/family.gnc

/usr/bin/rsync -aq ${GNC_APPF}/ /home/marksa/Seagate/BACKUP/DIOMEDES/marksa/dev/Gnucash/app-files/

# run from folder $GNC_APPF
ls -Alt |more
