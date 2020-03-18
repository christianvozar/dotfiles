# Christian R. Vozar's Magical Mystery dotfiles

# Philosophy

There are a lot of Dotfile repositories out there. Ideally, you would fork another more inspired dotfiles repository but most I found are pretty lacking for all the toolchains I utilize.

# Opinions

1. No secrets - An obvious one but no passwords, tokens, or keys.
2. Software installation allowed.

# Installation

## Software

1. Verify Base Dependencies. `$ make dependencies`
1. Install Software. `$ script/install.sh` executes all `install.sh` scripts recursively in the repository.

## Configure

1. Refresh configurations for installed softare. `$ script/bootstrap.sh`

## (Optional) Configure macOS

1. `$ macos/set-defaults.sh`

# Conventions

* bin/: Anything in bin/ will get added to your $PATH and be made available everywhere.
* topic/*.zsh: Any files ending in .zsh get loaded into your environment.
* topic/path.zsh: Any file named path.zsh is loaded first and is expected to setup $PATH or similar.
* topic/completion.zsh: Any file named completion.zsh is loaded last and is expected to setup autocomplete.
* topic/*.symlink: Any files ending in *.symlink get symlinked into your $HOME. This is so you can keep all of those versioned in your dotfiles but still keep those autoloaded files in your home directory. These get symlinked in when you run script/bootstrap.
* topic/install.sh: Any file with this name and with exec permission, will ran at bootstrap and dot_update phase, and are expected to install plugins, and stuff like that.

# Acknowledgments

This repository owes its structure to Carlos Alexandro Becker [caarlos0]'s Dotfiles setup.
