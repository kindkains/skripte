#!/bin/bash

X=/home/sandro/nextcloud

sudo -u sandro mount $X
cp $1 /home/sandro/nextcloud/Share/openvpn/
chown sandro:users /home/sandro/nextcloud/Share/openvpn/$1
sudo -u sandro umount $X
