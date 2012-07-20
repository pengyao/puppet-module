#!/bin/sh

BUSY_COUNTS=`/usr/bin/wget -q -O- http://localhost/server-status?auto | grep "BusyWorkers"`
echo ${BUSY_COUNTS} | cut -d : -f 2 | sed -e "s/  *//g"

exit 0
