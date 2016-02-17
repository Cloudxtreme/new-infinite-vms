#!/bin/bash
sed -i 's/#Port 22/Port 2221/g' /etc/ssh/sshd_config
sed -i 's/#PermitRootLogin no/PermitRootLogin no/g' /etc/ssh/sshd_config
sed -i 's/#PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config
sed -i 's/PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config
sed -i 's/#GatewayPorts no/GatewayPorts yes/g' /etc/ssh/sshd_config
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sed -i 's/# %wheel        ALL=(ALL)	ALL/%wheel        ALL=(ALL)	ALL/g' /etc/sudoers
/etc/init.d/sshd restart
