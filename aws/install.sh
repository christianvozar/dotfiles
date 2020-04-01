#!/usr/bin/env bash

if is_installed "aws"; then
	echo "aws installed"
else
	echo "aws not installed"
fi

# is_installed() takes a command and associated brew package.
# If the command is not found the package is installed, if it is found
# the package is updated to the latest version.
is_installed () {
	if hash $1 2>/dev/null; then
		return 0
	else
		return 1
	fi
}
