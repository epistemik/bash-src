#!/bin/bash

# Copyright (c) 2025 Mark Sattolo <epistemik@gmail.com>
# modified 2025-11-06

# start the recurring sound to keep the speaker active
source "/home/marksa/dev/Python/VENV/venv313/bin/activate"
python /home/marksa/dev/git/Python/misc/test/sound_test.py &
deactivate
