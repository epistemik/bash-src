#!/bin/bash
################################################################################
#
# Mark Sattolo
# epistemik@gmail.com
#
################################################################################

# common
alias path=binpath # function
alias so=source
alias exp=export
alias EXP=export
alias m=more
alias o=less
alias cp='cp -p'
alias c=clear
alias del='rm -i'
alias hl='history |less'
alias md='mkdir -p'
alias dua='du -h --max-depth=1'
alias vi=vim
alias cdp='cd -P'
alias mx='chmod ug+x'

# git
alias gts='git status'
alias gtl='git log'
alias gtp='git push'
alias gtpl='git pull'
alias gtb='git branch'
alias gtr='git remote -v'
alias gcam='git commit -a -m'
alias gcm='git commit -m'

# list files
alias ls='ls --color'
alias lsa='ls -A'
alias lsm='\ls -FC --color |more'
alias ll='ls -hl'
alias llf='ls -Al'
alias llm='ls -hl |more'
alias la='ls -Ahl |more'
alias lal=la
alias lt='ls -Alht |more'
alias ltd='ls -lt'
alias ltf='ls -Alt |more'
alias lf='ls -Adlh'
alias ct='ls -A |wc -w'

# directory stack
alias dv='dirs -v'
alias dl='dirs -l'
alias dvl='dirs -v -l'

# list aliases
alias alm='alias |more'
alias als='alias |less'

# release
alias osrel='cat /etc/os-release'
alias unama='uname -a'
alias lsbrel='lsb_release -a'

# dev
alias suh='sudo -H'
alias py27='python2.7'
alias py3='python3'
alias py36='python3.6'
alias py38='python3.8'
alias py39='python3.9'
alias pyu='python -u'
alias py3u='python3 -u'
alias pypath='echo $PYTHONPATH'

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

alias home='to ~'
alias mybin='to ~/bin'
alias mysrc='to ~/bin/src'
alias mydev='to ~/dev'
alias mygit='go ~/dev/git'
alias myopt='go ~/opt'
alias mypy='go ~/dev/Python'
alias myjava='go ~/dev/Java'
alias mygnc='go ~/dev/Gnucash'

# list declared functions
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

# networks
# lsusb
alias ntsh='sudo lshw -C network'

########################################
# END OF SCRIPT
BASHALS_LOADED='TRUE'
echo "LOADED $HOME/.bashals"
# END OF SCRIPT
########################################
