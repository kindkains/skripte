#!/bin/bash
# Das Skript trägt die aktuelle Cipher (Stand 21.07.2015) in die betroffenen Seiten innerhalb der korrekten Zeile ein. (Bspw. bei Seite ca wird die Zeile 17 ausgetauscht)
# Sollte die Cipher sich ändern, so müsste sie an dieser Stelle entsprechend eingetragen werden. Dabei ist darauf zu achten, dass vor jedem Sonderzeichen (also : ! und +)
# ein Backslash \ gesetzt werden muss, sonst funktioniert der sed Befehl nicht korrekt.

echo "Ersetze eingetragene SSLCipherSuite"
echo "-----------------------------------"
echo ""
sed -i -e 17c"SSLCipherSuite ECDH\+AESGCM\:\!DH\+AESGCM\:ECDH\+AES256\:\!DH\+AES256\:ECDH\+AES128\:\!DH\+AES\:\!ECDH\+3DES\:\!DH\+3DES\:\!RSA\+AESGCM\:\!RSA\+AES\:\!aNULL\:\!MD5\:\!DSS" /etc/apache2/sites-available/ca
sed -i -e 123c"SSLCipherSuite ECDH\+AESGCM\:\!DH\+AESGCM\:ECDH\+AES256\:\!DH\+AES256\:ECDH\+AES128\:\!DH\+AES\:\!ECDH\+3DES\:\!DH\+3DES\:\!RSA\+AESGCM\:\!RSA\+AES\:\!aNULL\:\!MD5\:\!DSS" /etc/apache2/sites-available/k10090
sed -i -e 81c"SSLCipherSuite SSLCipherSuite ECDH\+AESGCM\:\!DH\+AESGCM\:ECDH\+AES256\:\!DH\+AES256\:ECDH\+AES128\:\!DH\+AES\:\!ECDH\+3DES\:\!DH\+3DES\:\!RSA\+AESGCM\:\!RSA\+AES\:\!aNULL\:\!MD5\:\!DSS" /etc/apache2/sites-available/k20002
sed -i -e 161c"SSLCipherSuite ECDH\+AESGCM\:\!DH\+AESGCM\:ECDH\+AES256\:\!DH\+AES256\:ECDH\+AES128\:\!DH\+AES\:\!ECDH\+3DES\:\!DH\+3DES\:\!RSA\+AESGCM\:\!RSA\+AES\:\!aNULL\:\!MD5\:\!DSS" /etc/apache2/sites-available/k20002
sed -i -e 48c"SSLCipherSuite ECDH\+AESGCM\:\!DH\+AESGCM\:ECDH\+AES256\:\!DH\+AES256\:ECDH\+AES128\:\!DH\+AES\:\!ECDH\+3DES\:\!DH\+3DES\:\!RSA\+AESGCM\:\!RSA\+AES\:\!aNULL\:\!MD5\:\!DSS" /etc/apache2/sites-available/leben_mit_chemie

echo ""
echo "Starte Apache-Server neu"
echo "------------------------"
echo ""
/etc/init.d/apache2 restart
