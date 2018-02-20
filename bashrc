source "$HOME/dotfiles/set_path_env_var"

source "$HOME/dotfiles/shell-helpers/shell-helpers"

# Source our nice prompt
[[ -s ~/dotfiles/bash/prompt.sh ]] && . ~/dotfiles/bash/prompt.sh

# make ls command show color output
alias ls="ls -G"

# colorize everything
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

