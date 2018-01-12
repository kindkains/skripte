#!/bin/bash
# sudo mount -t davfs -o /home/sandro/.credentials https://owncloud.bildung-rp.de/owncloud/remote.php/webdav/ /backup/owncloud/

clear
echo "Ich erweitere die /etc/fstab um die Owncloud-Einträge"
echo ""
sudo echo "https://owncloud.bildung-rp.de/owncloud/remote.php/webdav/      /backup/owncloud/                       davfs           user,rw,auto	                        0       0" >> /etc/fstab
sudo echo "http://inka-online.de/owncloud/remote.php/webdav/		/backup/owncloud-inka/			davfs           user,rw,auto	                        0       0" >> /etc/fstab
sleep 1

echo "Ich hänge die Owncloud Verzeichnisse im Dateisystem ein"
echo ""
sudo mount /backup/owncloud
sudo mount /backup/owncloud-inka
sleep 1

echo "Ich entferne die Owncloud-Einträge wieder aus der /etc/fstab"
echo ""
sudo cat /etc/fstab | sed -e '/^[http]/d' >> /home/sandro/skripte/owncloud_fstab
sudo cat /home/sandro/skripte/fstab > /etc/fstab
echo "Fertig"
