#!/bin/bash
nginx_conf=/etc/nginx/nginx.conf
curl_check=$(curl -o /dev/null --silent --head --write-out '%{http_code}\n' http://ip-cloud/ -m 30)
curl_result=200
main_proxy_pass="proxy_pass http://ip-cloud;"
cp_proxy_pass="proxy_pass http://cpanel-webserver;"
main_return="return 503; #main"
cp_return="return 503; #cp"

if [ "$curl_check" != "$curl_result" ]; then
grep "$main_proxy_pass" $nginx_conf && sed -r -i -e "s|$main_proxy_pass|$main_return|g" $nginx_conf && service nginx restart
grep "$cp_proxy_pass" $nginx_conf && sed -r -i -e "s|$cp_proxy_pass|$cp_return|g" $nginx_conf && service nginx restart
else
grep "$main_return" $nginx_conf && sed -r -i -e "s|$main_return|$main_proxy_pass|g" $nginx_conf && service nginx restart
grep "$cp_return" $nginx_conf && sed -r -i -e "s|$cp_return|$cp_proxy_pass|g" $nginx_conf && service nginx restart
fi
