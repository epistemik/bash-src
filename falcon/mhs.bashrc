#!/bin/bash

################################################################################
# 
# mhs.bashrc
#
# settings for bash
# 
################################################################################

# my current Linux desktop at LTA/P7.5.229
export HOMEHOST=940TK02-08d

# LTA home machine: MYIP=167.43.232.180 
export MYIP=`hostname -i`
export MYHOST=`hostname`

# set sorting env
export LC_ALL=C

# set shell options
shopt -s histappend histverify

# set prompt
    RED="\[\e[31;1m\]"
    GREEN="\[\e[32;1m\]"
    YELLOW="\[\e[33;1m\]"
    BLUE="\[\e[34;1m\]"
    MAGENTA="\[\e[35;1m\]"
    CYAN="\[\e[36;1m\]"
    COLOR_RESET="\[\e[30;0m\]"
    if [[ $USER == "mhsatto" ]];
      then
        if [[ $HOSTNAME =~ $HOMEHOST ]];
          then
            # regular host
            HILITE=$GREEN
            TXTFRAME=$YELLOW
          else
            # remote host
            HILITE=$CYAN
            TXTFRAME=$MAGENTA
        fi
      else # NOT me
        HILITE=$RED
        TXTFRAME=$BLUE
    fi
    export PS1="${HILITE}\w${TXTFRAME} | ${HILITE}\d \t${TXTFRAME} | ${HILITE}\u@\h${TXTFRAME}\r\n${HILITE}\!${TXTFRAME} >$COLOR_RESET "

# remember original path
if [ ! $HAVEORIGPATH ]
  then
    export ORIGPATH=$PATH  # save
    export HAVEORIGPATH='TRUE'
fi

# make sure my path folders are first
MYPATH=~/bin:~/apps/bin:/sbin
if [ ! $SET_MHSPAC_PATH ]
  then
    export PATH=$MYPATH:$ORIGPATH
    export SET_MHSPAC_PATH='TRUE'
fi

# remember original lib path
if [ $LD_LIBRARY_PATH ]
then
  if [ ! $HAVEORIGLIBPATH ]
    then
      export ORIGLIBPATH=$LD_LIBRARY_PATH  # save
      export HAVEORIGLIBPATH='TRUE'
  fi
fi
# reset libpath
MYLIBPATH=~/apps/lib
if [ ! $SET_MHSPAC_LIBPATH ]
  then
    if [ $HAVEORIGLIBPATH ]
      then
        export LD_LIBRARY_PATH=$MYLIBPATH:$ORIGLIBPATH
      else
        export LD_LIBRARY_PATH=$MYLIBPATH
    export SET_MHSPAC_LIBPATH='TRUE'
    fi
fi

 export MHSBASHRC=~mhsatto/bin/mhs.bashrc
 
################################################################################
#
# Functions and Aliases
#
################################################################################

 alias sopm='source $MHSBASHRC'

 source ~mhsatto/bin/pac.alfx
 
########################################
# END OF SCRIPT
#
  MHS_BASHRC_LOADED='TRUE'
  echo "LOADED mhs.bashrc"
#
# END OF SCRIPT
########################################
