#!/bin/bash
# For 8 to 5 alarm, 30 19 * * * sh /<PATH>/alarm.sh 9 30 in crontab 
export XDG_RUNTIME_DIR="/run/user/1000"
mplayer -ss 30 -endpos $1:$2:00 "$HOME"/Music/brown_noise.mp3
mplayer -endpos 0:5:00 "$HOME"/Music/TES_ambience_soft.mp3
mplayer "$HOME"/Music/chop_suey.mp3


