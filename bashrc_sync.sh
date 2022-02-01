#!/usr/bin/env sh

cd $HOME/development/bashprofile
git pull
git checkout main
cp bashrc.txt bashrc_old.txt
cp ~/.bashrc bashrc.txt

CHANGES_EXIST=$(git status --porcelain | wc -l) 
if [ $CHANGES_EXIST -eq 0 ]; then

exit 0

fi

rm bashrc_old.txt
git add .
git commit -m “$(date +”%Y-%m-%d”)”
git push