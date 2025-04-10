#!/usr/bin/env zsh
# zip-strip: Removes macOS metadata from a zip archive.
#
# Usage:
#   ./zip-strip.zsh <zip_file>
#
# This script removes the "__MACOSX" directories from the provided zip file.
# It only runs on macOS. If not running on macOS, the script exits without an error.
#
# Exit immediately if a command exits with a non-zero status,
# treat unset variables as an error, and fail on pipe failures.
set -euo pipefail

# Logging functions for consistent messaging.
log_info() {
    echo "[INFO] $1"
}

log_error() {
    echo "[ERROR] $1" >&2
}

# Check if the current system is macOS.
if [[ "$(uname -s)" != "Darwin" ]]; then
    log_info "This script is intended for macOS only. Exiting."
    exit 0
fi

# Validate that a zip file has been provided.
if [[ "$#" -lt 1 ]]; then
    log_error "No zip file provided. Usage: $0 <zip_file>"
    exit 1
fi

ZIP_FILE="$1"

# Ensure the file exists and is a regular file.
if [[ ! -f "$ZIP_FILE" ]]; then
    log_error "The file '$ZIP_FILE' does not exist or is not a regular file."
    exit 1
fi

log_info "Removing macOS metadata from '$ZIP_FILE'..."

# Execute the command to remove __MACOSX directories from the zip archive.
zip -d "$ZIP_FILE" "__MACOSX*" || {
    log_error "Failed to remove macOS metadata from '$ZIP_FILE'."
    exit 1
}

log_info "macOS metadata removed successfully from '$ZIP_FILE'."
exit 0
