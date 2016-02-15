#! /bin/bash
mkdir /backup-disk
mkfs.ext4 -F /dev/sdb
mount -o discard,defaults /dev/sdb /backup-disk
