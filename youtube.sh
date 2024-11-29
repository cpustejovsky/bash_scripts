#! /bin/bash

cd $HOME/Videos
mkdir Priority
cd Priority
touch archive.txt
yt-dlp --progress --download-archive archive.txt https://www.youtube.com/playlist\?list\=PL9d3JV6oTebyRxpegEvVnBg81CMNb-x0K
