source "$HOME/dotfiles/set_path_env_var"
source "$HOME/dotfiles/z/z.sh" # Z (jump around)

source "$HOME/dotfiles/shell-helpers/shell-helpers"

# Source our nice prompt
source "$HOME/dotfiles/bash/prompt.sh"

# make ls command show color output
alias ls="ls -G"

# colorize everything
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# NVM is configured in shell-helpers/nvm
#rc_source "$NVM_DIR/bash_completion"
