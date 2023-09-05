#!/bin/bash
d=`date +%d.%m.%y`
logfile=/var/log/cronjobs/nextcloud.log

echo "Last Run: $d" | tee -a $logfile


sudo -u www-data php -f /var/www/nextcloud/occ files:scan --all | tee -a $logfile
echo "Scan All Files - Returncode $?" | tee -a $logfile

# sudo -u www-data php -f /var/www/nextcloud/occ files:scan sandro
# echo "Scan Files sandro - Returncode $?" | tee -a $logfile
# sudo -u www-data php -f /var/www/nextcloud/occ files:scan ania
# echo "Scan Files ania - Returncode $?" | tee -a $logfile
