#!/bin/bash
apt install network-manager
systemctl enable systemd-networkd
systemctl enable systemd-resolved
systemctl start systemd-networkd
systemctl start systemd-resolved
apt install isc-dhcp-client
dpkg-reconfigure resolvconf
sudo ip route add default via 172.24.1.254 dev enp0s25
