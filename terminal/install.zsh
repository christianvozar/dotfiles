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

# Check if the Alucard Terminal profile is already installed by verifying Terminal's Window Settings.
if defaults read com.apple.Terminal "Window Settings" 2>/dev/null | grep -q "Alucard"; then
    log_info "Alucard Terminal theme is already installed."
    exit 0
fi

# Check if the Alucard.terminal file exists in the current directory
if [[ ! -f "./Alucard.terminal" ]]; then
    log_error "Alucard.terminal file not found in the current directory."
    exit 1
fi

# Install the Alucard Terminal theme by opening the .terminal file.
log_info "Installing Alucard Terminal theme..."
open "./Alucard.terminal"

log_info "Alucard Terminal theme installation has been triggered. Confirm the import in Terminal if prompted."
exit 0
