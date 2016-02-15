#!/bin/bash
# Script to chmod afterLogics cache folders

cd /usr/local/cpanel/base/3rdparty/afterlogic/data && find . -type d -exec chmod 777 {} \; && find . -type f -exec chmod 666 {} \;
cd /usr/local/cpanel/base/3rdparty/afterlogic/data/cache && find . -type d -exec chmod 777 {} \; && find . -type f -exec chmod 666 {} \;
