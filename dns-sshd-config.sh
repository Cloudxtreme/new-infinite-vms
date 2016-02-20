#!/bin/bash
sed -i 's/#Port 22/Port 2222/g' /etc/ssh/sshd_config
sed -i 's/#PermitRootLogin no/PermitRootLogin no/g' /etc/ssh/sshd_config
sed -i 's/#PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config
sed -i 's/PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sed -i 's/# %wheel/%wheel/g' /etc/sudoers
/etc/init.d/sshd restart
