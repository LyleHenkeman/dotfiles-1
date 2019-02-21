![Linux Specialist Logo](https://linux-specialist.nl/img/datacenter-logo.jpg)
# dotfiles

## What is it? 
This repo contains a collection of so-called 'dotfiles'. Dotfiles are configuration files, usually prefixed by a dot, that are mostly used on Unix-like systems. This repository contains dotfiles for several things that I personally use on a day to day basis. 

## Disclaimer
These dotfiles are subject to change. Feel free to clone or fork it. But I am in no way responsible for this setup not working on your machine, breaking your current setup or otherwise harming your existence.
Also note that these dotfiles are personalized so make sure to replace my name with your own if you decide to use it. 

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

## dotenv (~/.env)

This repository does not include a dotenv directory. because I'm not about to share my private credentials and environment settings.
One could create a directory structure like this:

```
.env
├── credentials
│   └── <org>
│       └── <project>.env
├── global.env
├── machines
│   ├── <hostname>.env
│   └── <othermachine>.env
├── projects
│   ├── <project1>.env
│   ├── <project2>.env
│   └── <project3>.env
```

* `global.env` is always loaded and contains generic environment variables (like LANG, EDITOR etc..)
* `machines/hostname.env` is loaded depending on the local hostname (duh) for machine specific variables. 
* `projects/projectname.env` could be loaded by direnv (.envrc) by adding `load_env project/project1`
* `credentials/org/project.env` could also be loaded by direnv or by chaining it into a project.env file.

### dotenv sharing

The dotenv directory can be shared across your devices in many ways. I personally prefer pushing it into a private git repository and have the files encrypted with git-crypt.
It basically doesn't matter how you share dotenv as long as its easily updated and (obviously) secured.
