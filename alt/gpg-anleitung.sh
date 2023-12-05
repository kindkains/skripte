#!/bin/bash
clear
echo "*******************************************************************************************"
echo "*******************************************************************************************"
echo "***********************GPG-Anleitung. Terminal Befehle*************************************"
echo "*******************************************************************************************"
echo "*******************************************************************************************"

echo "Schlüssel erstellen:"
echo "--------------------"
echo "gpg --gen-key"
echo ""
echo "Art des Schlüssels wählen, Gültigkeitsdauer festlegen und bestätigen."
echo "Name des Schlüssels z. B. Nickname oder Email Adresse eingeben."
echo "Passwort eingeben, warten bis Schlüssel erstellt wurde."
echo ""
echo "Einen erstellten Schlüssel komplett löschen:"
echo "--------------------------------------------"
echo "gpg --delete-secret-and-public-key SCHLÜSSELNAME"
echo ""
echo "Einen privaten Schlüssel löschen:"
echo "---------------------------------"
echo "gpg --delete-secret-key SCHLÜSSELNAME"
echo ""
echo "Einen öffentlichen Schlüssel löschen:"
echo "-------------------------------------"
echo "gpg --delete-key SCHLÜSSELNAME"
echo ""
echo "Privaten Schlüssel in Datei exportieren:"
echo "----------------------------------------"
echo "gpg -a --output DATEINAME.asc --export-secret-keys SCHLÜSSEL-ID oder -NAME"
echo ""
echo "Öffentlichen Schlüssel in Datei exportieren:"
echo "--------------------------------------------"
echo "gpg -a --output DATEINAME.asc --export SCHLÜSSEL-ID oder -NAME"
echo "Passwort eines Schlüssels ändern:"
echo "---------------------------------"
echo "gpg --edit-key SCHLÜSSELNAME passwd"
echo ""
echo "Alle bekannten Schlüssel auflisten:"
echo "-----------------------------------"
echo "gpg --list-keys"
echo ""
echo "Einen Schlüssel editieren:"
echo "--------------------------"
echo "gpg --edit-key SCHLÜSSELNAME oder ID"
echo ""
echo "Öffentlichen Schlüssel in Datei exportieren:"
echo "--------------------------------------------"
echo "touch /home/sandro/pubKey"
echo "gpg --import /home/sandro/pubKey"
echo ""
echo "Verschlüsselte Nachricht erstellen:"
echo "-----------------------------------"
echo "gpg -e -a -s"
echo "1. Email Adresse des Empfängers eintragen und ENTER drücken."
echo "2. ggf. weitere Email Adressen eintragen."
echo "3. Zeile leer lassen und ENTER, wenn fertig."
echo "4. Gewünschte Nachricht eintippen. Beenden mit Strg + D"
echo "5. Nachricht erscheint verschlüsselt im Terminal. Kopieren und versenden."
echo "6. Die Option -s signiert die Mail, sie kann auch weg gelassen werden."
echo "Verschlüsselte Nachricht mit bestimmten Key erstellen:"
echo "------------------------------------------------------"
echo "gpg -e -a -r B1890090"
echo "Wichtig hierbei ist, dass nach -r die ID des gewünschten Keys eingegeben werden muss."
echo "Man gibt anschließend direkt den zu verschlüsselnden Text ein."
echo ""
echo "Verschlüsselte Nachricht lesen:"
echo "-------------------------------"
echo "gpg -d"
echo "1. Verschlüsselten Text ins Terminal kopieren."
echo "2. Passwort zum Entschlüsseln eingeben."
echo "3. Strg + D drücken, um entschlüsselte Nachricht zu lesen"
echo ""
echo "Eine Datei verschlüsseln / entschlüsseln"
echo "----------------------------------------"
echo "Verschlüsseln: gpg --output Geheimdokument.gpg --encrypt --recipient KindKains Geheimdokument.doc"
echo "Entschlüsseln: gpg --output Geheimdokument.doc --decrypt Geheimdokument.gpg"
echo ""
echo "Neuen öffentlichen Schlüssel speichern für Evolution"
echo "----------------------------------------------------"
echo "1. Das Programm 'seahorse' öffnen, indem man dessen Name ins Terminal eingibt."
echo "2. Auf den Menüpunkt 'GnuPG-Schlüssel' klicken (Unterpunkt von PGP-Schlüssel)."
echo "3. Öffentlichen Schlüssel markieren und in Zwischenablage kopieren."
echo "4. In Seahorse einfach STRG+V drücken und 'Importieren' wählen"
echo "5. Das Alias 'crypt' ins Terminal tippen und importierten Schlüssel wählen."
echo "6. Es wird der Inhalt der Datei /home/sandro/Dokumente/GnuPG/Evolution/adresse mit dem gewählten Schlüssel verschlüsselt"
echo "   und im selben Verzeichnis abgelegt. Der Befehl für die Verschlüsselung lautet:"
echo "gpg --encrypt -a --recipient NAME_bzw._ID_des_Schlüssels Pfad_zur_zu_verschlüsselnden_Datei"
echo ""