#!/bin/sh

# Configure terminal colors

colorflag="-G"
alias ls="command ls ${colorflag}"
alias l="ls -lF ${colorflag}" # all files, in long format
alias la="ls -laF ${colorflag}" # all files inc dotfiles, in long format
alias lsd='ls -lF ${colorflag} | grep "^d"' # only directories

export CLICOLOR=true
export LSCOLORS='GxFxCxDxBxegedabagaced'
