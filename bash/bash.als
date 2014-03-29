#!/bin/bash
################################################################################
#
# mhsatto@cse-cst.gc.ca
#
# $Id: //depot/src/bash/bash.als#9 $
#
################################################################################

# common
alias so=source
alias exp=export
alias EXP=export
alias m=more
alias o=less
alias cp='cp -p'
alias c=clear
alias del='rm -i'
alias hl='history |less'

# list files
alias ls='ls --color'
alias lsa='ls -A'
alias lsm='\ls -FC --color |more'
alias ll='ls -Adhl'
alias la='ls -Ahl |more'
alias lal=la
alias lt='ls -Alht |more'
alias lf='ls -Alh'
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
alias psm='psu |more'
alias psl='psu |less'
alias psf='ps o user,pri,pid,ppid,%cpu,%mem,rss,vsz,stat,start_time,bsdtime,args --heading -u $USER'
alias psfl='psf |less'
alias psfm='psf |more'
alias psp='ps o user,pri,pid,ppid,%cpu,%mem,rss,vsz,cputime,cmd --heading -p'
alias psn='ps o user,pid,args -w -p'
alias k15='kill -s 15'
alias k9='kill -s 9'
alias from='free -om'

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
alias mydev='go ~/dev'
alias myperl='go ~/dev/perl'
alias myjava='go ~/dev/java'

# list functions
alias fxn='declare -F | more'
alias fxnm=fxn
alias fxnf='declare -f | less'
alias fxnfl=fxnf

# mplayer
alias mp=mplayer
alias gmp=gmplayer
alias mpq='mplayer -quiet'
alias gmpq='gmplayer -quiet'
alias mprq='mplayer -really-quiet'
alias gmprq='gmplayer -really-quiet'
alias mpss='mplayer -vf screenshot'
alias gmpss='gmplayer -vf screenshot'
alias mpbm='mplayer -benchmark'
alias gmpbm='gmplayer -benchmark'

# rcs control
alias co='co -l'
alias ci='ci -u'
alias ciu='\ci -u'
alias cil='\ci -l'
alias cou='\co -u'
alias col='\co -l'

# dev
alias modlist=lsmod
alias mk='make -f Mk.file'
alias diff='diff -s'

########################################
# END OF SCRIPT
BASHALS_LOADED='TRUE'
echo "LOADED bash.als"
# END OF SCRIPT
########################################

