#! /bin/bash
mkdir /var/cpanel/customizations
mkdir /var/cpanel/customizations/styled
mv /root/infinite-scripts/temas-infinite.tar.gz /var/cpanel/customizations/styled/temas-infinite.tar.gz
tar -zvxf /var/cpanel/customizations/styled/temas-infinite.tar.gz -C /var/cpanel/customizations/styled/
rm -f /var/cpanel/customizations/styled/temas-infinite.tar.gz
rm -f /var/cpanel/customizations/styled/default_style
ln -s /var/cpanel/customizations/styled/Original /var/cpanel/customizations/styled/default_style
