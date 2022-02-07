# shellcheck shell=bash
if command -v nodenv &> /dev/null ; then
  df_log_warn "Using nodenv"
  eval "$(nodenv init -)"
fi

if [[ -d "$HOME/.nvm" ]]; then
  df_log_warn "Using nvm"
  export NVM_DIR="$HOME/.nvm"
  ln -s "${HOME}/dotfiles/default-npm-packages" "$NVM_DIR/default-packages"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi
