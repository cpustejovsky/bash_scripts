#!/usr/bin/env bash

dir=$1
compare=$2

echo "comparing $compare to $dir"

for f in "$dir"/*.md; do
    # cmp -"bs "$f" "$compare" || echo "$f is an empty template"
    # if [ cmp -s "$f" "$compare" ]; then
    if cmp -s "$f" "$compare"; then
        rm $f
    fi
done
