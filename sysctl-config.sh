#!/bin/bash
echo "vm.swappiness = 0" >> /etc/sysctl.conf
echo "kernel.panic = 10" >> /etc/sysctl.conf
echo "net.ipv4.conf.all.accept_source_route = 0" >> /etc/sysctl.conf
echo "net.ipv4.icmp_echo_ignore_broadcasts = 1" >> /etc/sysctl.conf
echo "net.ipv4.tcp_sack = 0" >> /etc/sysctl.conf
echo "net.ipv4.conf.all.accept_redirects= 0" >> /etc/sysctl.conf
echo "net.ipv4.conf.all.secure_redirects= 0" >> /etc/sysctl.conf
echo "net.ipv4.tcp_synack_retries = 2" >> /etc/sysctl.conf
echo "net.ipv4.conf.all.rp_filter= 1" >> /etc/sysctl.conf
echo "net.ipv4.conf.all.send_redirects= 0" >> /etc/sysctl.conf
echo "net.ipv4.conf.default.send_redirects= 0" >> /etc/sysctl.conf
echo "net.ipv4.conf.default.accept_redirects= 0" >> /etc/sysctl.conf
echo "net.ipv4.conf.default.secure_redirects= 0" >> /etc/sysctl.conf
echo "net.ipv4.ip_local_port_range= 1" >> /etc/sysctl.conf024 65000
echo "net.ipv4.tcp_fin_timeout = 20" >> /etc/sysctl.conf
echo "net.ipv4.tcp_tw_recycle= 0" >> /etc/sysctl.conf
echo "net.ipv4.tcp_tw_reuse= 1" >> /etc/sysctl.conf
echo "net.ipv4.tcp_no_metrics_save= 1" >> /etc/sysctl.conf
echo "net.ipv4.tcp_moderate_rcvbuf= 1" >> /etc/sysctl.conf 
echo "net.ipv4.tcp_window_scaling= 0" >> /etc/sysctl.conf
echo "net.ipv4.ipfrag_high_thresh = 512000" >> /etc/sysctl.conf
echo "net.ipv4.ipfrag_low_thresh = 446464" >> /etc/sysctl.conf
echo "net.ipv4.neigh.default.gc_thresh3 = 2048" >> /etc/sysctl.conf
echo "net.ipv6.conf.all.disable_ipv6= 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.default.disable_ipv6= 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.lo.disable_ipv6= 1" >> /etc/sysctl.conf
echo "net.ipv4.route.flush= 1" >> /etc/sysctl.conf
echo "net.ipv4.conf.all.bootp_relay= 0" >> /etc/sysctl.conf
echo "net.ipv4.tcp_timestamps= 1" >> /etc/sysctl.conf
echo "net.ipv4.tcp_rfc1337= 1" >> /etc/sysctl.conf
echo "kernel.sched_migration_cost_ns = 2500000" >> /etc/sysctl.conf
echo "kernel.exec-shield= 1" >> /etc/sysctl.conf
echo "kernel.randomize_va_space= 1" >> /etc/sysctl.conf
echo "fs.file-max = 200000" >> /etc/sysctl.conf
echo "net.core.rmem_max=8388608" >> /etc/sysctl.conf
echo "net.core.wmem_max=8388608" >> /etc/sysctl.conf
echo "net.core.rmem_default=65536" >> /etc/sysctl.conf
echo "net.core.wmem_default=65536" >> /etc/sysctl.conf
echo "net.ipv4.tcp_rmem=8192 873800 8388608" >> /etc/sysctl.conf
echo "net.ipv4.tcp_wmem=4096 655360 8388608" >> /etc/sysctl.conf
echo "net.ipv4.tcp_mem=8388608 8388608 8388608" >> /etc/sysctl.conf
echo "net.ipv4.tcp_max_tw_buckets=6000000" >> /etc/sysctl.conf
echo "net.ipv4.tcp_max_syn_backlog=65536" >> /etc/sysctl.conf
echo "net.ipv4.tcp_max_orphans=262144" >> /etc/sysctl.conf
echo "net.core.somaxconn = 16384" >> /etc/sysctl.conf
echo "net.core.netdev_max_backlog = 16384" >> /etc/sysctl.conf
echo "net.ipv4.tcp_synack_retries = 2" >> /etc/sysctl.conf
echo "net.ipv4.tcp_syn_retries = 2" >> /etc/sysctl.conf
echo "net.ipv4.tcp_slow_start_after_idle = 0" >> /etc/sysctl.conf
echo "net.ipv4.ip_local_port_range = 3000 65000" >> /etc/sysctl.conf
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
service saslauthd stop
chkconfig saslauthd off
service xinetd stop
chkconfig xinetd off
