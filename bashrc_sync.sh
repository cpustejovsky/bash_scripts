#!/usr/bin/env sh

cd $HOME/development/bashprofile
git fetch
git checkout main
cp bashrc.txt bashrc_old.txt
cp ~/.bashrc bashrc.txt

CHANGES_EXIST=”$(git status --porcelain | wc -l)” 

if [ $CHANGES_EXIST != "0" ]; then

exit 0

fi
echo "hello"
git add .; git commit -q -m “$(date +”%Y-%m-%d”)”; git push -q