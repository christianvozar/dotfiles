#!/usr/bin/env bash

export DOTFILES=~/.dotfiles

if command -v brew >/dev/null 2>&1; then
	if command -v antibody >/dev/null 2>&1; then
		brew tap | grep -q 'getantibody/tap' || brew tap getantibody/tap
		brew install antibody
	else
		brew upgrade antibody
	fi
else
	curl -sL https://git.io/antibody | sudo sh -s -- -b /usr/local/bin
fi

antibody bundle <"$DOTFILES/antibody/bundles.txt" >~/.zsh_plugins.sh
antibody update
