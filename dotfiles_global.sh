# shellcheck shell=bash
DOTFILES_LOG_START=$SECONDS

if [ -z "${DOTFILES_LOG_LEVEL}" ]; then 
    DOTFILES_LOG_LEVEL=1
fi

#shellcheck source=df_colors.sh
source "${HOME}/dotfiles/df_colors.sh"

# returns string representation of log level
function df_log_level {
  local level="log[$1]";
  case $1 in
  0)
    level='error'
    ;;
  1)
    level='warn'
    ;;
  2)
    level='info'
    ;;
  3)
    level='debug'
    ;;
  esac

  echo $level
}

# args: message, level (integer, optional), tag (string, optional)
function df_log {
  local log_level=${2:-2}
  if [ "$log_level" -gt "$DOTFILES_LOG_LEVEL" ]; then
    return
  fi
  local log_tag=${3:-dotfiles}
  local ELAPSED_TIME_SECONDS=$((SECONDS - DOTFILES_LOG_START))
  local log_colors=(
    "${DF_FONT_ERROR}"
    "${DF_FONT_WARN}"
    "${DF_FONT_BLUE}"
    "${DF_FONT_GREEN}"
  )
  
  echo "${DF_FONT_BOLD}[$log_tag]${log_colors[log_level]} $(df_log_level "$log_level"):${DF_FONT_RESET} $1 ${DF_FONT_YELLOW}+${ELAPSED_TIME_SECONDS}s${DF_FONT_RESET}"
}

# args: message, tag (string, optional)
function df_log_error {
  df_log "$1" 0 "$2"
}

# args: message, tag (string, optional)
function df_log_warn {
  df_log "$1" 1 "$2"
}

# args: message, tag (string, optional)
function df_log_info {
  df_log "$1" 2 "$2"
}

# args: message, tag (string, optional)
function df_log_debug {
  df_log "$1" 3 "$2"
}

function df_source {
  local start_source=$SECONDS
  df_log_info "sourcing ${1}"
# shellcheck source=/dev/null
  source "$1"
  local source_duration=$((SECONDS - start_source))
  if [ "$source_duration" -gt 0 ]; then
    df_log_warn "sourcing ${1} took ${source_duration} seconds."
  fi
}

function df_source_if_exists {
  if [ -s "$1" ]; then
    df_source "$1"
  else
    df_log_warn "Could not source file ${1}. File does not exist"
  fi  
}

function df_append_path {
  if [[ ":$PATH:" == *":$1:"* ]]; then
    df_log_info "$1 already exits in path."
  else
    df_log_info "Appending $1 to path."
    export PATH=$PATH:$1
  fi
}

function df_prepend_path {
  if [[ ":$PATH:" == *":$1:"* ]]; then
    df_log_info "$1 already exits in path."
  else
    df_log_info "Prepending $1 to path."
    export PATH=$1:$PATH
  fi
}

unset DF_MYSHELL
unset DF_MYSHELL_PATH
if [ -n "$ZSH_VERSION" ] && type zstyle >/dev/null 2>&1; then        # zsh
  df_log_info "zsh shell detected"
  DF_MYSHELL='zsh'
  DF_MYSHELL_PATH=$(command -v zsh)
elif [ -x "$BASH" ] && shopt -q >/dev/null 2>&1; then                # bash
  df_log_info "bash shell detected"
  DF_MYSHELL='bash'
  DF_MYSHELL_PATH=$(command -v bash)
# elif [ -x "$shell" ] && which setenv |grep builtin >/dev/null; then  # tcsh
#   echo "DANGER: this script is likely not compatible with C shells!"
#   sleep 5
#   setenv DF_MYSHELL_PATH "$shell"
else
  df_log_error "DANGER: Shell could not be determined, unsupported shell."
  sleep 5
fi
export DF_MYSHELL
export DF_MYSHELL_PATH