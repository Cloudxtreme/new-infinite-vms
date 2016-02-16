#! /bin/bash
sed -i 's/PermitRootLogin no/PermitRootLogin without-password/g' /etc/ssh/sshd_config
sed -i 's/#PermitRootLogin yes/PermitRootLogin without-password/g' /etc/ssh/sshd_config
sed -i 's/#RSAAuthentication yes/RSAAuthentication yes/g' /etc/ssh/sshd_config
sed -i 's/#GatewayPorts no/GatewayPorts yes/g' /etc/ssh/sshd_config
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
/etc/init.d/sshd restart
