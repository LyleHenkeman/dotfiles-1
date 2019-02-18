# dotfiles

## What is it? 
This repo contains a collection of so-called 'dotfiles'. Dotfiles are configuration files, usually prefixed by a dot, that are mostly used on Unix-like systems. This repository contains dotfiles for several things, including: 
 - bash
 - zsh
 - git
 - vim
 - ... 

## Disclaimer
These dotfiles are subject to change. Feel free to clone or fork it. But I am in no way responsible for this setup not working on your machine, breaking your current setup or otherwise harming your existence.

## Automatic setup
`curl -Lks https://tinyurl.com/linuxspecialist-dotfiles | bash`

The automatic setup does it the way I like it and the setup can be used for both Linux (Debian) and MacOS.


## Manual setup
Add the dotfiles alias to .zshrc

`echo "dotfiles='$(which git) --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> ~/.zshrc`

Add .dotfiles to .gitignore to prevent recursion problems

`echo ".dotfiles" >> ~/.gitignore`

Clone the dotfiles into a bare repository

`git clone --bare https://github.com/dsteenstra/dotfiles.git $HOME/.dotfiles`

Define dotfiles alias in current shell

`dotfiles='$(which git) --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'`

Create backup directory for original files

`mkdir -p .dotfiles-backup && \`

Move original dotfiles into backup directory

`dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfiles-backup/{}`

Checkout the actual dotfiles from remote git repository

`dotfiles checkout`

Do not show untracked files

`dotfiles config --local status.showUntrackedFiles no`
