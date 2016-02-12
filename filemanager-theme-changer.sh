#!/bin/bash

# front
file=/usr/local/cpanel/base/frontend/paper_lantern/filemanager/index.html.tt
old="</head>"
new="<link rel='stylesheet' type='text/css' href='https://cdn.infinite.sx/hood/file-manager.css'><link rel='icon' type='image/png' href='https://cdn.infinite.sx/hood/images/favicon-fm.png' /></head>"
if grep -q "$new" "$file";
then
echo 'Okay.'
else
sed -r -i -e "s|$old|$new|g" $file;
fi

# editor
file=/usr/local/cpanel/base/frontend/paper_lantern/filemanager/editit.html.tt
old="</head>"
new="<link rel='stylesheet' type='text/css' href='https://cdn.infinite.sx/hood/file-manager.css'><link rel='icon' type='image/png' href='https://cdn.infinite.sx/hood/images/favicon-fm.png' /></head>"
if grep -q "$new" "$file";
then
echo 'Okay.'
else
sed -r -i -e "s|$old|$new|g" $file;
fi

# upload page
file=/usr/local/cpanel/base/frontend/paper_lantern/filemanager/upload-ajax.html.tt
old="</head>"
new="<link rel='stylesheet' type='text/css' href='https://cdn.infinite.sx/hood/file-manager.css'><link rel='icon' type='image/png' href='https://cdn.infinite.sx/hood/images/favicon-fm.png' /></head>"
if grep -q "$new" "$file";
then
echo 'Okay.'
else
sed -r -i -e "s|$old|$new|g" $file;
fi
