#!/bin/bash

X=/home/sandro/nextcloud

sudo -u sandro mount $X
cp -av /home/sandro/nextcloud/home/sandro/KeePassXC/ /home/sandro/backup/
sudo -u sandro umount $X
