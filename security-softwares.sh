#! /bin/bash
#maldet
cd /usr/local/src/
wget http://www.rfxn.com/downloads/maldetect-current.tar.gz
tar -xzf maldetect-current.tar.gz
cd maldetect-*
sh ./install.sh
ln -s /usr/local/cpanel/3rdparty/bin/clamscan /usr/local/bin/clamscan
ln -s /usr/local/cpanel/3rdparty/bin/freshclam /usr/local/bin/freshclam
sed -i 's/email_alert="0"/email_alert="1"/g' /usr/local/maldetect/conf.maldet
sed -i 's/email_addr="you@domain.com"/email_addr="root@localhost"/g' /usr/local/maldetect/conf.maldet
sed -i 's/scan_max_filesize="768k"/scan_max_filesize="1536k"/g' /usr/local/maldetect/conf.maldet
sed -i 's/quarantine_hits="0"/quarantine_hits="1"/g' /usr/local/maldetect/conf.maldet
sed -i 's/quarantine_clean="0"/quarantine_clean="1"/g' /usr/local/maldetect/conf.maldet

#rkhunter
cd /usr/local/src/
wget http://ncu.dl.sourceforge.net/project/rkhunter/rkhunter/1.4.2/rkhunter-1.4.2.tar.gz
tar -xvf rkhunter-1.4.2.tar.gz
cd rkhunter-1.4.2
./installer.sh --layout default --install

#chrootkit
cd ~
wget ftp://ftp.pangeia.com.br/pub/seg/pac/chkrootkit.tar.gz 
tar -xvf chkrootkit.tar.gz
cd chkrootkit-0.50
make sense

#sim
cd ~
wget http://www.rfxn.com/downloads/sim-current.tar.gz
tar -xvf sim-current.tar.gz
cd sim-3.0
./setup -i
