#! /bin/bash
$DIRECTORY=/usr/local/cpanel/base/3rdparty/phpMyAdmin/themes/infinite
if [ ! -d "$DIRECTORY" ]; then
cp -u /root/infinite-scripts/infinite-phpmyadmin.tar.gz /usr/local/cpanel/base/3rdparty/phpMyAdmin/themes/infinite-phpmyadmin.tar.gz
tar -zxf /usr/local/cpanel/base/3rdparty/phpMyAdmin/themes/infinite-phpmyadmin.tar.gz
rm /usr/local/cpanel/base/3rdparty/phpMyAdmin/themes/infinite-phpmyadmin.tar.gz
echo -n "$" >> /usr/local/cpanel/base/3rdparty/phpMyAdmin/config.inc.php
echo -n "cfg['ThemeDefault']= 'original';" >> /usr/local/cpanel/base/3rdparty/phpMyAdmin/config.inc.php
fi
