#!/bin/bash
################################################################################
#
# Mark Sattolo
# epistemik@gmail.com
#
################################################################################

# set the acl for /dev/kvm that Android Studio needs to access AVDs
if [[ $(/usr/bin/getfacl /dev/kvm) =~ "marksa" ]]; then
    echo "Group 'marksa' ALREADY in /dev/kvm ACL."
else
	sudo setfacl -m g:marksa:rwx /dev/kvm
    echo "Group 'marksa' added to /dev/kvm ACL for Android."
fi

########################################
# END OF SCRIPT
ANDROID_ACL_LOADED="TRUE"
echo "CHECKED android_acl.sh"
# END OF SCRIPT
########################################
