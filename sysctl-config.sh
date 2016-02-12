#! /bin/bash
echo "kernel.panic=10" >> /etc/sysctl.conf
echo "kernel.user_ptrace=0" >> /etc/sysctl.conf
echo "net.ipv4.conf.all.accept_source_route=0" >> /etc/sysctl.conf
echo "net.ipv4.icmp_echo_ignore_broadcasts=1" >> /etc/sysctl.conf
echo "kernel.sysrq=0" >> /etc/sysctl.conf
echo "net.ipv4.tcp_sack=0" >> /etc/sysctl.conf
sysctl -e -p
service cups stop
chkconfig cups off
service nfslock stop
chkconfig nfslock off
service rpcidmapd stop
chkconfig rpcidmapd off
service portreserve stop
chkconfig portreserve off
service rpcbind stop
chkconfig rpcbind off
EOF
