#!/bin/bash

# Copyright (c) 2021 Mark Sattolo <epistemik@gmail.com>

source "/home/marksa/dev/Python/VENV/venvcron/bin/activate"
echo $VIRTUAL_ENV

which python
which pip
pip list

python /home/marksa/git/Python/google/drive/driveAccess.py -s /home/marksa/git/Python/google/auto-bak/transfer -p gnucash -l /home/marksa/dev/logs
