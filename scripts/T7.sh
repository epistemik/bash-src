#!/bin/bash

# Copyright (c) 2025 Mark Sattolo <epistemik@gmail.com>
# modified 2025-12-06

# WEEKLY rsync BACKUP of important home folders to the Samsung T7 SSD drive

RSYNC='rsync -aqh --delete --ignore-errors'
HOME=/home/marksa
SAMSUNGT7=/media/marksa/SamT7/BACKUP

# log start
echo "T7 start @ $(date)" >> /home/marksa/dev/logs/rsync.log

${RSYNC} ${HOME}/.config/     ${SAMSUNGT7}/dot-config/
${RSYNC} ${HOME}/.local/      ${SAMSUNGT7}/dot-local/
${RSYNC} ${HOME}/apps/        ${SAMSUNGT7}/apps/
${RSYNC} ${HOME}/apps/        ${SAMSUNGT7}/bin/
${RSYNC} ${HOME}/dev/         ${SAMSUNGT7}/dev/
${RSYNC} ${HOME}/Documents/   ${SAMSUNGT7}/Desktop/
${RSYNC} ${HOME}/Documents/   ${SAMSUNGT7}/Documents/
${RSYNC} ${HOME}/Downloads/   ${SAMSUNGT7}/Downloads/
${RSYNC} ${HOME}/Music/       ${SAMSUNGT7}/Music/
${RSYNC} ${HOME}/Pictures/    ${SAMSUNGT7}/Pictures/
${RSYNC} ${HOME}/Pictures/    ${SAMSUNGT7}/Tech/
${RSYNC} ${HOME}/Videos/      ${SAMSUNGT7}/Videos/
${RSYNC} ${HOME}/opt/         ${SAMSUNGT7}/opt/

# log finish
echo "T7 finish @ $(date)" >> /home/marksa/dev/logs/rsync.log
