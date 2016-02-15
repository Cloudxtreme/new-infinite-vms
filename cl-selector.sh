#! /bin/bash
sed -i 's/Default   = 30/Default   = 60/g' /etc/cl.selector/php.conf
sed -i 's/Range     = 64M,128M,192M,256M,368M,512M/Range     = 64M,128M,256M,368M,512M,1G/g' /etc/cl.selector/php.conf
sed -i 's/Default   = 8M/Default   = 16M/g' /etc/cl.selector/php.conf
sed -i 's/Default   = 2M/Default   = 8M/g' /etc/cl.selector/php.conf
