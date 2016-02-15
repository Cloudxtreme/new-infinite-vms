#! /bin/bash
mv /root/infinite-scripts/global_header.tar.gz /usr/local/cpanel/base/frontend/paper_lantern/global_header.tar.gz
tar -zxf /usr/local/cpanel/base/frontend/paper_lantern/global_header.tar.gz
rm /usr/local/cpanel/base/frontend/paper_lantern/global_header.tar.gz
mv /usr/local/cpanel/base/frontend/paper_lantern/global_header.html.tt /var/cpanel/customizations/includes/global_header.html.tt
