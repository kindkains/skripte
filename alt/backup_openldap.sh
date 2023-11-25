#!/bin/bash

d=`date +%d.%m.%Y`
BACKUP_PATH=/var/backups/openldap

nice slapcat -n 0 > ${BACKUP_PATH}/config_$d.ldif
nice slapcat -n 1 > ${BACKUP_PATH}/bildung-rp.de_$d.ldif
chmod 640 ${BACKUP_PATH}/*.ldif
