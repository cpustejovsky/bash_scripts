#!/bin/bash
export XDG_RUNTIME_DIR="/run/user/1000"
mplayer -ss 30 -endpos 06:55:00 "$HOME"/Music/brown_noise.mp3
mplayer "$HOME"/Music/loz_oot_intro_soft.mp3

