#!/bin/bash
/etc/init.d/iptables save
/etc/init.d/iptables stop
chkconfig iptables off
/etc/init.d/ip6tables save
/etc/init.d/ip6tables stop
chkconfig ip6tables off
