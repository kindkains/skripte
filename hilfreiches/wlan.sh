#!/bin/bash
iwconfig
nmcli dev wifi list
echo "options rtl8821ae swenc=1 fwlps=0 ips=0" | sudo tee /etc/modprobe.d/rtl8821ae_options.conf
