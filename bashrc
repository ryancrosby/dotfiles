source "$HOME/dotfiles/dotfiles_global"
#DOTFILES_LOG_LEVEL=3

df_source "$HOME/dotfiles/set_path_env_var"
df_source "$HOME/dotfiles/z/z.sh" # Z (jump around)
df_source "$HOME/.asdf/plugins/java/set-java-home.bash"

df_source "$HOME/dotfiles/shell-helpers/shell-helpers"

eval "$(starship init bash)"

# make ls command show color output
alias ls="ls -G"

# colorize everything
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
