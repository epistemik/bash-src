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
alias mx='chmod ugo+x'
alias ct='ls -dl * |wc -l'
alias dv='dirs -v'
alias diff='diff -s'

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
alias l='ls -dlt * |more'
alias ll='ls -dlt *'
alias lh='ls -dlh * |more'
alias llh='ls -hdl *'
alias lf='ls -dl * |more'
alias llf='ls -dl *'
alias lt='ls -dlht * |more'
alias llt='ls -dlht *'

# list aliases
alias alm='alias |more'
alias als='alias |less'

# system info
alias osrel='cat /etc/os-release'
alias modlist=lsmod
alias lsbrel='lsb_release -a'
alias ntsh='sudo lshw -C network'

# dev
alias suh='sudo -H'
alias py27='python2.7'
alias py3='python3'
alias py36='python3.6'
alias py37='python3.7'
alias py38='python3.8'
alias py39='python3.9'
alias pyu='python3 -u'
alias py3u=pyu
alias pypath='echo $PYTHONPATH'

# processes
alias from='free -om'
alias k9='kill -s 9'
alias k15='kill -s 15'
alias psu='ps o user,pid,ppid,start_time,bsdtime,args --heading -H -u $USER'
alias psm='psu |more'
alias psl='psu |less'
alias psf='ps o user,pri,pid,ppid,%cpu,%mem,rss,vsz,stat,start_time,bsdtime,args --heading -u $USER'
alias psfl='psf |less'
alias psfm='psf |more'
alias psp='ps o user,pri,pid,ppid,%cpu,%mem,rss,vsz,cputime,cmd --heading -p'
alias psn='ps o user,pid,args -w -p'

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

########################################
# END OF SCRIPT
BASHALS_LOADED='TRUE'
echo "LOADED $HOME/.bashals"
# END OF SCRIPT
########################################
