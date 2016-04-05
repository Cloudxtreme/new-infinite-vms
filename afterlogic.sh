#!/bin/bash
cd ~
wget http://www.afterlogic.org/download/webmail-panel-installer.tar.gz
tar -xzvf ./webmail-panel-installer.tar.gz
cd ./webmail-panel-installer
chmod a+x ./installer
./installer -t lite -a install
tar -zvxf /root/infinite-scripts/afterlogic-infinite.tar.gz -C /usr/local/cpanel/base/3rdparty/afterlogic/skins/
rm -f /root/infinite-scripts/afterlogic-infinite.tar.gz
sed -i '$i'\''themes'\'' => array('\''Original'\''),' /usr/local/cpanel/base/3rdparty/afterlogic/data/settings/config.php
sed -i 's/X-Priority/X-Prioridade/g' /usr/local/cpanel/base/3rdparty/afterlogic/libraries/MailSo/Mime/Enumerations/Header.php
