#!/bin/sh
/srv/bscw/srv/bscw.bildung-rp.de/bin/bsadmin users -m > /root/skripte/tmp_all_users

read -p "Soll ich nach Benutzernamen (b) oder Email-Adressen (e) filtern? " x
	if [ $x = "b" ]; 
		then
			read -p "Nach welchen Benutzern soll ich filtern? " user
			cat /root/skripte/tmp_all_users | grep $user > /root/skripte/tmp_users

		else
			read -p "Nach welcher Email soll ich filtern? " email
            cat /root/skripte/tmp_all_users | grep $email > /root/skripte/tmp_users
	fi

cat /root/skripte/tmp_users | awk '{ print $1}' | sed -e "s# ##" > /root/skripte/tmp_delete_users

echo "Folgende Benutzer werden zum Löschen vorgemerkt:"
cat /root/skripte/tmp_delete_users

read -p "Soll ich die vorgemerkten Benutzer löschen? (ja/nein) " y
	if [ $y = "ja" ];
		then
			
echo "Beginne mit dem Löschen der gewünschten Benutzer"
echo "================================================"

for i in `cat /root/skripte/tmp_delete_users`
	do
		echo "Lösche Benutzer $i"
		/srv/bscw/srv/bscw.bildung-rp.de/bin/bsadmin rmuser $i
		echo "Benutzer $i wurde gelöscht."
	done

		else
			echo "Breche Skript ab."
fi
