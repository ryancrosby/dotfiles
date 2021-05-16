
#DOTFILES_LOG_LEVEL=5
source "$HOME/dotfiles/dotfiles_global.sh"

df_source "$HOME/dotfiles/set_path_env_var"
df_source "$HOME/.asdf/plugins/java/set-java-home.zsh"
df_source "$HOME/dotfiles/shell-helpers/shell-helpers"
#source "$HOME/dotfiles/zsh/colors.zsh" # colors
df_source "$HOME/dotfiles/zsh/setopts.zsh" # zsh configuration
df_source "$HOME/dotfiles/z/z.sh" # Z (jump around)

eval "$(starship init zsh)"
#source ~/.zsh/exports.zsh # Exports (Environment Variables) these get set in the .zprofile
#source "$HOME/dotfiles/zsh/colors.zsh" # Colors
df_source "$HOME/dotfiles/zsh/completion.zsh"
df_source "$HOME/dotfiles/zsh/bindkeys.zsh"
#source ~/.zsh/functions.zsh
df_source "$HOME/dotfiles/zsh/history.zsh"
#source ~/.zsh/zsh_hooks.zsh
#
# zsh-better-npm-completion plugin, loaded from submodule
df_source "$HOME/dotfiles/zsh-better-npm-completion/zsh-better-npm-completion.plugin.zsh"

# zsh 
df_source "$HOME/dotfiles/zaw/zaw.zsh"

# syntax highlighting
df_source "$HOME/dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
