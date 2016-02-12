#!/bin/bash

# whm-wrapper.css
file=/usr/local/cpanel/whostmgr/docroot/templates/master_templates/wrapper.tmpl
old="</head>"
new="<link rel='stylesheet' type='text/css' href='https://cdn.infinite.sx/hood/whm-wrapper.css'><link rel='icon' type='image/png' href='https://cdn.infinite.sx/hood/images/favicon.png' /></head>"
if grep -q "$new" "$file";
then
echo 'Okay.'
else
sed -r -i -e "s|$old|$new|g" $file;
fi

# whm-master.css
file=/usr/local/cpanel/whostmgr/docroot/templates/master_templates/_defheader.tmpl
old="</head>"
new="<link rel='stylesheet' type='text/css' href='https://cdn.infinite.sx/hood/whm-master.css'><link rel='icon' type='image/png' href='https://cdn.infinite.sx/hood/images/favicon.png' /></head>"
if grep -q "$new" "$file";
then
echo 'Okay.'
else
sed -r -i -e "s|$old|$new|g" $file;
fi

file=/usr/local/cpanel/whostmgr/docroot/templates/_defheader.tmpl
old="</head>"
new="<link rel='stylesheet' type='text/css' href='https://cdn.infinite.sx/hood/whm-master.css'><link rel='icon' type='image/png' href='https://cdn.infinite.sx/hood/images/favicon.png' /></head>"
if grep -q "$new" "$file";
then
echo 'Okay.'
else
sed -r -i -e "s|$old|$new|g" $file;
fi
