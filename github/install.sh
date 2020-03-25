#!/bin/sh
if command -v gh >/dev/null 2>&1; then
	brew install github/gh/gh
else
	brew update && brew upgrade gh
fi
