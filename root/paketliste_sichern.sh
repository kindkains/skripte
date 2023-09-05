#!/bin/bash

mkdir -p /root/paketlisten
cd /root/paketlisten

# Um eine Liste zu erstellen, die nur die selbst installierten Pakete enthält, führt man folgenden Befehl aus
comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u) > nachinstallierte_pakete.txt

# Um z.B. einen zweiten Ubuntu-Rechner mit der gleichen Paketkonfiguration zu erstellen oder bei einer Neuinstallation des Systems schnell
# alle zuvor installierten Pakete zu übernehmen, kann man mit dem Befehl
dpkg --get-selections | awk '$2 == "install" {print $1}' > packages.list.save

# Außerdem empfiehlt es sich, den erweiterten Paketstatus (automatisch oder manuell installiert) zu sichern (Dateien package-states-auto und package-states-manual):
apt-mark showauto > package-states-auto
apt-mark showmanual > package-states-manual

# Möchte man diese Liste zur Installation in einer Ubuntu-Neuinstallation verwenden, ist außerdem ein Sichern bzw. Kopieren der Paketquellen
# sowie das Exportieren der vertrauenswürdigen Signierungsschlüssel nötig, damit auch Pakete aus nachträglich hinzugefügten Quellen ohne Probleme
# installiert werden können. Der folgende Befehl sichert diese Informationen in die Datei sources.list.save:
find /etc/apt/sources.list* -type f -name '*.list' -exec bash -c 'echo -e "\n## $1 ";grep "^[[:space:]]*[^#[:space:]]" ${1}' _ {} \; > sources.list.save 

# Folgender Befehl kopiert den Schlüsselbund fast aller manuell hinzugefügten vertrauenswürdigen Schlüssel in die Datei trusted-keys.gpg:
sudo cp /etc/apt/trusted.gpg trusted-keys.gpg 

# Extra installierte Schlüsselbunde unter /etc/apt/trusted.gpg.d werden dabei nicht gesichert, sollten aber über die jeweiligen Pakete nachinstalliert werden.
# Man kann diese auch mit folgendem Befehl extra sichern:
sudo cp -R /etc/apt/trusted.gpg.d trusted.gpg.d.save 

# Wenn man Software über das Ubuntu-Software-Center erworben hat und diese mit der oben erstellten Paketliste mit installieren möchte, benötigt man noch die Datei auth.conf:
sudo cp /etc/apt/auth.conf auth.conf
