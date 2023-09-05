#!/bin/bash

projekt=(engel inka-online pokora rpg spielwiese)

su git -c sync

for i in ${projekt[@]};do
	
	chown -R git:www-data /var/www/$i

done
