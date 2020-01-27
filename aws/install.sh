#!/bin/sh
if command -v aws >/dev/null 2>&1; then
	brew install awscli
else
	brew upgrade awscli
fi
