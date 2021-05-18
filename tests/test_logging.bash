#! /bin/bash

# shellcheck source=./dotfiles_global.sh
source "$HOME/dotfiles/dotfiles_global.sh"
DOTFILES_LOG_LEVEL=5 

df_log_error "Error Log"
df_log_warn "Warn Log"
df_log_info "Info Log"
df_log_debug "Debug Log"

df_log_error "Error Log" "tag"
df_log_warn "Warn Log" "tag"
df_log_info "Info Log" "tag"
df_log_debug "Debug Log" "tag"
