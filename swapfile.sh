#!/bin/bash
dd if=/dev/zero of=/swapfile bs=1024 count=6000000
mkswap /swapfile
swapon /swapfile
chown root:root /swapfile
chmod 0600 /swapfile
echo -n "/swapfile" >> /etc/fstab
echo -e -n "\t" >> /etc/fstab
echo -n "swap" >> /etc/fstab
echo -e -n "\t" >> /etc/fstab
echo -n "swap" >> /etc/fstab
echo -e -n "\t" >> /etc/fstab
echo -n "discard,defaults" >> /etc/fstab
echo -e -n "\t" >> /etc/fstab
echo -n "0 0" >> /etc/fstab
echo -e -n "\n" >> /etc/fstab
echo "vm.swappiness=0" >> /etc/sysctl.conf
