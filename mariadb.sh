#! /bin/bash
cp -Rf /var/lib/mysql /var/lib/mysql-old
mv /etc/my.cnf /etc/my.cnf-old 
/scripts/update_local_rpm_versions --edit target_settings.MySQL50 uninstalled
/scripts/update_local_rpm_versions --edit target_settings.MySQL51 uninstalled
/scripts/update_local_rpm_versions --edit target_settings.MySQL55 uninstalled 
/scripts/update_local_rpm_versions --edit target_settings.MySQL56 uninstalled
/scripts/check_cpanel_rpms --fix --targets=MySQL50,MySQL51,MySQL55,MySQL56
mv /root/infinite-scripts/MariaDB.repo /etc/yum.repos.d/MariaDB.repo
sed -i 's/mysql[*] nsd[*] php/nsd/g' /etc/yum.conf
yum install MariaDB-server MariaDB-client MariaDB-devel php-mysql
service mysql start
mysql_upgrade
service mysql restart
/scripts/easyapache --build
yum install governor-mysql
/usr/share/lve/dbgovernor/db-select-mysql --mysql-version=mariadb101
/usr/share/lve/dbgovernor/mysqlgovernor.py --install
