#!/usr/bin/env zsh


cd "$HOME"/Music/ || exit
base=$(clockify-cli report today -F)
sleep 5s
check=$(clockify-cli report today -F)

# if [ "$base" -eq "$check" ]; then
if (( $(echo "$base == $check" | bc -l) )); then
    dunstify "Generate Options => Anticipate What Will Happen => Act in spite of resistance => Reflect On Yourself" ""
    quote
    mplayer navi.opus -endpos 0:0:6 &> /dev/null
    exit
fi



