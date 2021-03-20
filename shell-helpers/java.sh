# use a function so we don't pollute environment variables
function setup_java {
  local home=$(/usr/libexec/java_home) 2> /dev/null
  local asdf_java="$HOME/.asdf/plugins/java"
  df_log_debug "checking $home/bin"
  if [[ -d "$HOME/.asdf/plugins/java" ]]; then
    df_log_debug "Configuring asdf Java"
    if [[ $DF_MYSHELL == "zsh" ]]; then
      df_source $HOME/.asdf/plugins/java/set-java-home.zsh
    elif [[ $DF_MYSHELL == "bash" ]]; then
      df_source $HOME/.asdf/plugins/java/set-java-home.bash
    else
      df_log_warn "Java is not supported in shell $DF_MYSHELL"
    fi
  elif [[ -n "$home" ]] && [[ -d "$home/bin" ]]; then
    df_log_debug "Configuring Java Home to $JAVA_HOME"
    export JAVA_HOME="$home"
    export PATH=$JAVA_HOME:$PATH
    export PATH=$JAVA_HOME/bin:$PATH
  else
    df_log_warn "Java SDK not found, install by using asdf java (preferred) or os x system java" 
  fi
}
setup_java
