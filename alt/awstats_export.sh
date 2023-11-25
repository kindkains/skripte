#!/bin/bash
# Skript zum Export von awstats für den vlbs-stats, wenn mal wieder über Monate Daten nicht
# übertragen wurden und der Jahresbericht ansteht.
# Dieses Skript liegt auf dem vlbs-web1 unter /root/skripte

clear
echo "Schritt 1"
echo "---------"
echo ""
echo "Packe den Inhalt von /etc/awstats/ nach /home/vmadmin/awstats-vlbs-web1.tar.gz"
sleep 3
cd /etc/awstats/
tar -cvzf /home/vmadmin/awstats-vlbs-web1.tar.gz awstats.*
cd /home/vmadmin/
chown vmadmin:vmadmin /home/vmadmin/awstats-vlbs-web1.tar.gz
echo ""
echo ""
echo "Schritt 2"
echo "---------"
echo ""
echo "Apache2 Logs werden nach /home/vmadmin/apache2-vlbs-web1.tar.gz gepackt"
sleep 3
cd /var/log/
tar -cvzf /home/vmadmin/apache2-vlbs-web1.tar.gz apache2/
cd /home/vmadmin/
chown vmadmin:vmadmin /home/vmadmin/apache2-vlbs-web1.tar.gz
echo ""
echo "Schritt 3"
echo "---------"
echo ""
echo "Bitte auf der Admin-Workstation folgenden Befehl ausführen:"
echo "/home/sandro/skripte/awstats_import_export.sh"
# echo "scp vmadmin@vlbs-web1:/home/vmadmin/*vlbs-web1.tar.gz . && scp *vlbs-web1.tar.gz vmadmin@vlbs-stats:/home/vmadmin/ && rm -rf *vlbs-web1.tar.gz && ssh -q vmadmin@vlbs-web1 rm -rf *vlbs-web1.tar.gz && ssh vmadmin@vlbs-stats"
echo ""
