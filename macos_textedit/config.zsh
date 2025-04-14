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

log_info "Configuring macOS TextEdit"

# Set TextEdit RichText to 0 (as an integer value)
defaults write com.apple.TextEdit RichText -int 0

# Set TextEdit author to "Christian R. Vozar"
defaults write com.apple.TextEdit author -string "Christian R. Vozar"

# Set TextEdit HeightInChars to 40
defaults write com.apple.TextEdit HeightInChars -int 40

log_info "TextEdit settings have been updated successfully."
exit 0
