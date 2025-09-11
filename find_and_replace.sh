#!/usr/bin/env bash

find . -type f -exec sed -i "s/$1\b/$2/g" {} \;
