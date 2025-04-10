#!/usr/bin/env bash
#
# zip-strip removes macOS files from compressed files.
#
# $1 - filename
#
# Examples
#
#   zip-strip archive.zip
if [ "$(uname -s)" != "Darwin" ]; then
	exit 0
fi

zip -d "$1" "__MACOSX*"
