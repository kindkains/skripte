#!/bin/bash
rsync -av --exclude=/home/sandro/Netzlaufwerk-Gemeinsam --exclude=/home/sandro/Netzlaufwerk /home /backup
rsync -av /etc /backup
rsync -av /root /backup
rsync -av /opt /backup

