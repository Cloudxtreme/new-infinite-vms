#!/bin/bash
cd /usr/src
rm -fv csf.tgz
wget https://download.configserver.com/csf.tgz
tar -xzf csf.tgz
cd csf
sh install.sh
perl /usr/local/csf/bin/csftest.pl
yum -y install perl-GDGraph bind-utils unzip perl-libwww-perl sendmail
