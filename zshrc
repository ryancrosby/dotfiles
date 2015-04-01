#source "$HOME/dotfiles/zsh/colors.zsh" # colors
source "$HOME/dotfiles/zsh/setopts.zsh" # zsh configuration
#source ~/.zsh/exports.zsh # Exports (Environment Variables) these get set in the .zshenv
#source ~/.zsh/prompt.zsh # Prompt, we are using powerline for now
source "$HOME/dotfiles/zsh/completion.zsh"
source "$HOME/dotfiles/shell-helpers/aliases"
source "$HOME/dotfiles/zsh/bindkeys.zsh"
#source ~/.zsh/functions.zsh
source "$HOME/dotfiles/zsh/history.zsh"
#source ~/.zsh/zsh_hooks.zsh
source "$HOME/dotfiles/zaw/zaw.zsh"

# Autocomplete rbenv
[[ -s ~/.rbenv/completions/rbenv.zsh ]] && . ~/.rbenv/completions/rbenv.zsh

# Powerline for prompt
source "/usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh"

# syntax highlighting
source "$HOME/dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

