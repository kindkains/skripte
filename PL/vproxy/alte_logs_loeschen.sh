#!/bin/bash
clear
tage=60
echo "Alle Logs löschen, die älter als $tage Tage sind"
echo ""
find /var/log/squid3/ -type f -mtime +$tage | xargs rm -rf
find /var/log/c-icap/ -type f -mtime +$tage | xargs rm -rf
find /var/log/clamav/ -type f -mtime +$tage | xargs rm -rf
find /var/log/apache2/ -type f -mtime +$tage | xargs rm -rf
