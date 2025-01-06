#! /bin/bash

cd $HOME/Videos
mkdir Priority
cd Priority
touch archive.txt
yt-dlp --download-archive  archive.txt https://www.youtube.com/playlist\?list\=PL9d3JV6oTebyRxpegEvVnBg81CMNb-x0K

cd $HOME/Music
mkdir study
cd study
touch archive.txt
yt-dlp --download-archive archive.txt -x  --audio-quality 0 https://www.youtube.com/playlist\?list\=PL9d3JV6oTebwRR2kVcGQ6_Qgc0LPFhTT6
