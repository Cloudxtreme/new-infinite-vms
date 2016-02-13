#! /bin/bash
sed -i 's/512000/4000000/g' /usr/local/cpanel/scripts/securetmp
umount -l /tmp
umount -l /var/tmp
rm -fv /usr/tmpDSK
/scripts/securetmp
EOF
