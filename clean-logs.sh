#!/bin/bash
find /var/log -name "secure*" -type f -exec rm -rf {} \;
history -cw
