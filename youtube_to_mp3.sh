#!/usr/bin/env sh

cd $HOME/Music
ID=$1
URL="https://www.youtube.com/watch?v=$ID"
echo "Beginning for $URL"
youtube-dl --extract-audio --audio-format mp3 --audio-quality 0 "$URL"