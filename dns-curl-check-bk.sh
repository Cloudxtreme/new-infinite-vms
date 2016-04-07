#!/bin/bash

#variables - start
#files
dns_files=/var/named/*.db

#proxys ips
main_one_google="191.241.141.170"
backup_one_google="198.251.81.97"
main_one_amazon="191.241.141.171"
backup_one_amazon="198.251.81.98"
main_one_equinix="191.241.141.172"
backup_one_equinix="158.69.102.44"
main_one_dualtec="191.241.141.173"
backup_one_dulatec="158.69.102.45"

#curls
first_curl_one_google=$(curl -o /dev/null --silent --head --write-out '%{http_code}\n' http://$main_one_google/cgi-sys/defaultwebpage.cgi -m 20)
second_curl_one_google=$(curl -o /dev/null --silent --head --write-out '%{http_code}\n' http://$main_one_google/ -m 30)
first_curl_one_amazon=$(curl -o /dev/null --silent --head --write-out '%{http_code}\n' http://$main_one_amazon/cgi-sys/defaultwebpage.cgi -m 20)
second_curl_one_amazon=$(curl -o /dev/null --silent --head --write-out '%{http_code}\n' http://$main_one_amazon/ -m 30)
first_curl_one_equinix=$(curl -o /dev/null --silent --head --write-out '%{http_code}\n' http://$main_one_equinix/cgi-sys/defaultwebpage.cgi -m 20)
second_curl_one_equinix=$(curl -o /dev/null --silent --head --write-out '%{http_code}\n' http://$main_one_equinix/ -m 30)
first_curl_one_dualtec=$(curl -o /dev/null --silent --head --write-out '%{http_code}\n' http://$main_one_dualtec/cgi-sys/defaultwebpage.cgi -m 20)
second_curl_one_dualtec=$(curl -o /dev/null --silent --head --write-out '%{http_code}\n' http://$main_one_dualtec/ -m 30)
curl_result=200
#variables - end

#vms - start
#one-google
if [ "$first_curl_one_google" != "$curl_result" ] && [ "$second_curl_one_google" != "$curl_result" ]; then
grep "$backup_one_google" $dns_files && sed -r -i -e "s|$backup_one_google|$main_one_google|g" $dns_files && service named reload
fi

#one-equinix
if [ "$first_curl_one_equinix" != "$curl_result" ] && [ "$second_curl_one_equinix" != "$curl_result" ]; then
grep "$backup_one_equinix" $dns_files && sed -r -i -e "s|$backup_one_equinix|$main_one_equinix|g" $dns_files && service named reload
fi
#vms - end
