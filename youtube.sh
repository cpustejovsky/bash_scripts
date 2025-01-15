#! /bin/bash

cd $HOME/Videos
mkdir Priority
cd Priority
touch archive.txt
yt-dlp --download-archive archive.txt https://www.youtube.com/playlist\?list\=PL9d3JV6oTebyRxpegEvVnBg81CMNb-x0K

cd $HOME/Videos
mkdir -p Gophercon/Top
cd Gophercon/Top
touch archive.txt
yt-dlp --download-archive archive.txt https://www.youtube.com/playlist?list=PL9d3JV6oTebwuOQOdQQ6BrbXxttGWpgjm

cd $HOME/Videos
mkdir -p Gophercon/2024/Lightning
cd Gophercon/2024/Lightning
touch archive.txt
yt-dlp --download-archive archive.txt https://www.youtube.com/playlist?list=PL2ntRZ1ySWBdEP9_4K_HTlvOk6orXxxXy

cd $HOME/Videos
mkdir -p Gophercon/2024/Talks
cd Gophercon/2024/Talks
touch archive.txt
yt-dlp --download-archive archive.txt https://www.youtube.com/playlist?list=PL2ntRZ1ySWBdtH-tLdfcDJaWABxySlkRj

cd $HOME/Music
mkdir study
cd study
touch archive.txt
yt-dlp --download-archive archive.txt -x  --audio-quality 0 https://www.youtube.com/playlist\?list\=PL9d3JV6oTebwRR2kVcGQ6_Qgc0LPFhTT6
