h51657
s 00022/00014/00047
d D 1.17 07/02/07 13:32:39 mhsatto 18 17
c add extra vars to keep track of different exe paths; make rm interactive by default and add rrm (really rm); add reverse formatting to "read .cshrc" mesg; etc
e
s 00004/00001/00057
d D 1.16 06/12/21 14:08:25 mhsatto 17 16
c add LD_LIBRARY_PATH for gcc/g++ ; add dinobot to xhost to replace megatron
e
s 00001/00001/00057
d D 1.15 05/05/05 11:37:10 mhsatto 16 15
c added megatron to xhost list
e
s 00007/00006/00051
d D 1.14 05/02/07 11:40:51 mhsatto 15 14
c change ~/bin/perl to ~/bin/perlbin; put main path before HOST and USER
e
s 00003/00003/00054
d D 1.13 04/12/14 16:51:56 mhsatto 14 13
c remove ~/refer/perl from path and add ~/bin/perl; change prompt to apwd from pwd
e
s 00013/00004/00044
d D 1.12 04/10/06 11:40:15 mhsatto 13 12
c add conditional structure to reading cals; add lisa and marge to xhost; define $USER; etc
e
s 00004/00008/00044
d D 1.11 04/09/22 14:08:30 mhsatto 12 10
c remove defunct FMHOME settings; modify p to use $HOST; add spawn, bart, etc to xhost line
e
s 00004/00008/00044
d R 1.11 04/09/22 12:14:14 mhsatto 11 10
c removed defunct "/usr/local/bin" from path; removed defunct FMHOME settings; modified p to use $HOST; added spawn, bart, etc to xhost line
e
s 00005/00004/00047
d D 1.10 04/06/15 13:42:03 mhsatto 10 9
c add /opt/TWWfsw and /usr/local/gnu directories to path; add /opt/TWWfsw/man to manpath; bump up savehist and history env values
e
s 00001/00002/00050
d D 1.9 04/03/17 12:03:45 mhsatto 9 8
c move mn to cals as morn; add gizmo to xhost line
e
s 00001/00001/00051
d D 1.8 04/01/22 14:22:00 mhsatto 8 7
c change alias of ls to /usr/bin/ls from default /usr/local/bin/ls which is now the gnu version and takes different parameters
e
s 00004/00004/00048
d D 1.7 03/12/08 14:42:58 mhsatto 7 6
c updated to new locations of default, gnu, and sun executables and man pages
e
s 00009/00008/00043
d D 1.6 03/05/30 10:44:04 mhsatto 6 5
c re-organized aliases between cshrc and cals and updated environment settings between love and pphost
e
s 00000/00003/00051
d D 1.5 03/04/10 16:23:58 mhsatto 5 4
c moved so, show, and setbox to cals
e
s 00006/00004/00048
d D 1.4 03/03/28 16:37:05 mhsatto 4 3
c fixed manpath setup and added Sunworkshop directories to MANPATH
e
s 00008/00000/00044
d D 1.3 03/03/12 16:01:50 mhsatto 3 2
c added sccs header info
e
s 00002/00002/00042
d D 1.2 03/03/12 16:00:26 mhsatto 2 1
c added /opt/SUNWspro/SC5.0/bin to path
e
s 00044/00000/00000
d D 1.1 03/03/11 09:31:53 mhsatto 1 0
c date and time created 03/03/11 09:31:53 by mhsatto
e
u
U
f e 0
t
T
I 1
#!/bin/csh
I 6

E 6
I 3
###################################################
I 6
#
E 6
#  Mark Sattolo (mhsatto@po.cse)
D 6
#  -------------------------------------------
E 6
I 6
# --------------------------------------------
E 6
#   File: %Z%%M%
#   Version: %I%
#   Last Update: %E% %U%
#
###################################################
E 3

D 13
if ( $?HOST == 0 ) setenv HOST `uname -n`
D 4
if ( $?MANPATH == 0 ) setenv MANPATH /usr/dt/man:/usr/man:/usr/openwin/share/man:/opt/solaris7/man
E 4

E 13
umask 026

I 15
D 18
set path = (~mhsatto/bin ~mhsatto/bin/perlbin /usr/bin /usr/local/bin /usr/dt/bin /usr/ccs/bin)
E 18
I 18
echo "orig path is $path"
set origpath = ($path)
set basepath = (~mhsatto/bin /usr/bin /usr/local/bin /usr/dt/bin /usr/sbin /usr/ccs/bin /usr/ucb)
set     path = ($basepath)
#echo "now path is $path"
E 18

E 15
I 13
if ( ${?HOST} == 0 ) setenv HOST `uname -n`
if ( ${?USER} == 0 ) setenv USER `whoami`

E 13
D 2
set path = (/usr/bin /usr/dt/bin /opt/solaris7/bin /usr/ccs/bin /bin /usr/xpg4/bin)
set path = ($path /usr/sbin /usr/openwin/bin /usr/ucb ~mhsatto/bin ~mhsatto/refer/perl)
E 2
I 2
D 7
set path = (~mhsatto/bin /opt/solaris7/bin /usr/bin /usr/dt/bin /usr/ccs/bin /bin /usr/xpg4/bin)
set path = ($path /opt/SUNWspro/SC5.0/bin /usr/sbin /usr/openwin/bin /usr/ucb ~mhsatto/refer/perl)
E 7
I 7
D 12
set path = (~mhsatto/bin /usr/local/bin /usr/bin /usr/dt/bin /usr/ccs/bin /usr/xpg4/bin)
E 12
I 12
D 14
set path = (~mhsatto/bin /usr/bin /usr/local/bin /usr/dt/bin /usr/ccs/bin /usr/xpg4/bin)
E 14
I 14
D 15
set path = (~mhsatto/bin ~mhsatto/bin/perl /usr/bin /usr/local/bin /usr/dt/bin /usr/ccs/bin)
E 14
E 12
D 10
set path = ($path /licensed/SUNWspro/bin /usr/sbin /usr/openwin/bin /usr/ucb ~mhsatto/refer/perl)
E 10
I 10
set path = ($path /licensed/SUNWspro/bin /usr/sbin /usr/local/gnu/bin /usr/local/gnu/sbin)
D 14
set path = ($path /opt/TWWfsw/bin /opt/TWWfsw/sbin /usr/openwin/bin /usr/ucb ~mhsatto/refer/perl)
E 14
I 14
set path = ($path /opt/TWWfsw/bin /opt/TWWfsw/sbin /usr/openwin/bin /usr/ucb /usr/xpg4/bin)
E 14
I 13

E 15
E 13
E 10
E 7
E 2
set noclobber
set filec
D 10
set savehist=200
set history=300
E 10
I 10
set savehist=300
set history=400
E 10

I 15
D 18
set path = ($path /licensed/SUNWspro/bin /usr/sbin /usr/local/gnu/bin /usr/local/gnu/sbin)
set path = ($path /opt/TWWfsw/bin /opt/TWWfsw/sbin /usr/openwin/bin /usr/ucb /usr/xpg4/bin)
E 18
I 18
set devpath = (/licensed/SUNWspro/bin /usr/local/gnu/bin /usr/local/gnu/sbin)
set    path = ($path $devpath)
set apppath = (/opt/TWWfsw/bin /opt/TWWfsw/sbin /usr/openwin/bin /usr/xpg4/bin)
set    path = ($path $apppath)
E 18

E 15
D 4
setenv	MANPATH	${MANPATH}:/opt/solaris7/GNU/gcc-2.95.2/man:/opt/solaris7/GNU/gzip-1.2.4a/man
E 4
I 4
D 7
setenv  MANPATH /usr/dt/man:/usr/man:/usr/openwin/share/man:/opt/SUNWspro/SC5.0/man:/opt/SUNWspro/man
setenv	MANPATH	${MANPATH}:/opt/solaris7/man:/opt/solaris7/GNU/gcc-2.95.2/man:/opt/solaris7/GNU/gzip-1.2.4a/man
E 7
I 7
setenv  MANPATH /usr/man:/usr/local/man:/usr/dt/man:/usr/local/gnu/man
D 10
setenv	MANPATH	${MANPATH}:/licensed/SUNWspro/man:/usr/openwin/man
E 10
I 10
setenv	MANPATH	${MANPATH}:/licensed/SUNWspro/man:/opt/TWWfsw/man:/usr/openwin/man
E 10
E 7

E 4
D 12
setenv	EDITOR	/usr/local/bin/nedit
E 12
I 12
setenv	EDITOR	~mhsatto/bin/nedit
E 12

I 17
D 18
# for some reason, gcc/g++ now does NOT work at all if this is not set!
E 18
I 18
# for some reason, gcc/g++ NOW (~Dec/2006) does NOT work at all if this is not set!
E 18
setenv  LD_LIBRARY_PATH  /usr/lib:/usr/local/lib

E 17
D 4
# FMHOME line added by the FrameMaker user's setup program
setenv FMHOME /opt/frame-5.5.6; set path=( $FMHOME/bin $path )
E 4
I 4
D 12
# added by the FrameMaker setup program
setenv FMHOME /opt/frame-5.5.6
D 6
set path=( $FMHOME/bin $path )
E 6
I 6
set path = ($path $FMHOME/bin)
E 6
E 4

E 12
D 8
alias	ls	'ls -F'
E 8
I 8
D 18
alias	ls	'/usr/bin/ls -F'
E 8
alias	c	clear
alias	m	more
D 6
alias	path	"echo $PATH | tr ':' '\n' "
alias	manpath	"echo $MANPATH | tr ':' '\n' "
alias	display	'echo $DISPLAY'
E 6
I 6
D 9
alias	mn	'cat -n \!* |more '
E 9
E 6
D 5
alias	so	'source'
alias	show	'pwd; ls -lt |more '
alias	setbox	'echo -n "]0; \!* " '
E 5
alias	h	'history 21'
D 6
alias	p	'set prompt = "[1;34;49m[${USER}@`uname -n`] `pwd` ! > [0m" '
E 6
alias	cd	'cd \!*; p'
D 6
alias	push	'pushd \!*; p'
alias	pop	'popd \!*; p'
E 6
I 6
alias	so	'source'
D 15
alias	del	'rm -i '
alias	socsh	'source ~/.cshrc '
E 15
I 15
alias	del	'rm -i'
alias	socsh	'source ~/.cshrc'
E 15
D 12
alias	p	'set prompt = "[1;34;49m[${USER}@`uname -n`] `pwd` ! > [0m" '
E 12
I 12
D 14
alias	p	'set prompt = "[1;34;49m[${USER}@${HOST}] `pwd` ! > [0m" '
E 14
I 14
alias	p	'set prompt = "[1;34;49m[${USER}@${HOST}] `apwd` ! > [0m" '
E 18
I 18
alias  ls	  '/usr/bin/ls -F'
alias  c	  clear
alias  m	  more
alias  h	  'history 21'
alias  cd	  'cd \!*; p'
alias  so	  'source'
alias  rm     'rm -i'
alias  rrm    \\rm
alias  del	  rm
alias  socsh  'source ~/.cshrc'
alias  p	  'set prompt = "[1;34;49m[${USER}@${HOST}] `apwd` ! > [0m" '
E 18
E 14
E 12
E 6

D 13
if ( -f ~mhsatto/bin/cals ) source ~mhsatto/bin/cals
E 13
I 13
if ( -f ~mhsatto/bin/cals ) then
  source ~mhsatto/bin/cals
else
    echo ~mhsatto/bin/cals does NOT exist!
endif
E 13

stty erase ^H werase ^W rprnt ^R flush ^Y

p

D 9
xhost pphost
E 9
I 9
D 12
xhost pphost gizmo
E 12
I 12
D 13
xhost pphost gizmo spawn bart nelson smithers homer
E 13
I 13
D 16
xhost pphost gizmo spawn bart nelson smithers homer marge lisa
E 16
I 16
D 17
xhost pphost gizmo spawn bart nelson smithers homer marge lisa megatron
E 17
I 17
xhost pphost gizmo spawn bart nelson smithers homer marge lisa megatron dinobot
E 17
E 16
E 13
E 12
E 9

D 18
echo "[${HOST}].cshrc has been read."
E 18
I 18
echo "[7m[${HOST}].cshrc has been read.[0m"
E 18
I 13

# END
######
E 13
E 1
