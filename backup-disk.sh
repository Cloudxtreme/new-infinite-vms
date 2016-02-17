#!/bin/bash
mkdir /backup-disk
mkfs.ext4 -F /dev/sdb
mount -o discard,defaults /dev/sdb /backup-disk
echo -n "/dev/sdb" >> /etc/fstab
echo -e -n "\t" >> /etc/fstab
echo -n "/backup-disk" >> /etc/fstab
echo -e -n "\t" >> /etc/fstab
echo -n "ext4" >> /etc/fstab
echo -e -n "\t" >> /etc/fstab
echo -n "discard,defaults" >> /etc/fstab
echo -e -n "\t" >> /etc/fstab
echo -n "0 0" >> /etc/fstab
echo -e -n "\n" >> /etc/fstab
