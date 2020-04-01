#!/usr/bin/env bash
if command -v packer >/dev/null 2>&1; then
	brew install packer
else
	brew update && brew upgrade packer
fi
