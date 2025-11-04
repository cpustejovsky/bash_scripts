#! /bin/env bash

HR=$(date '+%H')
MIN=$(date '+%M')
if [ "${3^^}" == "AM" ]; then
    echo "Alarm will go off at "$1":"$(printf '%02d' $2)" AM"
    TIME="$(($1*60+24*60+$2-(10#$HR*60+$MIN)))"
elif [ "${3^^}" == "PM" ]; then
    echo "Alarm will go off at "$1":"$(printf '%02d' $2)" PM"
    TIME="$(($1*60+24*60+$2-((10#$HR+12)*60+$MIN)))"
else
    echo "Alarm will run for "$1"hr "$2"min"
    TIME="$(($1*60+$2))"
fi

MAX=$((60*12))
if [ $TIME -gt $MAX ]; then
    echo "$TIME is greater than maximum time; try again"
    exit
fi
echo "$TIME minutes until alarm goes off"
export XDG_RUNTIME_DIR="/run/user/1000"
mplayer -ss 30 -endpos 0:$TIME:00 "$HOME"/Music/brown_noise.mp3
mplayer -endpos 0:5:00 "$HOME"/Music/TES_ambience_soft.mp3
mplayer "$HOME"/Music/chop_suey.mp3
