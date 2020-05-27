source "$HOME/dotfiles/dotfiles_global"
#DOTFILES_LOG_LEVEL=3

df_source "$HOME/dotfiles/set_path_env_var"
df_source "$HOME/dotfiles/z/z.sh" # Z (jump around)

df_source "$HOME/dotfiles/shell-helpers/shell-helpers"

# Source our nice prompt
df_source "$HOME/dotfiles/bash/prompt.sh"

# make ls command show color output
alias ls="ls -G"

# colorize everything
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# NVM is configured in shell-helpers/nvm
#rc_source "$NVM_DIR/bash_completion"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
