#!/usr/bin/python3

# Variante 1
# Dieses Skript funktioniert mit nur einem Raspberry Pi.
# Es wird durch den Bewegungssensor getriggert und spielt dann zufällig ein Video aus dem Pfad /home/sandro/Atmosfear ab
# Ich glaube, dieses funktioniert noch nicht mit Unterordnern, die mp4 Datein müssen direkt in dem Verzeichnis liegen

import RPi.GPIO as GPIO
import time
import random
import os
import subprocess

# Set up GPIO for the motion sensor
GPIO.setmode(GPIO.BCM)
PIR_PIN = 17  # Ändere dies auf den verwendeten GPIO-Pin
GPIO.setup(PIR_PIN, GPIO.IN)

# Path to the directory containing video files
video_dir = "/home/sandro/Atmosfear"

def play_random_video():
    # Get a list of all mp4 files in the video directory
    video_files = [f for f in os.listdir(video_dir) if f.endswith('.mp4')]

    if not video_files:
        print("No video files found in the directory.")
        return

    # Choose a random video file
    video_file = random.choice(video_files)
    video_path = os.path.join(video_dir, video_file)

    # Set the XDG_RUNTIME_DIR environment variable
    env = os.environ.copy()
    env['XDG_RUNTIME_DIR'] = f'/run/user/{os.getuid()}'

    # Play the video using VLC in kiosk mode and fullscreen
    subprocess.run(['cvlc', '--play-and-exit', '--fullscreen', '--no-osd', '--no-video-title-show', '--quiet', video_path], env=env)

def set_hdmi_black():
    # Set HDMI output to black screen using xset
    subprocess.run(['xset', 'dpms', 'force', 'off'])

def set_hdmi_on():
    # Turn HDMI output back on using xset
    subprocess.run(['xset', 'dpms', 'force', 'on'])

try:
    print("Motion sensor activated. Waiting for motion...")
    set_hdmi_black()
    while True:
        if GPIO.input(PIR_PIN):
            print("Motion detected! Playing a random video.")
            set_hdmi_on()
            play_random_video()
            set_hdmi_black()
            # Wait for a while to avoid multiple triggers
            time.sleep(10)
        time.sleep(1)
except KeyboardInterrupt:
    print("Program terminated.")
finally:
    GPIO.cleanup()
