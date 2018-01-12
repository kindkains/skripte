#!/bin/bash
sudo mount //DC-SP2.pl.lan/Gemeinsam /home/sandro/Netzlaufwerk-Gemeinsam -o credentials=/home/sandro/.credentials
sudo mount //dc-ko3.pl.lan/sandro.isoletta /home/sandro/Netzlaufwerk -o credentials=/home/sandro/.credentials





#Falls das nicht geht, dieses hier probieren
#mount //DC-SP2.pl.lan/Gemeinsam /home/sandro/Netzlaufwerk-Gemeinsam -o credentials=/home/sandro/.credentials,sec=ntlm
#mount //dc-ko3.pl.lan/sandro.isoletta /home/sandro/Netzlaufwerk -o credentials=/home/sandro/.credentials,sec=ntlm
