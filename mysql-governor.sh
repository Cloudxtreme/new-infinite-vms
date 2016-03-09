#!/bin/bash
yum install governor-mysql
/usr/share/lve/dbgovernor/db-select-mysql --mysql-version=mariadb101
/usr/share/lve/dbgovernor/mysqlgovernor.py --install
