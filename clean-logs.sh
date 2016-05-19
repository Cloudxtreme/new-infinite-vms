#!/bin/bash
find /var/log -name "secure*" -type f -exec rm -rf {} \;
find /var/log -name "exim*" -type f -exec rm -rf {} \;
find /var/log -name "sim_log*" -type f -exec rm -rf {} \;
find /var/log -name "cron*" -type f -exec rm -rf {} \;
find /var/log -name "maillog*" -type f -exec rm -rf {} \;
history -cw
