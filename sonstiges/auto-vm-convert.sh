#!/bin/bash
# Dieses Skript wurde geschrieben, um alle im LDAP Kurs erzeugten virtuellen Maschinen vom Qemu Format
# qcow2 automatisch ins Virtualbox Format vdi zu konvertieren
clear
echo "************************************************************************************************"
echo "*************************************A U T O C O N V E R T**************************************"
echo "************************************************************************************************"
echo "Ein Tool zur Konvertierung von qcow2 VMs nach vdi VMs                                           "
echo "Geschrieben von Sandro Isoletta                                                                 "
echo "am 15.11.2015"
echo ""
echo ""
echo ""
echo ""
quelle="/home/sandro/Netzlaufwerk/LDAP-Kurs/Images/"
ziel="/home/sandro/Netzlaufwerk/VirtualMachines/LDAP-Testumgebung/"

for quelle in $quelle* 
	do 
		prefix="${quelle%.*}"
		cache="${quelle##*/}"
		filename="${cache%.*}"

		echo "Lese Dateinamen ein"
  		echo "Konvertiere: $filename.qcow2 nach $filename.img (raw)"
		echo ""
		qemu-img convert $quelle -O raw $ziel$filename.img
		echo ""
		echo "Konvertiere: $filename.img (raw) nach $filename.vdi"
		echo ""
		VBoxManage convertfromraw --format VDI $ziel$filename.img $ziel$filename.vdi
		echo ""
		echo "Entferne übergroße RAW Datei mit dem Namen $ziel$filename.img"
		echo ""
		rm $ziel$filename.img
#		echo "Entferne Quelldatei $filename.qcow2"
#		rm $quelle
		echo ""
		echo "VDI Image auf Normalmaß schrumpfen"
		VBoxManage modifyvdi $ziel$filename.vdi compact
		echo ""
done
echo ""
echo ""
echo "Alle virtuellen Maschinen wurden erfolgreich konvertiert!"
echo "************************************************************************************************"
echo "*********************************************E N D E********************************************"
echo "************************************************************************************************"
