#!/bin/bash

# Variablen definieren

ROT=`tput setaf 1`
BLAU=`tput setaf 4`
T=`tput setaf 9`
pfad="/home/$USER/secure"
file1=secure_open
file2=secure_close

# Funktionen definieren

error() {
	echo
	echo "${ROT}"
	echo "Fehlerhafte Eingabe, Programm wird beendet"
	echo "${T}"
	echo
	exit;
}

check_dir () {
	test -d "$dir"
}

check_package() {
	dpkg -l | grep encfs &> /dev/null
}

check_group() {
	cat /etc/group | grep fuse &> /dev/null
}

start_encfs() {
	encfs "${pfad%/*}"/."${pfad##*/}" $pfad
}

check_files() {
	test -f "$file"
}

create_skript() {
	echo 
	echo "Möchten Sie ein Shortcut zum Zugriff auf Ihre verschlüsselten Daten einrichten?"
	echo "Dabei werden der Ordner ${BLAU}/home/$USER/bin${T} sowie die Dateien"
	echo
	echo ${BLAU}/home/$USER/bin/$file1${T}
	echo
	echo und
	echo 
	echo ${BLAU}/home/$USER/bin/$file2${T}
	echo
	echo "angelegt"
	echo 
	echo "Anschließend können Sie mit dem Shortcut ${ROT}secure_open${T} und"
	echo "Ihrem Passwort, Ihre verschlüsselten Daten abrufen."
	echo 
	echo "Und der Shortcut ${ROT}secure_close${T} hängt die Daten dann wieder aus."
	echo
	
	read -p "Sollen die Shortcuts angelegt werden? <j/n> " wahl2
	if [ "$wahl2" = j ]; then
		dir="/home/$USER/bin"
		if check_dir; then
			echo
		else
			mkdir /home/$USER/bin
			chown $USER /home/$USER/bin
		fi

		echo "#!/bin/bash" > /home/$USER/bin/$file1
		echo "encfs "${pfad%/*}"/."${pfad##*/}" $pfad" >> /home/$USER/bin/$file1
		echo "#!/bin/bash" > /home/$USER/bin/$file2
		echo "fusermount -u $pfad" >> /home/$USER/bin/$file2
		chmod 750 /home/$USER/bin/$file1
		chmod 750 /home/$USER/bin/$file2

	elif [ "$wahl2" = n ]; then
		echo
		echo "Gut, dann eben nicht."
		echo
		return 0;
	else
		error
	fi
}

subroutine() {
	echo
	echo "Standardordner /home/$USER/secure existiert bereits und kann daher nicht angelegt werden"
	read -p "Soll ein ${BLAU}(a)${T}nderer Pfad gewählt werden, ein ${BLAU}(v)${T}erschlüsselter Ordner eingehangen werden oder das Skript b${BLAU}(e)${T}endet werden? " wahl
	echo
	if [ "$wahl" = a ]; then
		echo
		read -p "Neuen Pfad eingeben: " pfad
		echo
		mkdir "$pfad"
		mkdir "${pfad%/*}"/."${pfad##*/}"
		start_encfs

	elif [ "$wahl" = v ]; then
		/home/$USER/bin/$file2 &> /dev/null
		start_encfs
	return 0;

	elif [ "$wahl" = e ]; then
		echo
		echo "${ROT}Skript wird beendet${T}"
		echo
		exit
	
	else
			error
		fi
}


# Start Skript
clear

echo "*****************************************************************"
echo "*                                                               *"
echo "*Schnelle Verschlüsselung von Ordnern und Dateien mittels Enc Fs*"
echo "*                                                               *"
echo "*****************************************************************"
echo
echo "Dieses Skript dient als kleiner Assistent, um schnell Verzeichnisse und/oder Dateien"
echo "mit Hilfe von encfs verschlüsseln zu können."
echo
echo

# Prüfen, ob das benötigte Paket encfs installiert ist, wenn nicht, wird es installiert

if check_package; then
	sleep 1
else
	echo "Paket encfs fehlt wird aber benötigt"
	echo "Installiere encfs"
	echo
	sudo apt-get install encfs -y
fi

# Prüfen, ob die Gruppe fuse vorhanden ist, wenn nicht, wird sie angelegt und der Benutzer hinzugefügt

if check_group; then
	if cat /etc/group | grep fuse | grep $USER &> /dev/null;then
		sleep 1
	else
	       	echo "Der Benutzer $USER ist noch kein Mitglied der Gruppe fuse"
		sudo gpasswd -a $USER fuse
		echo
	fi
else
	echo "Gruppe fuse fehlt und wird nun angelegt"
	echo "Und der Benutzer $USER wird zur Gruppe fuse hinzugefügt"
	sudo addgroup fuse
	sudo gpasswd -a $USER fuse
	echo
fi

# /home/$USER/secure ist als Standardpfad vorgegeben
# Es muss erst geprüft werden, ob dieser bereits existiert, wenn ja, dann startet die Subroutine
# wenn nein, wird der zunächst angelegt und erst dann die Subroutine gestartet

dir=$pfad
if check_dir "$dir"; then
	subroutine
else
	pfad="/home/$USER/secure"
	mkdir $pfad
	mkdir "${pfad%/*}"/."${pfad##*/}"
	subroutine
fi



# Bei der Ersteinrichtung soll ein bin Verzeichnis im /home des Benutzers angelegt werden und dort zwei
# kleine Skripte zum einfachen Ein- und Aushängen des verschlüsselten Ordners hinterlegt werden

file=/home/$USER/bin/$file1
if check_files; then
	wert=true
else
	wert=false
fi

file=/home/$USER/bin/$file2
if check_files; then
	wert2=true
else
	wert2=false
fi

if $wert1 && $wert2; then
	sleep 1
else
	create_skript
fi

echo
echo "Fertig. Programm wird beendet."
echo "Auf wiedersehen!"
echo
exit
