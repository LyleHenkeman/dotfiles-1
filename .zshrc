export ZSH="/$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="false"
HIST_STAMPS="dd/mm/yyyy"

plugins=(
git
dotenv
)

# load direnv
eval "$(direnv hook zsh)"
export DIRENV_LOG_FORMAT=

source $ZSH/oh-my-zsh.sh
source ~/.dotrc

# kubectl completion
if [ $commands[kubectl] ]; then source <(kubectl completion zsh); fi

true
