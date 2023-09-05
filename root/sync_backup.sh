#!/bin/bash
rsync -avP /private-backup/root/ /root/
rsync -avP /private-backup/home/ /home/
rsync -avP /private-backup/opt/ /opt/
rsync -avP /private-backup/var/www/ /var/www/
rsync -avP /private-backup/var/backups/ /var/backups/
rsync -avP /private-backup/etc/openvpn/ /etc/openvpn/
