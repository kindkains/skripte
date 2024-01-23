#!/bin/bash

user=(sandro git openvpn)

groupadd ssh-users

for i in ${user[@]}; do
	
	useradd -m -g users -G sudo,ssh-users,www-data,www,mail -s /bin/bash $i
done
