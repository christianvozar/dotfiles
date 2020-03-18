#!/bin/sh
if command -v kubectl >/dev/null 2>&1; then
	brew install kubernetes-cli
else
	brew update && brew upgrade kubenetes-cli
fi
