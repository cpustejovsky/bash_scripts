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

cd "$HOME"/Music/ || exit
REST="rest"
META="metaphysical wellbeing"
TECH="tech"
PROJECT=""
read -p "tech, meta, or rest? " answer
case "$answer" in
    "meta")
        PROJECT="$META"
        ;;
    "$TECH")
        PROJECT=$TECH 
        ;;
    "$REST")
        PROJECT=$REST
        ;;
    *)
        echo "no match"
        exit
        ;;
esac
read -p "What $PROJECT project do you want to make progress on? " task
start="$(date '+%H:%M:%S')"
echo "starting $task at $start for 5 minutes"
clockify-cli in -p "$PROJECT" -d "${task}" > /dev/null
wait 5
dunstify "やった! You did five minutes! Do you want to keep going?" ""
mplayer loz_victory.opus &> /dev/null
