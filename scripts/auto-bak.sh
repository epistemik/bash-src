
#  auto-bak script
# =================

MYHOME=/home/marksa
HOME_GNC=${MYHOME}/Documents/Financial/Gnucash
SEAGATE=${MYHOME}/Seagate/BACKUP/DIOMEDES/marksa

# rsync folders
rsync -aq ${HOME_GNC}/ /mhs2/FIN/Gnucash/
rsync -aq ${HOME_GNC}/ ${SEAGATE}/Documents/Financial/Gnucash/

HOME_DLS=${MYHOME}/.local/share
rsync -aq ${HOME_DLS}/gnucash/ /mhs2/dot-local-share/gnucash/
rsync -aq ${HOME_DLS}/gnucash/ ${SEAGATE}/dot-local-share/gnucash/

GIT_PYTHON=${MYHOME}/dev/git/Python
GOOGLE=${GIT_PYTHON}/google
rsync -aq ${GOOGLE}/ /mhs2/Google/
rsync -aq ${GOOGLE}/ ${SEAGATE}/git/Python/google/

GNC_APPF=/home/marksa/dev/Gnucash/app-files
# send any newer hh.gnc or hh.gnc.gcm to Google drive
rm -f ${GNC_APPF}/hh.gnc
cp -p ${HOME_GNC}/HouseHold.gnucash ${GNC_APPF}/hh.gnc
rm -f ${GNC_APPF}/hh.gnc.gcm
cp -p ${HOME_DLS}/gnucash/books/HouseHold.gnucash.gcm ${GNC_APPF}/hh.gnc.gcm

for x in $(find /home/marksa/dev/Gnucash/app-files/ -type f -newer /home/marksa/dev/git/Python/google/auto-bak/ref-file -print); do cp $x /home/marksa/dev/git/Python/google/auto-bak/transfer/; done
# ?? export PYTHONPATH=/home/marksa/dev/Python/VENV/venv39_gnc-tag46/lib/python3.9/site-packages:$PYTHONPATH
${MYHOME}/dev/Python/VENV/venv39_gnc-tag46/bin/python ${GOOGLE}/drive/driveAccess.py -s ${GOOGLE}/auto-bak/transfer -p gnucash
mv -f ${GOOGLE}/auto-bak/transfer/* ${GOOGLE}/auto-bak/sent/
touch ${GOOGLE}/auto-bak/ref-file
