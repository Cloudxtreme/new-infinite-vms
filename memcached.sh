#! /bin/bash
yum install memcached libmemcached
service memcached start
chkconfig --levels 235 memcached on
pecl install memcache
service httpd restart
