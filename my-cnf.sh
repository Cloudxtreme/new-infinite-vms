#! /bin/bash
sed -i '1 i\[client]' /etc/my.cnf
sed -i '2 i\default-character-set=utf8mb4' /etc/my.cnf
sed -i '3 i\' /etc/my.cnf
sed -i '4 i\[mysql]' /etc/my.cnf
sed -i '5 i\default-character-set=utf8mb4' /etc/my.cnf
sed -i '6 i\' /etc/my.cnf
echo "datadir=/var/lib/mysql" | tee -a /etc/my.cnf
echo "socket=/var/lib/mysql/mysql.sock" | tee -a /etc/my.cnf
echo "local-infile=0" | tee -a /etc/my.cnf
echo "low-priority-updates=1" | tee -a /etc/my.cnf
echo "skip-name-resolve" | tee -a /etc/my.cnf
echo "expire_logs_days=3" | tee -a /etc/my.cnf
echo "slow_query_log=1" | tee -a /etc/my.cnf
echo "slow_query_log_file=/var/lib/mysql/slow.log" | tee -a /etc/my.cnf
echo "character-set-server=utf8mb4" | tee -a /etc/my.cnf
echo "collation-server=utf8mb4_unicode_ci" | tee -a /etc/my.cnf
