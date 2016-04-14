#!/bin/bash
yum install memcached libmemcached
service memcached start
chkconfig --levels 235 memcached on
/usr/local/bin/pecl install memcache
echo "extension=memcache.so" >> /usr/local/lib/php.ini
service httpd restart
