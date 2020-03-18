#!/bin/sh
if command -v node >/dev/null 2>&1; then
	brew install node
else
	brew update && brew upgrade node
fi
