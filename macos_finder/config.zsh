#!/usr/bin/env zsh
# Exit immediately if a command exits with a non-zero status,
# treat unset variables as an error, and fail on pipe failures.
set -euo pipefail

# Logging functions
log_info() {
    echo "[INFO] $1"
}

log_error() {
    echo "[ERROR] $1" >&2
}

log_info "Configuring Finder macOS Finder"

# Set Finder WarnOnEmptyTrash to 0 (as an integer value)
defaults write com.apple.Finder WarnOnEmptyTrash -int 0

# Set Finder ShowHardDrivesOnDesktop to 1 (as an integer value)
defaults write com.apple.Finder ShowHardDrivesOnDesktop -int 1

# Set Finder ShowExternalHardDrivesOnDesktop to 1 (as an integer value)
defaults write com.apple.Finder ShowExternalHardDrivesOnDesktop -int 1

log_info "Finder settings have been updated successfully."
exit 0
