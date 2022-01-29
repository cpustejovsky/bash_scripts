#!/usr/bin/env sh

cd $HOME/development/second_brain

git pull

CHANGES_EXIST=$(git status --porcelain | wc -l)

if [ $CHANGES_EXIST -eq 0 ]; then

exit 0

fi

git add .; git commit -q -m “$(date +”%Y-%m-%d %H:%M:%S”)”; git push -q