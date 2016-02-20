#!/bin/bash
directory=/usr/local/cpanel/base/3rdparty/phpMyAdmin/themes/infinite
config_file=/usr/local/cpanel/base/3rdparty/phpMyAdmin/config.inc.php
old="?>"
new="$cfg['ThemeDefault']= 'original'; ?>"
if [ ! -d "$directory" ]; then
tar -zvxf /root/infinite-scripts/infinite-phpmyadmin.tar.gz -C /usr/local/cpanel/base/3rdparty/phpMyAdmin/themes/
sed -r -i -e "s|$old|$new|g" $config_file;
fi
