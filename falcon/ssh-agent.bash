#!/usr/bin/bash
################################################################################
# 
# ssh-agent.bashrc
#
# set up ssh-agent on login on jarvis linux machines
# 
################################################################################

# echo `env |grep SSH`
# if [ -z "$SSH_AUTH_SOCK" ] ; then
	# exec ssh-agent bash -c "ssh-add /home/mhsatto/.ssh/id_rsa ; $0"
	# exit
# fi

eval $(ssh-agent -s)
ssh-add /home/mhsatto/.ssh/id_rsa
