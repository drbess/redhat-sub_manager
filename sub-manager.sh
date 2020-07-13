#!/bin/bash

# Author: dbess9
# 2020-07-10
#
# This script runs the Red Hat Subscription Manager Utility
#
echo " Bruh, are you root? Checking now"
# Make sure only root can run our script

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi
echo " ......................................................................."
subscription-manager role --set="Red Hat Enterprise Linux Server"
subscription-manager service-level --set="Standard"
subscription-manager usage --set="Development/Test"
subscription-manager attach
echo
echo "sub-manager configuration complete!"

