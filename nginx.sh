# Dependencies
yum -y install gcc-c++ pcre-devel pcre-devel zlib-devel make unzip openssl-devel
nginxVersion="1.8.1"
NPS_VERSION="1.10.33.7"

# NGINX
cd /
mkdir -p /src
wget http://nginx.org/download/nginx-$nginxVersion.tar.gz -O /src/nginx-$nginxVersion.tar.gz
tar -xzf /src/nginx-$nginxVersion.tar.gz
mv /src/nginx-$nginxVersion /src/nginx
cd /src/nginx && ./configure --add-module=/opt/nginx/modules/ngx_pagespeed-release-${NPS_VERSION}-beta \
--prefix=/usr/local/nginx \
--sbin-path=/usr/local/sbin/nginx \
--conf-path=/etc/nginx/nginx.conf \
--error-log-path=/var/log/nginx/error.log \
--http-log-path=/var/log/nginx/access.log \
--pid-path=/run/nginx.pid \
--lock-path=/run/lock/subsys/nginx \
--with-http_ssl_module \
--with-http_realip_module \
--with-http_gunzip_module \
--with-http_gzip_static_module \
--with-http_auth_request_module \
--with-file-aio \
--with-http_spdy_module \
--with-pcre \
--without-mail_pop3_module \
--without-mail_imap_module \
--without-mail_smtp_module \
--without-http_scgi_module \
--without-http_uwsgi_module \
--without-http_fastcgi_module \
--user=nginx \
--group=nginx
cd /src/nginx && make && make install
useradd -r nginx
wget -O /etc/init.d/nginx https://gist.github.com/sairam/5892520/raw/b8195a71e944d46271c8a49f2717f70bcd04bf1a/etc-init.d-nginx
chmod +x /etc/init.d/nginx
chkconfig --add nginx
chkconfig --level 345 nginx on

# PageSpeed
mkdir -p /opt/nginx/modules
wget https://github.com/pagespeed/ngx_pagespeed/archive/release-${NPS_VERSION}-beta.zip -O /opt/nginx/modules/release-${NPS_VERSION}-beta.zip
unzip /opt/nginx/modules/release-${NPS_VERSION}-beta.zip
wget https://dl.google.com/dl/page-speed/psol/${NPS_VERSION}.tar.gz -O /opt/nginx/modules/ngx_pagespeed-release-${NPS_VERSION}-beta/${NPS_VERSION}.tar.gz
tar /opt/nginx/modules/ngx_pagespeed-release-${NPS_VERSION}-beta/${NPS_VERSION}.tar.gz

# Configurations Files
mv /root/infinite-scripts/nginx.conf /etc/nginx/nginx.conf
mv /root/infinite-scripts/ssl.conf /etc/nginx/ssl.conf
mv /root/infinite-scripts/pagespeed.conf /etc/nginx/pagespeed.conf
mv /root/infinite-scripts/expires.conf /etc/nginx/expires.conf
mv /root/infinite-scripts/maintenance.html /etc/nginx/maintenance.html
mv /root/infinite-scripts/forbidden.html /etc/nginx/forbidden.html
mv /root/infinite-scripts/proxy-index.html /etc/nginx/proxy-index.html
mkdir /etc/nginx/ssl
mkdir /etc/nginx/sites-enabled
