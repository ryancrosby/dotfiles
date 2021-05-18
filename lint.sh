#! /bin/bash
# shellcheck shell=bash

#DOTFILES_LOG_LEVEL=5
#shellcheck source=dotfiles_global.sh
source "${HOME}/dotfiles/dotfiles_global.sh"

didError=0

function lint_file () {
    # -q for quiet, to disable output. we only care about the exit status
  if head -n1 "$1" | grep -q -e '/bin/bash' -e '/bin/sh'; then
    df_log_info "Linting $1 via shellcheck"
    # -S warn, sets the level. lossening it up as i fix things
    if ! shellcheck -x "$1"; then
      didError=1
    fi
  else 
    df_log_info "Ignoring $1 for linting"
  fi
}

function lint_glob () {
  for file in $1
  do
    if [ -f "$file" ]; then
      lint_file "$file"
    fi
  done
}

lint_glob "**/*"
lint_glob "*"

exit $didError;