yum -y install cronie
service crond start
chkconfig crond on
touch /var/spool/cron/root
