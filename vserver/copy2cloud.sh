#!/bin/bash

sudo -u sandro mount ~/nextcloud
cp $1 /home/sandro/nextcloud/Share/openvpn/
chown sandro:users /home/sandro/nextcloud/Share/openvpn/$1
sudo -u sandro umount ~/nextcloud
