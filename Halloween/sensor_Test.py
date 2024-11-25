#!/usr/bin/python3

# Dieses Skript ist nur dafür da, um die Bewegungserfassung des Sensors zu testen, und ob man die richtige GPIO gewählt hat.

import RPi.GPIO as GPIO
import time

# Set up GPIO for the motion sensor
GPIO.setmode(GPIO.BCM)
PIR_PIN = 17  # Ändere dies auf den verwendeten GPIO-Pin
GPIO.setup(PIR_PIN, GPIO.IN)

try:
    print("Test des Bewegungssensors. Warte auf Bewegung...")
    while True:
        if GPIO.input(PIR_PIN):
            print("Bewegung erfasst!")
        else:
            print("Keine Bewegung erfasst.")
        time.sleep(1)
except KeyboardInterrupt:
    print("Test beendet.")
finally:
    GPIO.cleanup()
