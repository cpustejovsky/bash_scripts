#!/usr/bin/env sh

find . -type f -exec sed -i "s/$1\b/$2/g" {} \;
