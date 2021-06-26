#!/bin/bash

# A script that will unregister and re-registar your RHEL system
# This script should fix any errors related to running dnf-yum update/upgrade 

####################
# Author: dbess    #
# Date: 2021-06-22 #
####################

# Here are the variables
ROOT_UID=0
LINES=50
E_XCD=86
E_NOTROOT=87

# Are you root?
if [ "$UID" -ne "$ROOT_UID" ]
then
  echo "Must be root to run this script."
  exit $E_NOTROOT
fi
echo "################################### "
echo "Ok unregistering ..."
echo "################################### "
sleep 3
subscription-manager remove --all
subscription-manager unregister
subscription-manager clean

# Re-register the system

subscription-manager register

subscription-manager refresh

# Search for the Pool ID

subscription-manager list --available
sleep 5
# Attach to subscription

# sudo subscription-manager attach --pool=<Pool-ID>

# Cleanup dnf and cache

dnf clean all
rm -r /var/cache/dnf

# Update the resources
dnf upgrade
echo "Done!"
