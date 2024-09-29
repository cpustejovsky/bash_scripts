#!/usr/bin/bash

mv $HOME/Downloads/helix_rev3_*.json $HOME/development/configs/keyboard/current.json
mv $HOME/Downloads/helix_rev3_*.hex $HOME/development/configs/keyboard/current.hex

qmk flash $HOME/development/configs/keyboard/current.hex

