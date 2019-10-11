#!/usr/bin/bash
################################################################################
# 
# hra.bashrc
#
# HRA settings for git-bash
# 
################################################################################

# home machine: 167.43.235.31 
export WINDOWS_SILVER=GM4XK02-04B.corp.cse
# old home machine: 167.43.230.132 
export LINUX_GOLD=h74x6x1-03b.corp.cse

# DON'T WORK ON git-bash
# export MYIP=`hostname -i`
# export MYHOST=`hostname -s`

export HOMEHOST=$WINDOWS_SILVER

# set sorting env
export LC_ALL=C

# set shell options
shopt -s histappend histverify
HISTSIZE=2000

# set proper Python path
export PYTHONPATH=/c/git/MASTER/automation/ingest:/c/Users/mhsatto/AppData/Local/Programs/Python/Python36

# set Java Home
export JAVA_HOME=/c/Apps/jdk-11

# need proper java at top of path
export PATH=$JAVA_HOME/bin:$PATH

#eval ssh-agent /usr/bin/bash
echo `env |grep SSH`
if [ -z "$SSH_AUTH_SOCK" ] ; 
    then
        exec ssh-agent /usr/bin/bash -c "ssh-add /h/.ssh/id_rsa ; $0"
        exit
    else
        # modify prompt string
        PS1_OLD=$PS1
        # DOES NOT WORK! NEED TO EDIT /etc/profile.d/git-prompt.sh 
fi

#/usr/bin/ssh-add /h/.ssh/id_rsa
echo `/usr/bin/ssh-add -l`

export HRA_BASHRC=~/.bashrc
alias sohb='source $HRA_BASHRC'
 
# Functions and Aliases
source ~mhsatto/bin/hra.alfx

cd /h

########################################
# END OF SCRIPT
#
  HRA_BASHRC_LOADED='TRUE'
  echo "LOADED $HRA_BASHRC"
#
# END OF SCRIPT
########################################
