# Environment Variables
source "$HOME/dotfiles/shell-helpers/export"

# Aliases
source "$HOME/dotfiles/shell-helpers/aliases"

# NVM 
source "$HOME/dotfiles/shell-helpers/nvm"

source "$HOME/dotfiles/shell-helpers/rbenv"

# Source our nice prompt
[[ -s ~/dotfiles/bash/prompt.sh ]] && . ~/dotfiles/bash/prompt.sh

# make ls command show color output
alias ls="ls -G"

# colorize everything
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

