#!/bin/bash
sed -i 's/Default   = 30/Default   = 60/g' /etc/cl.selector/php.conf
sed -i 's/Range     = 64M,128M,192M,256M,368M,512M/Range     = 64M,128M,256M,368M,512M,1G/g' /etc/cl.selector/php.conf
sed -i 's/Default   = 8M/Default   = 16M/g' /etc/cl.selector/php.conf
sed -i 's/Default   = 2M/Default   = 8M/g' /etc/cl.selector/php.conf
sed -i 's/Default   = 60/Default   = 120/g' /etc/cl.selector/php.conf
echo "Directive = max_input_vars" | tee -a /etc/cl.selector/php.conf
echo "Default   = 1000" | tee -a /etc/cl.selector/php.conf
echo "Type      = list" | tee -a /etc/cl.selector/php.conf
echo "Range     = 1000,2000,4000,8000" | tee -a /etc/cl.selector/php.conf
echo "Comment   = How many input variables may be accepted (limit is applied to GET, POST and COOKIE superglobal separately). Use of this directive mitigates the possibility of denial of service attacks which use hash collisions." | tee -a /etc/cl.selector/php.conf
echo -e "\n" | tee -a /etc/cl.selector/php.conf
echo "Directive = expose_php" | tee -a /etc/cl.selector/php.conf
echo "Default   = Off" | tee -a /etc/cl.selector/php.conf
echo "Type      = bool" | tee -a /etc/cl.selector/php.conf
echo "Comment     = Prevents the webserver from sending back the X-Powered-By header." | tee -a /etc/cl.selector/php.conf
