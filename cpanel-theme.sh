#! /bin/bash
mkdir /var/cpanel/customizations
mkdir /var/cpanel/customizations/styled
mv /root/infinite-scripts/temas-infinite.tar.gz /var/cpanel/customizations/styled/temas-infinite.tar.gz
tar -zvxf /var/cpanel/customizations/styled/temas-infinite.tar.gz
rm /var/cpanel/customizations/styled/temas-infinite.tar.gz
ln -s /var/cpanel/customizations/styled/Original default_style
