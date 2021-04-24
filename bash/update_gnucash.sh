#!/bin/bash
ULB_GNC=/usr/local/bak/gnc
GNC_HOME=/home/marksa/Documents/Financial/Gnucash
rm ${ULB_GNC}/HouseHold.gnucash.oldest
cp -p ${ULB_GNC}/HouseHold.gnucash.older ${ULB_GNC}/oldest
rm ${ULB_GNC}/HouseHold.gnucash.older
cp -p ${ULB_GNC}/HouseHold.gnucash.old ${ULB_GNC}/HouseHold.gnucash.older
rm ${ULB_GNC}/HouseHold.gnucash.old
cp -p ${ULB_GNC}/HouseHold.gnucash.bak ${ULB_GNC}/HouseHold.gnucash.old
rm ${ULB_GNC}/HouseHold.gnucash.bak
cp -p ${ULB_GNC}/HouseHold.gnucash ${ULB_GNC}/HouseHold.gnucash.bak
rm ${ULB_GNC}/HouseHold.gnucash
cp -p ${GNC_HOME}/HouseHold.gnucash ${ULB_GNC}/HouseHold.gnucash
PY_GNC_APPF=/newdata/dev/git/Python/Gnucash/app-files
rm ${PY_GNC_APPF}/trial.gnc
cp -p ${GNC_HOME}/HouseHold.gnucash ${PY_GNC_APPF}/trial.gnc
rm ${PY_GNC_APPF}/family.gnc
cp -p ${GNC_HOME}/HouseHold.gnucash ${PY_GNC_APPF}/family.gnc
rm ${PY_GNC_APPF}/main.gnc
cp -p ${GNC_HOME}/HouseHold.gnucash ${PY_GNC_APPF}/main.gnc
rm ${PY_GNC_APPF}/test.gnc
cp -p ${GNC_HOME}/HouseHold.gnucash ${PY_GNC_APPF}/test.gnc
# run from folder /newdata/dev/git/Python/Gnucash/app-files/
ls -Alt |more
