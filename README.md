# dotfiles

## automatic setup

`curl -Lks https://tinyurl.com/linuxspecialist-dotfiles`


## manual setup

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
