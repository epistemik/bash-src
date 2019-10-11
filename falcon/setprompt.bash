#!/bin/bash

RED="\[\e[31;1m\]"
GREEN="\[\e[32;1m\]"
YELLOW="\[\e[33;1m\]"
BLUE="\[\e[34;1m\]"
MAGENTA="\[\e[35;1m\]"
CYAN="\[\e[36;1m\]"
COLOR_RESET="\[\e[30;0m\]"
#  if [[ `whoami` == "mhsatto" ]];
#    then
#      if [[ `hostname` =~ "cse20100" ]];
#        then
          # regular host
#          HILITE=$GREEN
#          TXTFRAME=$YELLOW
#        else
          # remote host
          HILITE=$CYAN
          TXTFRAME=$MAGENTA
#     fi
#    else # NOT me
#      HILITE=$RED
#      TXTFRAME=$BLUE
#  fi
export PS1="${HILITE}\w${TXTFRAME} | ${HILITE}\d \t${TXTFRAME} | ${HILITE}\u@\h${TXTFRAME}\r\n${HILITE}\!${TXTFRAME} >$COLOR_RESET "

