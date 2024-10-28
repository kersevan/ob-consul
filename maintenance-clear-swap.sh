#!/bin/bash

# This script disables and then re-enables swap on the system.
# It can be used for maintenance purposes to clear the swap space.

# Function to log messages
log() {
    local message="$1"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $message"
}

# Disable swap
log "Disabling swap..."
if sudo swapoff -a; then
    log "Swap disabled successfully."
else
    log "Failed to disable swap."
    exit 1
fi

# Enable swap
log "Enabling swap..."
if sudo swapon -a; then
    log "Swap enabled successfully."
else
    log "Failed to enable swap."
    exit 1
fi

log "Swap maintenance completed."
