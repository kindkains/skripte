#!/bin/bash
clear

echo "Es sind keine Pfade definiert, daher müssen sich alle Dateien im Verzeichnis dieses Skriptes befinden."
echo ""
echo "Bitte Dateinamen angeben, der eingelesen werden soll: "
read eingabe

cat $eingabe | while read file; do scp $file nas@isoletta.dd-dns.de:/media/HDD1/Filme/ && rm -rvf $file; done;
