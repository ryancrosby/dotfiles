# shellcheck shell=bash
df_source "$(brew --prefix asdf)/asdf.sh"

if [[ $DF_MYSHELL == "zsh" ]]; then
    fpath=(${ASDF_DIR}/completions $fpath)
elif [[ $DF_MYSHELL == "bash" ]]; then
    df_source "${ASDF_DIR}/completions/asdf.bash"
else
    df_log_warn "ASDF may not be supported in $DF_MYSHELL"
    sleep 5
fi


