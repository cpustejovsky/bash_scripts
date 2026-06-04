#!/usr/bin/env bash

read -p "Enter the name of the file you want updated [current]: " name
name=${name:-current}

if [ -f  $HOME/Downloads/helix_rev3_*.json ]; then
   mv $HOME/Downloads/helix_rev3_*.json $HOME/development/configs/keyboard/$name.json
fi
if [ -f  $HOME/Downloads/helix_rev3_*.hex ]; then
   mv $HOME/Downloads/helix_rev3_*.hex $HOME/development/configs/keyboard/$name.hex
fi
echo $HOME/development/configs/keyboard/$name.hex
qmk flash $HOME/development/configs/keyboard/$name.hex

