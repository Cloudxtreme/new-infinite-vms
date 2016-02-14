#! /bin/bash
echo "00 22 * * * /usr/local/maldetect/maldet -d" | tee -a /var/spool/cron/root
echo "10 22 * * * /usr/local/maldetect/maldet -u" | tee -a /var/spool/cron/root
echo "20 22 * * * /usr/local/maldetect/maldet -b -r /home?/?/public_html 3" | sudo tee -a /var/spool/cron/root
echo "*/30 * * * * /usr/local/maldetect/maldet -b -r /home?/?/public_html 1 > /dev/null 2>&1" | tee -a /var/spool/cron/root
echo "0 * * 0 /usr/local/maldetect/maldet -b -r /home?/?/public_html" | tee -a /var/spool/cron/root
echo "* * 1,15 * * (cd /root/chkrootkit-0.50; ./chkrootkit 2>&1)" | tee -a /var/spool/cron/root
echo "*/2 * * * * /usr/local/sim/bin/sim -q >> /dev/null" | tee -a /var/spool/cron/root
echo "* 0 * * * sh /root/infinite-scripts/whm-theme-changer.sh > /dev/null 2>&1" | tee -a /var/spool/cron/root
echo "* 0 * * * sh /root/infinite-scripts/filemanager-theme-changer.sh > /dev/null 2>&1" | tee -a /var/spool/cron/root
echo "0 4 * * * mysqlcheck -Aos -u root > /dev/null" | tee -a /var/spool/cron/root
