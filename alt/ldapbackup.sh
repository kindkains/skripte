#!/bin/sh

d=`date +%d%m%y`
ldapsearch -x -D cn=admin,dc=bildung-rp,dc=de -w QCGXf9fj > /var/backups/ldap/ldap-$d.ldif 
gzip -9 /var/backups/ldap/ldap-$d.ldif
find /var/backups/ldap/ -ctime 14 -delete

