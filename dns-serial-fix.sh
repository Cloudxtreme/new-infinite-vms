#!/bin/bash

ZONES_PATH="/var/named"
DATE=$(date +%Y%m%d)

NEEDLE="Serial Number"
for ZONE in $(find $ZONES_PATH/*.db -mtime -1 -printf '%f\n') ; do
    curr=$(/bin/grep -e "${NEEDLE}$" $ZONES_PATH/${ZONE} | /bin/sed -n "s/^\s*\([0-9]*\)\s*;\s*${NEEDLE}\s*/\1/p")
    if [ ${#curr} -lt ${#DATE} ]; then
      serial="${DATE}00"
    else
      prefix=${curr::-2}
      if [ "$DATE" -eq "$prefix" ]; then
        num=${curr: -2}
        num=$((10#$num + 1))
        serial="${DATE}$(printf '%02d' $num )"
      else
        serial="${DATE}00"
      fi
    fi
    /bin/sed -i -e "s/^\(\s*\)[0-9]\{0,\}\(\s*;\s*${NEEDLE}\)$/\1${serial}\2/" ${ZONES_PATH}/${ZONE}
    echo "${ZONE}: "
    grep "; ${NEEDLE}$" $ZONES_PATH/${ZONE}
done
