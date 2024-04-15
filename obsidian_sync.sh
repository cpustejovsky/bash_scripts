#!/usr/bin/env sh

cd $HOME/development/second_brain

git pull

CHANGES_EXIST=$(git status --porcelain | wc -l)
if [ "$CHANGES_EXIST" -eq 0 ]; then

exit 0

fi
NOW=$( date '+%F_%H:%M:%S' )
echo $NOW
git add .; git commit -S -m “$NOW”; git push
