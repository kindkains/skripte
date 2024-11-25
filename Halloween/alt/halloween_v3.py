#/usr/bin/python3

# Variante 3
# Aus Zeitnot geboren. Dieses Skript braucht nur einen Pi ohne Bewegungssensor und spielt in zufälliger Reihenfolge alle Videos ab.

import random
import os
import subprocess
import time

# Path to the directory containing video files
video_dir = "/home/sandro/Atmosfear"

def get_all_videos():
    # Get a list of all mp4 files in the video directory and its subdirectories
    video_files = []
    for root, dirs, files in os.walk(video_dir):
        for file in files:
            if file.endswith('.mp4'):
                video_files.append(os.path.join(root, file))
    return video_files

def play_video(video_path):
    # Set the XDG_RUNTIME_DIR environment variable
    env = os.environ.copy()
    env['XDG_RUNTIME_DIR'] = f'/run/user/{os.getuid()}'

    # Play the video using VLC in kiosk mode and fullscreen
    subprocess.run(['cvlc', '--play-and-exit', '--fullscreen', '--no-osd', '--no-video-title-show', '--quiet', video_path], env=env)

def play_videos():
    all_videos = get_all_videos()
    while True:
        random.shuffle(all_videos)
        for video in all_videos:
            play_video(video)
            time.sleep(3)  # Pause for 3 seconds before playing the next video

if __name__ == "__main__":
    play_videos()


# Erklärung
# 1. get_all_videos(): Diese Funktion durchsucht das Verzeichnis und alle Unterverzeichnisse nach .mp4-Dateien und gibt eine Liste aller gefundenen Videos zurück.
# 2. play_video(video_path): Diese Funktion spielt ein einzelnes Video ab.
# 3. play_videos(): Diese Funktion mischt die Liste der Videos zufällig und spielt jedes Video einmal ab, bevor sie von vorne beginnt.
