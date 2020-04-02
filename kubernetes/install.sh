#!/usr/bin/env bash
if command -v kubectl >/dev/null 2>&1; then
	brew install kubernetes-cli
else
	brew update && brew upgrade kubenetes-cli
fi

if command -v kpt >/dev/null 2>&1; then
	brew tap GoogleContainerTools/kpt https://github.com/GoogleContainerTools/kpt.git
	brew install kpt
else
	brew update && brew upgrade kpt
fi

