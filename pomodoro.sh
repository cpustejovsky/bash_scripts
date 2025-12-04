#! /usr/bin/env bash


cd "$HOME"/Music/ || exit
count=0
while [ "$count" -lt 5 ];
do
    seconds="$((5*60))"
    mplayer -endpos 0:0:3 gong.opus &> /dev/null
    while [ $seconds -gt 0 ]; do
        echo -ne "$(("$seconds" / 60)):$(("$seconds" % 60))\033[0K\r"
       sleep 1
       : $((seconds--))
    done
    count=$((count+1))
done
mplayer -endpos 0:0:15 gong.opus &> /dev/null
echo "Finished pomodoro; take a 5 minutes break: tea, water, stretch, pee, pray"
