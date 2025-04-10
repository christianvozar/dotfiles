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

# Check if Go is installed
if ! command -v go >/dev/null 2>&1; then
    log_info "Go is not installed. Attempting to install it using ../golang/install.zsh..."
    if [[ -x ../golang/install.zsh ]]; then
        ../golang/install.zsh
    else
        log_error "../golang/install.zsh not found or not executable. Cannot install Go."
        exit 1
    fi
    # Verify that Go is now installed
    if ! command -v go >/dev/null 2>&1; then
        log_error "Go installation appears to have failed."
        exit 1
    fi
fi

# Check if the grpc package for go is already installed
if go list google.golang.org/grpc >/dev/null 2>&1; then
    log_info "grpc for go is already installed."
    exit 0
fi

# Install grpc for go using go get
log_info "Installing grpc for go..."
go install google.golang.org/grpc@latest

log_info "grpc for go installation completed successfully."
exit 0
