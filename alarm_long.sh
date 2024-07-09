#!/bin/bash
export XDG_RUNTIME_DIR="/run/user/1000"
mplayer -ss 30 -endpos 11:15:00 "$HOME"/Music/brown_noise.mp3
mplayer "$HOME"/Music/TES_ambience_soft.mp3
