# Dependencies
rpm --import https://linux.web.cern.ch/linux/scientific6/docs/repository/cern/slc6X/i386/RPM-GPG-KEY-cern
wget -O /etc/yum.repos.d/slc6-devtoolset.repo https://linux.web.cern.ch/linux/scientific6/docs/repository/cern/devtoolset/slc6-devtoolset.repo
yum -y install gcc-c++ pcre-devel pcre-devel zlib-devel make unzip openssl-devel devtoolset-2-gcc-c++ devtoolset-2-binutils
service nginx stop
nginxVersion="1.9.13"
NPS_VERSION="1.10.33.7"
PS_NGX_EXTRA_FLAGS="--with-cc=/opt/rh/devtoolset-2/root/usr/bin/gcc"

# PageSpeed
rm -rf /opt/nginx
mkdir -p /opt/nginx/modules
wget https://github.com/pagespeed/ngx_pagespeed/archive/release-${NPS_VERSION}-beta.zip -O /opt/nginx/modules/release-${NPS_VERSION}-beta.zip
unzip /opt/nginx/modules/release-${NPS_VERSION}-beta.zip -d /opt/nginx/modules/
wget https://dl.google.com/dl/page-speed/psol/${NPS_VERSION}.tar.gz -O /opt/nginx/modules/ngx_pagespeed-release-${NPS_VERSION}-beta/${NPS_VERSION}.tar.gz
tar -xzf /opt/nginx/modules/ngx_pagespeed-release-${NPS_VERSION}-beta/${NPS_VERSION}.tar.gz

# NGINX
rm -rf /src/nginx
cd /
mkdir -p /src
wget http://nginx.org/download/nginx-$nginxVersion.tar.gz -O /src/nginx-$nginxVersion.tar.gz
tar -xzf /src/nginx-$nginxVersion.tar.gz -C /src/
mv /src/nginx-$nginxVersion /src/nginx
cd /src/nginx && ./configure --add-module=/opt/nginx/modules/ngx_pagespeed-release-${NPS_VERSION}-beta  ${PS_NGX_EXTRA_FLAGS} \
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
--with-threads \
--with-http_v2_module \
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
ln -s /usr/local/sbin/nginx /usr/sbin/nginx

# Configurations Files
mv /root/infinite-scripts/nginx.conf /etc/nginx/nginx.conf
mv /root/infinite-scripts/ssl.conf /etc/nginx/ssl.conf
mv /root/infinite-scripts/pagespeed.conf /etc/nginx/pagespeed.conf
mv /root/infinite-scripts/expires.conf /etc/nginx/expires.conf
mv /root/infinite-scripts/error_pages.conf /etc/nginx/error_pages.conf
mv /root/infinite-scripts/maintenance.html /etc/nginx/maintenance.html
mv /root/infinite-scripts/forbidden.html /etc/nginx/forbidden.html
mv /root/infinite-scripts/proxy-index.html /etc/nginx/proxy-index.html
mkdir /etc/nginx/ssl
mkdir /etc/nginx/sites-enabled
