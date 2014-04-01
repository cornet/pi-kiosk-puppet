#!/bin/bash

# Exit on any error
set -e

# Check to make sure ip has been passed
if [ -z "$1" ] ; then
	echo "Usage: ./puppet-run.sh <ip address>"
	exit -1
fi

# IP Address passed on the command line as 1st argument
ip=$1

# Sync latest puppet tree over
rsync -v -a -e 'ssh' manifests modules pi@${ip}:/home/pi/puppet/

# Run puppet on the host
ssh pi@${1} 'sudo puppet apply --verbose --modulepath /home/pi/puppet/modules /home/pi/puppet/manifests/site.pp'
