#! /bin/bash
mv /root/infinite-scripts/infinite-phpmyadmin.tar.gz /usr/local/cpanel/base/3rdparty/phpMyAdmin/themes/infinite-phpmyadmin.tar.gz
rmdir infinite-phpmyadmin.tar.gz
echo -n "$" >> /usr/local/cpanel/base/3rdparty/phpMyAdmin/config.inc.php
echo -n "cfg['ThemeDefault']= 'original';" >> /usr/local/cpanel/base/3rdparty/phpMyAdmin/config.inc.php
