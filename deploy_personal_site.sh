#!/bin/bash

cd $HOME/go/src/personal-site/
status=$(git status)

if [[ $status == *"main"* ]] && [[ $status == *"nothing to commit"* ]]; then
    ./build.sh
    yes | gcloud app deploy
fi

