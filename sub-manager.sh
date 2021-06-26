#!/bin/bash

# Author: Devsol
# 2020-07-10
#
######################
# Updated: 2021-06-26#
######################
#
# This script runs the Red Hat Subscription Manager Utility
#
echo " My boi! Are you root? Checking now"
# Making sure user is root

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi
echo " ......................................................................."
subscription-manager role --set="Red Hat Enterprise Linux Server"
sleep 3
subscription-manager service-level --set="Standard"
sleep 3
subscription-manager usage --set="Development/Test"
sleep 3
subscription-manager attach
sleep 10
echo "sub-manager configuration complete!"

