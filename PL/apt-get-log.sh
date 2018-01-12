#!/bin/bash
d=`date +%Y-%m-%d`
grep -A3 'Start-Date: '$d'' /var/log/apt/history.log >> /var/log/apt-get/apt-get.log
