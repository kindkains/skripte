#!/bin/bash

# Variablen definieren

BLACK=`tput setaf 0`
ROT=`tput setaf 1`
GRUEN=`tput setaf 2`
GELB=`tput setaf 3`
BLAU=`tput setaf 4`
LILA=`tput setaf 5`
CYAN=`tput setaf 6`
WEISS=`tput setaf 7`
T=`tput setaf 9`

# Funktionen definieren

error() {
	echo ""
	echo "${ROT}"
	echo "Fehlerhafte Eingabe, Programm wird beendet"
	echo "${T}"
	echo ""
	exit;
}

start_fdisk() {
	sudo fdisk $device
	return
}

# Skript Anfang

clear
echo "******************************************************************************"
echo "*                                                                            *"
echo "*                  Verschlüsselung externer Datenträger                      *"
echo "*                                                                            *"
echo "******************************************************************************"
echo ""
echo "Mit diesem Skript lassen sich USB-Laufwerke und USB-Festplatten verschlüsseln"
echo "${ROT}VORSICHT:${T} Dabei werden alle Daten auf dem Datenträger gelöscht!"
echo ""
echo ""

read -p "Ist die Laufwerksbezeichnung bereits bekannt? <j/n> " ant1
if [ $ant1 = j ]; then
	echo ""
	read -p "Bitte Laufwerksbezeichnung angeben (z. B. /dev/sdb): " device
	echo ""
elif [ $ant1 = n ]; then
	echo ""
	echo "Laufwerke werden ausgegeben:"
	lsblk
	echo ""
	read -p "Bitte Laufwerksbezeichnung angeben (z. B. /dev/sdb): " device
else
	error
fi

echo "Zuerst muss mittels fdisk eine neue DOS-Partitionstabelle, sowie eine neue, primäre Partition angelegt werden."
echo "Bitte gleich folgende Schritte in fdisk ausführen:"
echo ""
echo "${WEISS}'o'${T} für eine neue Partitionstabelle"
echo "${WEISS}'w'${T} um die Änderungen zu schreiben"
echo "Weiter mit ${CYAN}<ENTER>${T}"
read blank
echo ""
start_fdisk

echo ""
echo "Als nächstes wird die primäre Partition angelegt."
echo "Bitte gleich folgende Schritte in fdisk ausführen:"
echo ""
echo "${WEISS}'n'${T} für eine neue Partition"
echo "${WEISS}'p'${T} für primäre Partition"
echo "${WEISS}'1'${T} für die erste Partition"
echo "2x mit ${WEISS}'<ENTER>'${T} die Start- und Endsektoren bestätigen"
echo "${WEISS}'w'${T} um die Änderungen zu schreiben"
echo "Weiter mit ${CYAN}<ENTER>${T}"
read blank
echo ""
start_fdisk

echo ""
echo ""
echo "Sie werden gleich aufgefordert die Formatierung mit YES zu bestätigen, sowie"
echo "ein Passwort für den verschlüsselten Datenträger zu wählen"
echo ""
echo "Der Datenträger wird nun mit LUKS formatiert:"
echo "sudo cryptsetup luksFormat $device"
sudo cryptsetup luksFormat $device
sleep 2

echo ""
echo "Das Laufwerk wird nun in das System geladen:"
echo "sudo cryptsetup luksOpen $device CryptDevice"
sudo cryptsetup luksOpen $device CryptDevice
sleep 2

echo ""
echo "Das Laufwerk wird nun noch mit einem normalen, unverschlüsselten Dateiformat bestückt:"
echo "sudo mkfs.vfat /dev/mapper/CryptDevice -n CryptDevice"
sudo mkfs.vfat /dev/mapper/CryptDevice -n CryptDevice
sleep 2

echo ""
echo ""
echo "Fertig."
echo "Das Laufwerk kann nun entfernt werden und wird beim nächsten Mounten automatisch nach dem zuvor"
echo "vergebenen Passwort fragen."
echo ""
echo ""
exit
