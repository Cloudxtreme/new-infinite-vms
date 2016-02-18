#!/bin/bash
echo "00 22 * * * /usr/local/maldetect/maldet -d" | tee -a /var/spool/cron/root
echo "10 22 * * * /usr/local/maldetect/maldet -u" | tee -a /var/spool/cron/root
echo "30 22 */3 * * /usr/local/maldetect/maldet -b -r /home?/?/mail 7" | sudo tee -a /var/spool/cron/root
echo "20 22 * * * /usr/local/maldetect/maldet -b -r /home?/?/mail 3" | sudo tee -a /var/spool/cron/root
echo "50 22 * * 0 /usr/local/maldetect/maldet -b -r /home?/?/mail" | tee -a /var/spool/cron/root
echo "0 22 1,15 * * (cd /root/chkrootkit-0.50; ./chkrootkit 2>&1)" | tee -a /var/spool/cron/root
echo "*/2 * * * * /usr/local/sim/bin/sim -q >> /dev/null" | tee -a /var/spool/cron/root
echo "* 0 * * * sh /root/infinite-scripts/whm-theme-changer.sh > /dev/null 2>&1" | tee -a /var/spool/cron/root
echo "* 0 * * * sh /root/infinite-scripts/filemanager-theme-changer.sh > /dev/null 2>&1" | tee -a /var/spool/cron/root
echo "* 0 * * * sh /root/infinite-scripts/phpMyAdmin-default-theme.sh > /dev/null 2>&1" | tee -a /var/spool/cron/root
echo "0 4 * * * mysqlcheck -Aos -u root >> /dev/null" | tee -a /var/spool/cron/root
echo "0 * * * * sh /root/infinite-scripts/alcron.sh" | tee -a /var/spool/cron/root
echo "*/30 * * * * sh /root/infinite-scripts/eximrandomips.sh" | tee -a /var/spool/cron/root
echo "*/30 * * * * sh /root/infinite-scripts/eximrandomhelo.sh" | tee -a /var/spool/cron/root
echo "30 0 1,15 * * yum clean all" | tee -a /var/spool/cron/root
echo "0 4 1,15 * * reboot" | tee -a /var/spool/cron/root
