#!/bin/bash
rsync -av --exclude=/home/sandro/Backup/USB\ Stick --exclude=/home/sandro/Netzlaufwerk-Gemeinsam /home /media/Intenso/backup/pl
rsync -av /etc /media/Intenso/backup/pl
rsync -av /root /media/Intenso/backup/pl
