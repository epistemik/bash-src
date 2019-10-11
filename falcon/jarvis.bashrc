#!/usr/bin/bash
################################################################################
# 
# jarvis.bashrc
#
# bash settings for jarvis linux machines
# 
################################################################################

# home machine: 167.43.235.31 
export WINDOWS_SILVER=GM4XK02-04B.corp.cse
# old home machine: 167.43.230.132 
export LINUX_GOLD=h74x6x1-03b.corp.cse

export CURRENT_IP=`hostname -i`
export CURRENT_HOST=`hostname -s`
export CURRENT_DOMAIN=`hostname -d`

export HOME_HOST=$WINDOWS_SILVER

# set sorting env
export LC_ALL=C

# set shell options
shopt -s histappend histverify
HISTSIZE=2000

# set prompt
RED="\[\e[31;1m\]"
BR_RED="\[\e[91;1m\]"
GREEN="\[\e[32;1m\]"
BR_GREEN="\[\e[92;1m\]"
YELLOW="\[\e[33;1m\]"
BROWN="\[\e[93;1m\]"
BLUE="\[\e[34;1m\]"
BR_BLUE="\[\e[94;1m\]"
MAGENTA="\[\e[35;1m\]"
PURPLE="\[\e[95;1m\]"
AQUA="\[\e[36;1m\]"
CYAN="\[\e[96;1m\]"
WHITE="\[\e[37;1m\]"
LT_GREY="\[\e[97;1m\]"
DK_GREY="\[\e[90;1m\]"
BLACK="\[\e[30;0m\]"
COLOR_RESET=$BLACK
GIT=$BR_BLUE
if [[ $USER == "mhsatto" ]];
	then
	if [[ $CURRENT_HOST == *dev* || $CURRENT_HOST == *stg* ]];
		then
		# regular host
		HILITE=$BR_GREEN
		TXTFRAME=$BROWN
	else
		# PROD!!
		HILITE=$RED
		TXTFRAME=$BLUE
	fi
else # NOT me
	HILITE=$CYAN
	TXTFRAME=$MAGENTA
fi

git_branch()
{
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
git_div()
{
	if [[ $(git_branch) ]] ; then
		echo -n '|'
	fi
}
PS1="${HILITE}\w${TXTFRAME} | ${HILITE}\d \t${TXTFRAME} | ${HILITE}\u@\h${TXTFRAME} \$(git_div) ${GIT}\$(git_branch)\n${HILITE}\!${TXTFRAME} >$COLOR_RESET "

# set Python path to include ingest files
#export PYTHONPATH=/c/git/MASTER/automation/ingest

# set my src and bin
export MY_BIN=~/bin
export MY_SRC=$MY_BIN/src

# set Java Home
export JAVA_HOME=/usr/local/java/jdk1.8.0_112

# need proper java at top of path
export PATH=$MY_BIN:$JAVA_HOME/bin:$PATH

# ssh agent
eval $(ssh-agent -s)
ssh-add /home/mhsatto/.ssh/id_rsa
echo `/usr/bin/ssh-add -l`

# mount H drive
if [[ -d /media/driveh ]] ; then
	echo "H drive already mounted."
else
	eval $(/home/mhsatto/bin/driveh)
	echo "Mounted H drive."
fi

export JARVIS_BASHRC=~/.bashrc
alias sojb='source $JARVIS_BASHRC'
 
# Functions and Aliases
source $MY_SRC/jarvis.alfx

########################################
# END OF SCRIPT
#
  JARVIS_BASHRC_LOADED='TRUE'
  echo "LOADED $JARVIS_BASHRC"
#
# END OF SCRIPT
########################################
