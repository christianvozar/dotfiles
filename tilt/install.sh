#!/usr/bin/env bash
if hash tilt >/dev/null 2>&1; then
	curl -fsSL https://raw.githubusercontent.com/tilt-dev/tilt/master/scripts/install.sh | bash
