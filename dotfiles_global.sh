DOTFILES_LOG_START=$SECONDS
DOTFILES_LOG_LEVEL=1

# returns string representation of log level
function df_log_level {
  local level='log[$1]';
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
  local ELAPSED_TIME_SECONDS=$(($SECONDS - $DOTFILES_LOG_START))
  
  echo "[${ELAPSED_TIME_SECONDS}s $log_tag] $(df_log_level $log_level): $1"
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
  source "$1"
  local source_duration=$(($SECONDS - $start_source))
  if [ "$source_duration" -gt 0 ]; then
    df_log_warn "sourcing ${1} took ${source_duration} seconds."
  fi
}

function df_source_if_exists {
  if [ -s "$1" ]; then
    df_source "$1"
  else
    echo "Could not source file ${1}. File does not exist"
  fi  
}

function source_if_exists {
  df_source_if_exists $1
}