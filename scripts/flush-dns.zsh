#!/usr/bin/env zsh
# flush-dns: A helper script to clear the DNS cache on macOS.

# Exit immediately if a command exits with a non-zero status,
# treat unset variables as errors, and fail on pipe failures.
set -euo pipefail

# Logging functions for clear messaging.
log_info() {
    echo "[INFO] $1"
}

log_error() {
    echo "[ERROR] $1" >&2
}

# Ensure the script is running on macOS.
if [[ "$(uname)" != "Darwin" ]]; then
    log_error "This script is intended to run on macOS only."
    exit 1
fi

# Check if sudo is available.
if ! command -v sudo >/dev/null 2>&1; then
    log_error "The sudo command is not available. Please install sudo or run as an administrator."
    exit 1
fi

# Log the start of the DNS cache flush.
log_info "Flushing DNS cache on macOS..."

# Attempt to flush the DNS cache.
sudo killall -HUP mDNSResponder

# Confirm successful DNS cache flush.
log_info "DNS cache flushed successfully."
exit 0
