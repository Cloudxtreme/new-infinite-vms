#! /bin/bash
/usr/local/cpanel/3rdparty/bin/git clone https://github.com/wrender/modsecurity-whitelist-apps /usr/local/apache/conf/modsecurity-whitelist-apps
echo "Include /usr/local/apache/conf/modsecurity-whitelist-apps/*.conf" | tee -a /usr/local/apache/conf/modsec2.user.conf
