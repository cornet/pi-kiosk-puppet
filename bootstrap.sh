#!/bin/bash

set -e

echo ""
echo " ***********************************"
echo " * Kiosk Bootstrap...              *"
echo " ***********************************"
echo ""

echo " * Disabling raspi-config..."
if [ -e /etc/profile.d/raspi-config.sh ]; then
  rm -f /etc/profile.d/raspi-config.sh
  sed -i /etc/inittab \
    -e "s/^#\(.*\)#\s*RPICFG_TO_ENABLE\s*/\1/" \
    -e "/#\s*RPICFG_TO_DISABLE/d"
  telinit q
fi

echo " * Updating apt-get..."
apt-get update --fix-missing
echo ""

echo " * Installing puppet..."
apt-get install -y puppet rsync
echo ""

NEW_HOSTNAME="raspberrypi-$(facter macaddress_eth0 | sed 's/:/-/g').admin"

echo " * Setting hostname to ${NEW_HOSTNAME}..."
echo "${NEW_HOSTNAME}" > /etc/hostname
echo "127.0.0.1 ${NEW_HOSTNAME}" >> /etc/hosts
/bin/hostname -F /etc/hostname
echo ""
