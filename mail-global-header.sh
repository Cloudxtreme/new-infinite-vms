#! /bin/bash
mv /root/infinite-scripts/mail_global_header.tar.gz /usr/local/cpanel/base/frontend/paper_lantern/mail_global_header.tar.gz
tar -zvxf /usr/local/cpanel/base/frontend/paper_lantern/mail_global_header.tar.gz -C /usr/local/cpanel/base/frontend/paper_lantern/
rm -f /usr/local/cpanel/base/frontend/paper_lantern/mail_global_header.tar.gz
mkdir /var/cpanel/customizations/includes
mv /usr/local/cpanel/base/frontend/paper_lantern/global_header.html.tt /var/cpanel/customizations/includes/global_header.html.tt
