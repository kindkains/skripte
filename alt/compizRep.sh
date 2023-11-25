#!/bin/bash
clear
echo "Compiz macht Ärger?"
echo "Okay, ich lösche die Einstellungen:"
echo ""
echo "rm -rf /home/sandro/.config/compiz-1"
rm -rf /home/sandro/.config/compiz-1
echo ""
echo "Jetzt sollte es wieder gehen!"
mate-wm-recovery
echo "Falls nicht, bitte rebooten!"
