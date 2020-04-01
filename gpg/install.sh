#!/bin/sh
if command -v aws >/dev/null 2>&1; then
	brew install gnupg
else
	brew upgrade gnupg
fi
