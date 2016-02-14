#! /bin/bash
yum install liblsapi liblsapi-devel --enablerepo=cloudlinux-updates-testing
yum install cpanel-mod-lsapi --enablerepo=cloudlinux-updates-testing
/usr/bin/switch_mod_lsapi --enable-global
sudo sed -i 's/lsapi_terminate_backends_on_exit On/lsapi_terminate_backends_on_exit Off/g' /usr/local/apache/conf/mod_lsapi.conf
echo "lsapi_backend_accept_notify On" | tee -a /usr/local/apache/conf/mod_lsapi.conf
service httpd restart
