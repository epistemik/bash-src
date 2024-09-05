#!/bin/bash

# Copyright (c) 2024 Mark Sattolo <epistemik@gmail.com>
# modified 2024-09-04

# test spaces in bash variables

RSYNC='rsync -aq'
PYTHON=/home/marksa/dev/git/Python
SAMSUNGT7=/media/marksa/T7/BACKUP

${RSYNC} ${PYTHON}/misc/test/ ${SAMSUNGT7}/test/
