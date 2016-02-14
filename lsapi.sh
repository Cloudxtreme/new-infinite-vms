#! /bin/bash
yum install liblsapi liblsapi-devel --enablerepo=cloudlinux-updates-testing
yum install cpanel-mod-lsapi --enablerepo=cloudlinux-updates-testing
/usr/bin/switch_mod_lsapi --enable-global
service httpd restart
