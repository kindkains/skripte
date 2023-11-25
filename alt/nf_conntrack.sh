#!/bin/bash
conntrack -E -e NEW -p udp --dport 53 >> /var/log/nf_conntrack/nf_conntrack-$(date "+%Y-%m.%d").log
