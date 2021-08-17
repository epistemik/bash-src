#!/bin/bash
################################################################################
#
# Mark Sattolo
# epistemik@gmail.com
#
################################################################################

# functions and aliases for root

# display parameters with each entry on a new line
list ()
{
    echo "$1" |tr ':' '\n'
}

binpath ()
{
    list $PATH
}

# list files -- with 'Alh' as default parameter
target ()
{
  if [[ $1 ]] ; then
    args="$1"
  else
      args="Alh"
  fi
  targ=`ls -Al | wc -l`
  page=($LINES - 4)
  if (( targ <= page ))
  then
      ls -$args
  elif (( targ <= (3*page) ))
  then
      ls -A
  else
      echo "$targ files in this folder"
  fi
}

# list files with most recently updated first
targett ()
{
  target 'Alt'
}
# run at every prompt
# PROMPT_COMMAND=targett

# go to a folder and list the contents
go ()
{
  if [[ $1 ]] ; then
    pushd "$1"
  else
        pushd
  fi
  targett ;
}
alias GO=go
alias go2='go +2'
alias go3='go +3'
alias go4='go +4'
alias go5='go +5'
alias go6='go +6'
alias go7='go +7'
alias go8='go +8'
alias go9='go +9'
alias go10='go +10'
alias go11='go +11'
alias go12='go +12'
alias go13='go +13'
alias go14='go +14'
alias go15='go +15'
alias go16='go +16'
alias go0='go -0'
alias go1='go -1'
alias gom2='go -2'
alias gom3='go -3'
alias gom4='go -4'
alias gom5='go -5'
alias gom6='go -6'
alias gom7='go -7'
alias gom8='go -8'
alias gom9='go -9'
alias gom10='go -10'
alias gom11='go -11'
alias gom12='go -12'
alias gom13='go -13'
alias gom14='go -14'
alias gom15='go -15'
alias gom16='go -16'

# return from current folder
rt ()
{
  if [[ $1 ]] ; then
      popd "$1"
  else
        popd
  fi
  targett ;
}
alias rtt='popd;rt'
alias rttt='popd;rtt'
alias rtttt='popd;rttt'
alias rttttt='popd;rtttt'

hgi ()
{
  history | grep -i "$1"
}

hd ()
{
  page=$(($LINES - 4))
  if [ $2 ]
    then
        head -n "$1" "$2"
    else
        head -n $page "$1"
  fi
}

egi ()
{
  env | grep -i "$1"
}

# common
alias path=binpath # function
alias l=ltf
alias m=more
alias o=less
alias cp='cp -p'
alias rm='rm -i'
alias md='mkdir -p'
alias dua='du -h --max-depth=1'
alias vi=vim
alias cdp='cd -P'
alias mx='chmod ugo+x'
alias dv='dirs -v'
alias home='cd ~; targett'

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

# display
alias EC=echo
alias ec=echo

# folder navigation
alias up='go ..'
alias upp='go ../..'
alias uppp='go ../../..'
alias upppp='go ../../../..'
alias uppppp='go ../../../../..'
