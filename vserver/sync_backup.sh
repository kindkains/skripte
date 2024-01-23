#!/bin/bash
rsync -avPu /private-backup/root/ /root/
rsync -avPu /private-backup/home/ /home/
rsync -avPu /private-backup/opt/ /opt/
rsync -avPu /private-backup/var/www/ /var/www/
rsync -avPu /private-backup/var/backups/ /var/backups/
rsync -avPu /private-backup/etc/openvpn/ /etc/openvpn/
