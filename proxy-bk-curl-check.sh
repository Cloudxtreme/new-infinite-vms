#!/bin/bash
nginx_conf=/etc/nginx/nginx.conf
nginx_ssl_conf=/etc/nginx/sites-enabled/ssls.conf
first_curl_check=$(curl -o /dev/null --silent --head --write-out '%{http_code}\n' http://ip-cloud-1/cgi-sys/defaultwebpage.cgi -m 20)
second_curl_check=$(curl -o /dev/null --silent --head --write-out '%{http_code}\n' http://ip-cloud-2/cgi-sys/defaultwebpage.cgi -m 20)
curl_result=200
main_first_proxy_pass="proxy_pass http://ip-cloud-1;"
main_ssl_first_proxy_pass="proxy_pass https://ip-cloud-1;"
main_second_proxy_pass="proxy_pass http://ip-cloud-2;"
main_ssl_second_proxy_pass="proxy_pass https://ip-cloud-2;"
cp_first_proxy_pass="proxy_pass http://cpanel-webserver-1;"
cp_second_proxy_pass="proxy_pass http://cpanel-webserver-2;"
main_return="return 503; #main"
cp_return="return 503; #cp"

if [ "$first_curl_check" != "$curl_result" ]; then
grep "$main_first_proxy_pass" $nginx_conf && sed -r -i -e "s|$main_first_proxy_pass|$main_return|g" $nginx_conf && service nginx restart
grep "$cp_first_proxy_pass" $nginx_conf && sed -r -i -e "s|$cp_first_proxy_pass|$cp_return|g" $nginx_conf && service nginx restart
grep "$main_ssl_first_proxy_pass" $nginx_ssl_conf && sed -r -i -e "s|$main_ssl_first_proxy_pass|$main_return|g" $nginx_ssl_conf && service nginx restart
else
grep "$main_return" $nginx_conf && sed -r -i -e "s|$main_return|$main_first_proxy_pass|g" $nginx_conf && service nginx restart
grep "$cp_return" $nginx_conf && sed -r -i -e "s|$cp_return|$cp_first_proxy_pass|g" $nginx_conf && service nginx restart
grep "$main_return" $nginx_ssl_conf && sed -r -i -e "s|$main_return|$main_ssl_first_proxy_pass|g" $nginx_ssl_conf && service nginx restart
fi
