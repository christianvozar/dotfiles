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

# Check if Homebrew is installed
if ! command -v brew >/dev/null 2>&1; then
    log_error "Homebrew is not installed. Install Homebrew from https://brew.sh and try again."
    exit 1
fi

# Check if Go is already installed via Homebrew
if brew ls --versions go >/dev/null 2>&1; then
    log_info "Go is already installed."
    exit 0
fi

# Install Go using Homebrew
log_info "Installing Go using Homebrew..."
brew install go

log_info "Go installation completed successfully."
exit 0
