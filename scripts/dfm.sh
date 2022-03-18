#!/bin/bash

# Copyright (c) 2022 Mark Sattolo <epistemik@gmail.com>
# keep track of file system disk space

LOG_FILE=/home/marksa/dev/logs/dfm.log

date >> $LOG_FILE
df -m >> $LOG_FILE
