#! /usr/bin/env bash

function wait(){
    seconds="$(("$1"*60))"
    while [ $seconds -gt 0 ]; do
        MIN=$(("$seconds" / 60))
        SEC=$(("$seconds" % 60))
        printf "%02d:%02d\033[0K\r" $MIN $SEC
       sleep 1
       : $((seconds--))
    done
}

PROJECT=$1
if [[ "$PROJECT" != "tech" && "$PROJECT" != "metaphysical wellbeing" ]]; then
    echo "$1 is not a valid project"
    exit
fi
cd "$HOME"/Music/ || exit

read -p "What $PROJECT project do you want to make progress on? " task
read -p "How will you rest before $task? " rest
dunstify "$rest until you hear the horn" ""
/home/cpustejovsky/development/go/quotes/popup -f /home/cpustejovsky/.local/share/chezmoi/dot_config/quotes/prayers.txt
clockify-cli in -p rest -d "${rest}" > /dev/null
wait 5
clockify-cli out > /dev/null
mplayer reveille.opus -endpos 0:0:6 &> /dev/null
start="$(date '+%H:%M:%S')"
echo "starting $task at $start for 25 minutes"
clockify-cli in -p "$PROJECT" -d "${task}" > /dev/null
wait 25
dunstify "You are one step closer to being the human being you wish to be. This is a win. やった" ""
mplayer loz-chest-opening.opus &> /dev/null
