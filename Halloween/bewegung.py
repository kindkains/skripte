#!/usr/bin/python3

# Variante 2
# Dieses Skript muss auf einen Pi mit Bewegungssensor liegen.
# Wird eine Bewegung erfasst, so führt er via SSH einen Remote Befehl auf einem zweiten Pi aus, welcher dann
# ein zufälliges Video abspielt.
# Hierzu müssen die 3 Variablen unten angepasst werden.

import RPi.GPIO as GPIO
import time
import os

# Set up GPIO for the motion sensor
GPIO.setmode(GPIO.BCM)
PIR_PIN = 17  # Ändere dies auf den verwendeten GPIO-Pin
GPIO.setup(PIR_PIN, GPIO.IN)

# SSH-Verbindungsdetails für Raspberry Pi 2
# remote_pi_ip = "192.168.0.66"  # IP-Adresse des zweiten Raspberry Pi
remote_pi_ip = "hpi"  # IP-Adresse des zweiten Raspberry Pi
remote_pi_user = "sandro"         # Benutzername des zweiten Raspberry Pi
# remote_pi_command = "python3 /home/sandro/halloween_v2.py"  # Befehl, der auf dem zweiten Raspberry Pi ausgeführt wird
remote_pi_command = "/home/sandro/Halloween/halloween.sh"  # Befehl, der auf dem zweiten Raspberry Pi ausgeführt wird

def send_ssh_command():
#    ssh_command = f"ssh {remote_pi_user}@{remote_pi_ip} '{remote_pi_command}'"
    ssh_command = f"ssh {remote_pi_user}@{remote_pi_ip} -t '{remote_pi_command}'"
    os.system(ssh_command)

try:
    print("Motion sensor activated. Waiting for motion...")
    while True:
        if GPIO.input(PIR_PIN):
            print("Motion detected! Sending SSH command to remote Raspberry Pi.")
            send_ssh_command()
            # Wait for a while to avoid multiple triggers
            time.sleep(10)
        time.sleep(1)
except KeyboardInterrupt:
    print("Program terminated.")
finally:
    GPIO.cleanup()
