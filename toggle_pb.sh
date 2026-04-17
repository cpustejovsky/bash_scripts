#!/bin/bash
ps cax | grep "polybar"
if [ $? -eq 0 ]; then
    killall polybar
else
    polybar > /dev/null &
fi

