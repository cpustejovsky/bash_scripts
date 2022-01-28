#!/usr/bin/env sh

ZK_PATH=”$HOME/development/second_brain

cd “$ZK_PATH”

git pull

CHANGES_EXIST=”$(git status --porcelain | wc -l)”

if [ $CHANGES_EXIST != "0" ]; then

exit 0

fi

git add .; git commit -q -m “$(date +”%Y-%m-%d %H:%M:%S”)”; git push -q