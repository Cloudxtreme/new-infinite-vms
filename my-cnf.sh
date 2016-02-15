#! /bin/bash
sed -i '1 i[client]\' /etc/my.cnf
sed -i '2 idefault-character-set=utf8mb4' /etc/my.cnf
sed -i '3 i# End of mysql client configs' /etc/my.cnf
sed -i '4 i[mysql]' /etc/my.cnf
sed -i '5 idefault-character-set=utf8mb4' /etc/my.cnf
sed -i '6 i# End of mysql configs' /etc/my.cnf
echo -e "datadir=/var/lib/mysql" >> /etc/my.cnf
echo -e "socket=/var/lib/mysql/mysql.sock" >> /etc/my.cnf
echo -e "local-infile=0" >> /etc/my.cnf
echo -e "low-priority-updates=1" >> /etc/my.cnf
echo -e "skip-name-resolve" >> /etc/my.cnf
echo -e "expire_logs_days=3" >> /etc/my.cnf
echo -e "slow_query_log=1" >> /etc/my.cnf
echo -e "slow_query_log_file=/var/lib/mysql/slow.log" >> /etc/my.cnf
echo -e "character-set-server=utf8mb4" >> /etc/my.cnf
echo -e "collation-server=utf8mb4_unicode_ci" >> /etc/my.cnf
