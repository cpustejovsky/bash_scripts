#! /usr/bin/env bash

seconds="$((10#$1*60))"

cd "$HOME"/Music/ || exit

mplayer -endpos 0:0:5 gong.opus &> /dev/null
while [ $seconds -gt 0 ]; do
    echo -ne "$(("$seconds" / 60)):$(("$seconds" % 60))\033[0K\r"
   sleep 1
   : $((seconds--))
done
mplayer -endpos 0:0:5 gong.opus &> /dev/null

