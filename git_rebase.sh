#!/bin/bash

while getopts ":i" opt; do
  case $opt in
    i)
      INTERACTIVE=true
      ;;
    \?)
      INTERACTIVE=false
      ;;
  esac
done

if [ "$INTERACTIVE" == true ] ; then
  git rebase -i HEAD~$2
else
  git checkout main
  git pull
  git checkout -
  git rebase main
fi

echo "Do you want  to force push now? (type y to continue, CTRL-C to cancel)"
read response
if [ "$response" == "y" ] ; then
  git push --force-with-lease
fi