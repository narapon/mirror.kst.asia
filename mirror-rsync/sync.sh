#!/bin/bash
# execute as a sync script

if [[ -z "$1" ]] || [[ -z "$2" ]]; then
    echo "Source or destination not set"
else
    echo "Beginning sync for $1"
    echo "Syncing to $2"
    rsync --recursive \
        --links \
        --hard-links \
        --times \
        --human-readable \
        --chmod=a+rX \
        --chmod=ug+w \
        --safe-links \
        --delete-delay \
        --delete \
        --progress \
        "$1" "$2"
fi