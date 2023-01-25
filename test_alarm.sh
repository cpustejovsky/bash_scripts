#!/bin/bash
export XDG_RUNTIME_DIR="/run/user/1000"
mplayer -ss 30 -endpos 3 volume=100 "$HOME"/Music/brown_noise.mp3
mplayer -endpos 3 volume=50  "$HOME"/Music/loz_oot_intro.mp3
cd "$HOME"/Music/alarm || exit
mplayer volume=25 dir *.mp3
