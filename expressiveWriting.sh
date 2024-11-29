#!/usr/bin/env sh

FILE="expressiveWriting.txt"
touch $FILE 
echo "Tabula Rasa" > $FILE
nvim $FILE
rm $FILE
