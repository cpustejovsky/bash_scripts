#!/bin/env bash
PROJECT=$1
NAME=$2
if [ -z "${PROJECT}" ]; then
    echo "Need at least a project"
    exit
fi
if [ -z "${NAME}" ]; then
    NAME="$PROJECT"
fi
clockify-cli in -p "$PROJECT" -d "$NAME" > /dev/null
