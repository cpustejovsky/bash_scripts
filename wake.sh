#!/bin/bash

correct=false

ask () {
  echo "So you want to wake up? Well, tell me who you are: "
  read answer
  if [ "$answer" = "a new creation" ]; then
    killall -9 mplayer
    killall -9 mplayer
    correct=true
    return
  fi
  echo "try again"
}

while [ $correct = false ]
do
  ask
done
