#!/bin/bash
yum -y install cronie
service crond start
chkconfig crond on
touch /var/spool/cron/root
echo "00 22 */3 * * /usr/local/maldetect/maldet -d > /dev/null 2>&1" | tee -a /var/spool/cron/root
echo "10 22 */3 * * /usr/local/maldetect/maldet -u > /dev/null 2>&1" | tee -a /var/spool/cron/root
echo "30 22 */3 * * /usr/local/maldetect/maldet -a > /dev/null 2>&1" | tee -a /var/spool/cron/root
echo "00 23 1,15 * * (cd /root/chkrootkit-0.50; ./chkrootkit 2>&1)" | tee -a /var/spool/cron/root
echo "*/2 * * * * sh /root/infinite-scripts/proxy-curl-check.sh > /dev/null 2>&1" | tee -a /var/spool/cron/root
echo "30 2 1,15 * * yum clean all > /dev/null 2>&1" | tee -a /var/spool/cron/root
