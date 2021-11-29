# shellcheck shell=bash
if command -v nodenv &> /dev/null ; then
  df_log_warn "Using nodenv"
  eval "$(nodenv init -)"
fi
