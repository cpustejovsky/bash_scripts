#!/usr/bin/env sh

if [[ "$1" != "" ]]; then
     USER="$1"
else
    echo "provide github user and parent (exp: cpustejovsky/franz)"
    exit
fi
if [[ "$2" != "" ]]; then
     CUR="$2"
else
    echo "provide current package name"
    exit
fi
if [[ "$3" != "" ]]; then
     NEW="$3"
else
    echo "provide new package name"
    exit
fi

echo "USER: $USER"

CUR="github.com/$USER/$CUR"
NEW="github.com/$USER/$NEW"
echo "CUR: $CUR"
echo "NEW: $NEW"
go mod edit -module ${NEW}
find . -type f -name '*.go' -exec perl -pi -e 's/$ENV{CUR}/$ENV{NEW}/g' {} \;
