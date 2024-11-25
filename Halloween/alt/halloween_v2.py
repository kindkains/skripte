#!/usr/bin/python3

# Variante 2
# Dieses Skript soll auf dem Video-Beamer-Pi liegen und einfach immer ein zufälliges Video aus einem der Unterordner in
# /home/sandro/Atmosfear abspielen. Das Skript soll von einem zweiten Pi mit Bewegungssensor getriggert werden, welcher dieses
# Skript dann remote via SSH ausführt. Auf diesem zweiten Pi muss das Skript bewegung.py liegen

import random
import os
import subprocess

# Path to the directory containing video files
video_dir = "/home/sandro/Atmosfear"

def play_random_video():
    # Get a list of all mp4 files in the video directory and its subdirectories
    video_files = []
    for root, dirs, files in os.walk(video_dir):
        for file in files:
            if file.endswith('.mp4'):
                video_files.append(os.path.join(root, file))

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

if __name__ == "__main__":
    play_random_video()
