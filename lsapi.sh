#!/bin/bash
yum install liblsapi liblsapi-devel --enablerepo=cloudlinux-updates-testing
yum install cpanel-mod-lsapi --enablerepo=cloudlinux-updates-testing
/usr/bin/switch_mod_lsapi --enable-global
sed -i 's/# lsapi_terminate_backends_on_exit On/lsapi_terminate_backends_on_exit Off/g' /usr/local/apache/conf/conf.d/lsapi.conf
sed -i 's/# lsapi_backend_accept_notify On/lsapi_backend_accept_notify On/g' /usr/local/apache/conf/conf.d/lsapi.conf
service httpd restart
