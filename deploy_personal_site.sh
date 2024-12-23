#!/bin/bash

cd $HOME/development/go/personal-site/
status=$(git status)

if [[ $status == *"main"* ]] && [[ $status == *"nothing to commit"* ]]; then
    ./build.sh
    yes | gcloud app deploy
fi

