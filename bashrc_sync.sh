#!/usr/bin/env sh

cd $HOME/development/bashprofile
git fetch
git checkout main
cp bashrc.txt bashrc_old.txt
cp ~/.bashrc bashrc.txt

CHANGES_EXIST=”$(git status --porcelain | wc -l)” 
if [ “$CHANGES_EXIST” -eq 0 ]; then

exit 0

fi

git add .; git commit -q -m “$(date +”%Y-%m-%d %H:%M:%S”)”; git push -q