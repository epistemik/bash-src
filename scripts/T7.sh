#!/bin/bash

# Copyright (c) 2024 Mark Sattolo <epistemik@gmail.com>
# modified 2024-09-16

#  weekly backup of important home folders to the Samsung T7

RSYNC='rsync -aq'
HOME=/home/marksa
SAMSUNGT7=/media/marksa/T7/BACKUP

# log start
echo "T7 start @ $(date)" >> /home/marksa/dev/logs/rsync.log

${RSYNC} ${HOME}/.config/    ${SAMSUNGT7}/config/
${RSYNC} ${HOME}/.local/     ${SAMSUNGT7}/local/
${RSYNC} ${HOME}/apps/       ${SAMSUNGT7}/apps/
${RSYNC} ${HOME}/dev/        ${SAMSUNGT7}/dev/
${RSYNC} ${HOME}/Documents/  ${SAMSUNGT7}/Documents/
${RSYNC} ${HOME}/Downloads/  ${SAMSUNGT7}/Downloads/
${RSYNC} ${HOME}/Music/      ${SAMSUNGT7}/Music/
${RSYNC} ${HOME}/Pictures/   ${SAMSUNGT7}/Pictures/
${RSYNC} ${HOME}/Videos/     ${SAMSUNGT7}/Videos/
${RSYNC} ${HOME}/opt/        ${SAMSUNGT7}/opt/

# log finish
echo "T7 finish @ $(date)" >> /home/marksa/dev/logs/rsync.log
