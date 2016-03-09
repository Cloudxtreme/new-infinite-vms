#!/bin/bash
yum install -y lvemanager cagefs
yum groupinstall alt-php
yum update cagefs lvemanager
cagefsctl --init
cagefsctl --enable-all
cagefsctl --disable northontorga
cagefsctl --disable ntorga
