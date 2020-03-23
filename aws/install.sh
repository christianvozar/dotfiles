#!/bin/sh
if command -v aws >/dev/null 2>&1; then
	brew install awscli
	brew cask install aws-vault
else
	brew upgrade awscli
	brew cask upgrade aws-vault
fi

