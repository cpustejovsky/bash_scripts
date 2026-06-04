#!/bin/bash
all_args=("$@")
type="$1"
rest_args=("${all_args[@]:1}")

text="${rest_args[@]}"

if [[ $type != "prayers" && $type != "quotes" && $type != "affirmations" ]]; then
   echo "first argument must be 'prayers' or 'quotes' or 'affirmations'" 
   exit
fi

quotes="/home/cpustejovsky/.local/share/chezmoi/dot_config/quotes/"
file="${quotes}${type}.txt"
echo "$text" >> $file
cd /home/cpustejovsky/development/go/quotes
go build -o popup ./cmd/dunst/main.go


