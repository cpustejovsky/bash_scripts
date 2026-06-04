#!/bin/env bash

cd "$HOME"/development/go/personal-site/ || exit
status=$(git status)

if [[ $status == *"main"* ]] && [[ $status == *"nothing to commit"* ]]; then
    ./build.sh
    yes | gcloud app deploy
fi

