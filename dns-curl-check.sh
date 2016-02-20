#!/bin/bash

#variables - start
#files
dns_files=/var/named/*.db

#proxys ips
main_one_google="191.241.141.170"
backup_one_google="209.141.39.237"
main_one_amazon=""
backup_one_google=""
main_one_uol=""
backup_one_uol=""
main_one_equinix=""
backup_one_equinix=""

#curls
curl_check_one_google=$(curl -o /dev/null --silent --head --write-out '%{http_code}\n' http://$main_one_google/ -m 30)
curl_check_one_amazon=$(curl -o /dev/null --silent --head --write-out '%{http_code}\n' http://$main_one_amazon/ -m 30)
curl_check_one_uol=$(curl -o /dev/null --silent --head --write-out '%{http_code}\n' http://$main_one_uol/ -m 30)
curl_check_one_equinix=$(curl -o /dev/null --silent --head --write-out '%{http_code}\n' http://$main_one_equinix/ -m 30)
curl_result=200
#variables - end

#vms - start
#one-google
if [ "$curl_check_one_google" != "$curl_result" ]; then
grep "$main_one_google" $dns_files && sed -r -i -e "s|$main_one_google|$backup_one_google|g" $dns_files && service named reload
else
grep "$backup_one_google" $dns_files && sed -r -i -e "s|$backup_one_google|$main_one_google|g" $dns_files && service named reload
fi
#vms - end
