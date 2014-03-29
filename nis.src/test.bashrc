#!/bin/bash

# set prompt with colors
#export PS1="\[\e[36;1m\]\u@\[\e[32;1m\]\H \[\e[34;1m\]\w > \[\e[0m\]"

# set prompt with colors AND setting window bar
export PS1="\[\e]2;\u@\H \w\a\e[32;1m\] > \[\e[0m\]"
