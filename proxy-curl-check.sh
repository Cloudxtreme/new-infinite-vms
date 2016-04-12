#!/bin/bash
nginx_conf=/etc/nginx/nginx.conf
nginx_ssl_location_conf=/etc/nginx/ssl-location.conf
nginx_ssl_conf=/etc/nginx/sites-enabled/ssls.conf
first_curl_check=$(curl -o /dev/null --silent --head --write-out '%{http_code}\n' http://ip-cloud/cgi-sys/defaultwebpage.cgi -m 30)
second_curl_check=$(curl -o /dev/null --silent --head --write-out '%{http_code}\n' http://ip-cloud/ -m 20)
ssl_curl_check=$(curl -o /dev/null --silent --head --write-out '%{http_code}\n' https://ip-cloud/ -m 10 -k)
curl_result=200
ssl_curl_result=301
main_proxy_pass="proxy_pass http://ip-cloud;"
main_ssl_proxy_pass="proxy_pass https://ip-cloud;"
cp_proxy_pass="proxy_pass http://cpanel-webserver;"
main_return="return 503; #main"
cp_return="return 503; #cp"

if [ "$first_curl_check" != "$curl_result" ] && [ "$second_curl_check" != "$curl_result" ] && [ "$ssl_curl_check" != "$ssl_curl_result" ]; then
grep "$main_proxy_pass" $nginx_conf && perl -pi -e "s|$main_proxy_pass|$main_return|g" $nginx_conf
grep "$cp_proxy_pass" $nginx_conf && perl -pi -e "s|$cp_proxy_pass|$cp_return|g" $nginx_conf
grep "$main_proxy_pass" $nginx_ssl_conf && perl -pi -e "s|$main_proxy_pass|$main_return|g" $nginx_ssl_conf
grep "$main_ssl_proxy_pass" $nginx_ssl_location_conf && perl -pi -e "s|$main_ssl_proxy_pass|$main_return|g" $nginx_ssl_location_conf  && service nginx restart
else
grep "$main_return" $nginx_conf && perl -pi -e "s|$main_return|$main_proxy_pass|g" $nginx_conf
grep "$cp_return" $nginx_conf && perl -pi -e "s|$cp_return|$cp_proxy_pass|g" $nginx_conf
grep "$main_return" $nginx_ssl_conf && perl -pi -e "s|$main_return|$main_proxy_pass|g" $nginx_ssl_conf 
grep "$main_return" $nginx_ssl_location_conf && perl -pi -e "s|$main_return|$main_ssl_proxy_pass|g" $nginx_ssl_location_conf && service nginx restart
fi
