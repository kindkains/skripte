#!/bin/bash
echo "Bitte angeben, für welchen Dienst logrotate manuell ausgeführt werden soll"
read service

logrotate --force /etc/logrotate.d/$service
