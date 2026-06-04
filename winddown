#!/usr/bin/env bash
sudo systemctl bluetooth stop
redshift -P -O 1500
rfkill block bluetooth

sleep 30m
xset dpms force off && systemctl suspend
