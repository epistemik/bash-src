#!/bin/bash
################################################################################
#
# mhsatto@cse-cst.gc.ca
#
# $Id: bash.als,v 1.10 2010/09/16 18:36:20 mhsatto Exp $
#
################################################################################

# common
alias so=source
alias exp=export
alias EXP=export
alias m=more
alias cp='cp -p'
alias c=clear
alias del='rm -i'
alias hl='history |less'

# list files
alias ls='ls -F --color'
alias lsa='ls -A'
alias lsm='\ls -FC --color |more'
alias ll='ls -l |more'
alias la='ls -Al |more'
alias lal=la
alias lt='ls -Alt |more'
alias lf='ls -Al'
alias ct='ls -A |wc -w'

# directory stack
alias dv='dirs -v'
alias dl='dirs -l'
alias dvl='dirs -v -l'

# list aliases
alias alm='alias |more'
alias als='alias |less'

# processes
alias psu='ps o user,pid,ppid,start_time,bsdtime,args --heading -H -u $USER'
alias psf='ps o user,pri,pid,ppid,%cpu,%mem,rss,vsz,stat,start_time,bsdtime,args --heading -u $USER'
alias psp='ps o user,pri,pid,ppid,rss,vsz,cputime,cmd --heading -p '
alias psn='ps o user,pid,args -w -p '
alias k15='kill -s 15 '
alias k9='kill -s 9 '

# display
alias EC=echo
alias ec=echo

# folder navigation
alias up='go ..'
alias upp='go ../..'
alias uppp='go ../../..'
alias upppp='go ../../../..'
alias uppppp='go ../../../../..'

alias home='go ~'
alias mybin='go ~/bin'
alias mysrc='go ~/bin/src'
alias mydb='go ~/db'
alias mydev='go ~/dev'
alias myperl='go ~/dev/perl'

alias mta='go /opt/mta-pe/6.5.0'
alias mtal='go /opt/mta-linux-libs/6.5.0'

# list functions
alias fxn='declare -F | more'
alias fxnm=fxn
alias fxnf='declare -f | less'
alias fxnfl=fxnf

# rcs control
alias co='co -l'
alias ci='ci -u'
alias ciu='\ci -u '
alias cil='\ci -l '
alias cou='\co -u '
alias col='\co -l '

# dev
alias mk='make -f Mk.file '
alias diff='diff -s '

########################################
# END OF SCRIPT
BASHALS_LOADED='TRUE'
echo "LOADED bash.als"
# END OF SCRIPT
########################################
