#!/usr/bin/env sh

FILE="expressiveWriting.txt"
touch $FILE 
echo "After you're done, go to your icon corner and stare at an icon" > $FILE
nvim $FILE
go run $HOME/development/go/ready-steady-go/secret/main.go -file $FILE | xclip -sel clip
rm $FILE
