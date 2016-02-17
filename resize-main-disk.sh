#!/bin/bash
apt-get update
yum -y install epel-release
yum -y install cloud-init cloud-initramfs-tools dracut-modules-growroot cloud-utils-growpart
rpm -qa kernel | sed -e 's/^kernel-//' | xargs -I {} dracut -f /boot/initramfs-{}.img {}
reboot
