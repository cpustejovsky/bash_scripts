#!/usr/bin/env sh

cd $HOME/development/configs
git pull
git checkout main
cp gitconfig.txt gitconfig_old.txt
cp ~/.gitconfig gitconfig.txt

CHANGES_EXIST=$(git status --porcelain | wc -l) 
if [ $CHANGES_EXIST -eq 0 ]; then

exit 0

fi

rm gitconfig_old.txt
git add .
git commit -S -m “$(date +”%Y-%m-%d”)”
git push