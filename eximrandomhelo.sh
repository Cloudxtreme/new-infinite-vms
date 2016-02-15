#!/bin/bash
#script to change the helo of outgoing e-mail exim
#powered by Northon Torga :: CTO at infinite.sx
 
#path
path=/etc/mailhelo
 
#helo list
helo=("first-mx" "second-mx")
 
#read current helo
mailhelo=`head -n 1 ${path}`
current_helo=${mailhelo##*: }
 
#delete current helo of helo array
for i in ${!helo[@]}; do
    if [ "${helo[$i]}" == ${current_helo} ]; then
        unset helo[$i]
    fi
done
 
#shuffle helo
helo_shuf=($(shuf -e ${helo[*]}))
 
#write new helo in mailihelo
echo "*:" ${helo_shuf[0]} > ${path}
