# shellcheck shell=bash

if command -v rbenv &> /dev/null ; then
  df_log_warn "Using rbenv"
  # eval "$(nodenv init -)"
  eval "$(rbenv init - zsh)"
  if [[ $DF_MYSHELL == "zsh" ]]; then
    eval "$(rbenv init - zsh)"
  elif [[ $DF_MYSHELL == "bash" ]]; then
    eval "$(rbenv init - bah)"  
  else
    df_log_warn "rbenv may not be supported in $DF_MYSHELL"
    sleep 5
  fi
fi

# ruby aliases
alias bx="bundle exec"
