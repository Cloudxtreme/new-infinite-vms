#!/bin/bash
echo "00 22 * * * /usr/local/maldetect/maldet -d" | tee -a /var/spool/cron/root
echo "10 22 * * * /usr/local/maldetect/maldet -u" | tee -a /var/spool/cron/root
echo "50 22 * * 0 /usr/local/maldetect/maldet -b -r /home?/?/public_html" | tee -a /var/spool/cron/root
echo "30 22 */3 * * /usr/local/maldetect/maldet -b -r /home?/?/public_html 7" | sudo tee -a /var/spool/cron/root
echo "20 22 * * * /usr/local/maldetect/maldet -b -r /home?/?/public_html 3" | sudo tee -a /var/spool/cron/root
echo "*/15 * * * * /usr/local/maldetect/maldet -b -r /home?/?/public_html 1 > /dev/null 2>&1" | tee -a /var/spool/cron/root
echo "0 22 1,15 * * (cd /root/chkrootkit-0.50; ./chkrootkit 2>&1)" | tee -a /var/spool/cron/root
echo "*/2 * * * * /usr/local/sim/bin/sim -q >> /dev/null" | tee -a /var/spool/cron/root
echo "* 0 * * * sh /root/infinite-scripts/whm-theme-changer.sh > /dev/null 2>&1" | tee -a /var/spool/cron/root
echo "* 0 * * * sh /root/infinite-scripts/filemanager-theme-changer.sh > /dev/null 2>&1" | tee -a /var/spool/cron/root
echo "* 0 * * * sh /root/infinite-scripts/phpMyAdmin-default-theme.sh > /dev/null 2>&1" | tee -a /var/spool/cron/root
echo "0 4 * * * mysqlcheck -Aos -u root > /dev/null" | tee -a /var/spool/cron/root
echo "30 0 * * 0 find /home/ -type f -name error_log -delete" | tee -a /var/spool/cron/root
echo "0 20 1,15 * * yum clean all" | tee -a /var/spool/cron/root
echo "0 2 1,15 * * reboot" | tee -a /var/spool/cron/root
echo "* 0,6,12,18 * * * sync; echo 3 > /proc/sys/vm/drop_caches" | tee -a /var/spool/cron/root
