#!/bin/sh
if command -v go >/dev/null 2>&1; then
	brew install go
else
	brew update && brew upgrade go
fi
