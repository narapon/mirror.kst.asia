#!/bin/bash
# execute as a sync script with proper locking using flock

# Use the first argument as the JOB_NAME, or default to the script's filename
JOB_NAME=${1:-$(basename "$0")}
LOCK_FILE="/var/run/${JOB_NAME}.lock"

# Use flock for atomic locking - if lock is held, exit immediately
exec 200>"$LOCK_FILE"
if ! flock -n 200; then
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Another instance of $JOB_NAME is already running. Exiting."
    exit 0
fi

# Lock acquired - write our PID
echo $$ >&200

trap 'rm -f "$LOCK_FILE"; exit' INT TERM EXIT

if [[ -z "$2" ]] || [[ -z "$3" ]]; then
    echo "Source or destination not set"
    rm -f "$LOCK_FILE"
    exit 1
else
    SRC="$2"
    DST="$3"
    shift 3
    EXTRA_ARGS="$@"
    
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Beginning sync for $JOB_NAME: $SRC -> $DST"
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
        $EXTRA_ARGS \
        "$SRC" "$DST"

    # Check the exit status of rsync
    if [ $? -eq 0 ]; then
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] Sync completed successfully"

        # Set execute permissions on local directories
        find "$DST" -type d -exec chmod +rx {} \; 2>/dev/null || true
    else
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] Error during synchronization"
    fi
fi

# Remove the lock file
rm -f "$LOCK_FILE"
