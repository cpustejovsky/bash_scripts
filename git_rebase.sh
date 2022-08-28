#!/bin/bash

while getopts ":icm" opt; do
  case $opt in
    i)
      git rebase -i HEAD~$2
      ;;
    c)
      git rebase --continue
      ;;
    m)
      git checkout main
      git pull
      git checkout -
      git rebase main
      ;;
    \?)
      exit 1
      ;;
  esac
done

echo "Do you want  to force push now? (type y and press enter to continue, CTRL-C to cancel)"
read response
if [ "$response" == "y" ] ; then
  git push --force-with-lease
fi