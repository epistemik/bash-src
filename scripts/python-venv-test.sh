#!/bin/bash

# Copyright (c) 2021 Mark Sattolo <epistemik@gmail.com>

#  auto-bak script
# =================

MYHOME=/home/marksa
MYDEV=${MYHOME}/dev
GIT_PYTHON=${MYDEV}/git/Python
GOOGLE=${GIT_PYTHON}/google

export PYTHONPATH=${MYDEV}/Python/VENV/venv39_gnc-tag46/lib/python3.9:${MYDEV}/Python/VENV/venv39_gnc-tag46/lib/python3.9/lib-dynload:${MYDEV}/Python/VENV/venv39_gnc-tag46/lib/python3.9/site-packages
echo $PYTHONPATH

# sys.path = [
    # '/home/marksa/dev/Python/VENV/venv39_gnc-tag46/lib/python39.zip',
    # '/home/marksa/dev/Python/VENV/venv39_gnc-tag46/lib/python3.9',
    # '/home/marksa/dev/Python/VENV/venv39_gnc-tag46/lib/python3.9/lib-dynload',
  # ]

export PYTHONHOME=${MYDEV}/Python/VENV/venv39_gnc-tag46
echo $PYTHONHOME
set -e
source "${MYDEV}/Python/VENV/venv39_gnc-tag46/bin/activate"
echo $VIRTUAL_ENV
echo `which python`
echo `which pip`
echo `pip list`
echo `pip list`
python ${GOOGLE}/drive/driveAccess.py -s ${GOOGLE}/auto-bak/transfer -p gnucash -l /home/marksa/dev/logs
