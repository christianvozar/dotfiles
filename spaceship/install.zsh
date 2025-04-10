#!/usr/bin/env zsh
# Exit immediately if a command exits with a non-zero status,
# treat unset variables as an error, and fail on pipe failures.
set -euo pipefail

# Logging functions for clarity
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

# Check if Spaceship is already installed via brew
if brew ls --versions spaceship >/dev/null 2>&1; then
    log_info "Spaceship is already installed."
    exit 0
fi

# Install Spaceship using Homebrew
log_info "Installing Spaceship using Homebrew..."
brew install spaceship

# Define the location of the zsh configuration file
ZSHRC="${HOME}/.zshrc"

# Backup ~/.zshrc if it exists, or create a new file if it doesn't
if [ -f "$ZSHRC" ]; then
    backup="${ZSHRC}.bak.$(date +%Y%m%d%H%M%S)"
    cp "$ZSHRC" "$backup"
    log_info "Backup of .zshrc created at $backup"
else
    touch "$ZSHRC"
    log_info "Created new .zshrc file."
fi

# Get Homebrew prefix and prepare the Spaceship source line
prefix=$(brew --prefix)
spaceship_source="source ${prefix}/opt/spaceship/spaceship.zsh"

# Add the source command only if it is not already present in ~/.zshrc
if grep -Fxq "$spaceship_source" "$ZSHRC"; then
    log_info "Spaceship source line already exists in $ZSHRC."
else
    log_info "Adding Spaceship source line to $ZSHRC."
    echo "$spaceship_source" >> "$ZSHRC" || {
        log_error "Failed to append Spaceship source line to $ZSHRC."
        exit 1
    }
fi

log_info "Installation and configuration completed successfully."
exit 0
