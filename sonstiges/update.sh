#!/bin/bash
apt-get update
apt-get upgrade -y
apt-get dist-upgrade -y
#update-flashplugin-nonfree --install
echo "Update durchgeführt am: " >> /root/skripte/update.log
date >> /root/skripte/update.log
echo "" >> /root/skripte/update.log
