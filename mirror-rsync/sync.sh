#!/bin/bash
# execute as a sync script

# Use the first argument as the JOB_NAME, or default to the script's filename
JOB_NAME=${1:-$(basename "$0")}
LOCK_FILE="/var/run/${JOB_NAME}.lock"

if [[ -f "$LOCK_FILE" ]]; then
    echo "Another instance of $JOB_NAME is already running. Exiting."
    exit 1
fi

# Create the lock file
touch "$LOCK_FILE"

trap 'rm -f "$LOCK_FILE"; exit' INT TERM EXIT

if [[ -z "$2" ]] || [[ -z "$3" ]]; then
    echo "Source or destination not set"
    rm -f "$LOCK_FILE"
    exit 1
else
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Beginning sync for $1 to $2"
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
        --executability \
        --verbose \
        "$2" "$3"

    # Check the exit status of rsync
    if [ $? -eq 0 ]; then
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] Sync completed successfully"

        # Set execute permissions on local directories
        find "$3" -type d -exec chmod +rx {} \;
    else
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] Error during synchronization"
    fi
fi

# Remove the lock file
rm -f "$LOCK_FILE"
