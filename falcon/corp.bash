#!/bin/bash
#################################################################
### first cut  		KRR  	Tue Nov  4 13:45:47 EST 2014
### fix mount point 	KRR  	Wed Nov  5 09:56:42 EST 2014
### minor changes 	jjouell Wed Nov  5 12:15:02 EST 2014
###
### Try to gracefully map a users H: drive
### don't check for arguments, do basic sanity checks/testing
#################################################################

### formating stuff
bold=$(tput bold)
off=$(tput sgr0)
tput clear

### sanity check
mount | grep /media/corp  >/dev/null 2>&1
if [ $? -eq 0 ]; then
   tput cup 4 6
   echo "error: /media/corp already mounted"
   tput cup 5 6
   echo "suggest: sudo umount /media/corp"
   tput cup 8 1 
   exit 1
fi

user=$USER
uid=`id -u $user`
gid=`id -g $user`
echo -n "${bold}\\corp${off} - Mapping User:$user uid:$uid gid:$gid to /media/corp"

tput cup 2 0
sudo mkdir -p /media/corp 
sudo mount -t cifs //corp.cse/Shares/ /media/corp -o username=$user,uid=$uid,gid=$gid,file_mode=0700,dir_mode=0700,nounix #>/dev/null 2>&1

if [ $? -ne 0 ]; then
   tput cup 6 6
   echo "${bold}ERROR:${off} Apologies something went wrong while trying to access your corp"
   tput cup 8 6
   echo "Please retry or contact the ${bold}COPCC STAFF Support Team${off}"
   tput cup 10 0
   exit
else
   tput cup 4 0
   echo "${bold}SUCCESS!${off} /media/corp mounted"
   tput cup 6 0
fi
tput cup 8 0

