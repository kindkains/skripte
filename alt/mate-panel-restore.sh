#!/bin/bash
mate-panel --reset
rsync -avP /backup/home/sandro/.config/ /home/sandro/.config/
# killall mate-panel

# rsync -avP /backup/home/sandro/.* /home/sandro/
