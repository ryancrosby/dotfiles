# vim:ft=zsh ts=2 sw=2 sts=2
#
# This was taken mostly from the agnoster oh-my-zsh theme. But also takes the VIM 
# mode prompt from another tutorial. Sites used listed below.
#
# Agnoster: most taken from here
# https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/agnoster.zsh-theme
#
# This article inspired most of my dotfile configuration, and moving away from 
# oh-my-zsh.
# http://zanshin.net/2013/02/02/zsh-configuration-from-the-ground-up/
#
# Vi mode detection
# http://dougblack.io/words/zsh-vi-mode.html
#
# Here is another link, although I ended up not using much from here.
# http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/#git-repository-information
#
# good explanation of out of the box zsh prompt configuration
# http://aperiodic.net/phil/prompt/

# Special Powerline characters
() {
  local LC_ALL="" LC_CTYPE="en_US.UTF-8"
  # NOTE: This segment separator character is correct.  In 2012, Powerline changed
  # the code points they use for their special characters. This is the new code point.
  # If this is not working for you, you probably have an old version of the
  # Powerline-patched fonts installed. Download and install the new version.
  # Do not submit PRs to change this unless you have reviewed the Powerline code point
  # history and have new information.
  # This is defined using a Unicode escape sequence so it is unambiguously readable, regardless of
  # what font the user is viewing this source code in. Do not replace the
  # escape sequence with a single literal character.
  # Do not change this! Do not make it '\u2b80'; that is the old, wrong code point.
  DEFAULT_SEGMENT_SEPARATOR=$'\ue0b0'
  DEFAULT_SOFT_SEGMENT_SEPARATOR=$'\ue0b1'
  DEFAULT_GIT_BRANCH_INDICATOR=$'\ue0a0'
}

# http://dougblack.io/words/zsh-vi-mode.html
function zle-line-init zle-keymap-select {
    VIM_MODE="${${KEYMAP/vicmd/ON}/(main|viins)/}"
    set_prompt
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

prompt_start() {
  CURRENT_BG='NONE'
}

# Begin a segment
# Takes two arguments, background and foreground. Both can be omitted,
# rendering default background/foreground.
prompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    echo -n " %{$bg%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{$fg%} "
  else
    echo -n "%{$bg%}%{$fg%} "
  fi
  CURRENT_BG=$1
  [[ -n $3 ]] && echo -n "$3"
}

prompt_set_segment_separator() {
  local separator
  [[ -n $1 ]] && separator="$1" || separator=$DEFAULT_SEGMENT_SEPARATOR
  SEGMENT_SEPARATOR=$separator
}

prompt_newline() {
  prompt_end
  CURRENT_BG='NONE'
  echo ""
}

# End the prompt, closing any open segments
prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n " %{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi
  echo -n "%{%f%}"
  CURRENT_BG=''
}

# http://zanshin.net/2013/02/02/zsh-configuration-from-the-ground-up/
# determine Ruby version whether using RVM or rbenv
# the chpwd_functions line cause this to update only when the directory changes
function _update_ruby_version() {
    typeset -g ruby_version=''
    if which rvm-prompt &> /dev/null; then
      ruby_version="$(rvm-prompt i v g)"
    else
      if which rbenv &> /dev/null; then
        ruby_version="$(rbenv version | sed -e "s/ (set.*$//")"
      fi
    fi
}
chpwd_functions+=(_update_ruby_version)
# Execute the function once, to set initial value
_update_ruby_version

# Context: user@hostname (who am I and where am I)
prompt_mode() {
  if [[ "$VIM_MODE" == "ON" ]]; then
    prompt_segment green black "NORMAL"
  else
    prompt_segment green black "INSERT"
  fi
}

prompt_ruby() {
  prompt_segment default white "[ Ruby $ruby_version ]"
}

# Show Git branch/tag, or name-rev if on detached head
function parse_git_branch() {
  (git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null
}

prompt_git_branch() {
  local git_where="$(parse_git_branch)"
  if [[ -n "$git_where" ]]; then
    prompt_set_segment_separator
    prompt_segment 239 246 "$DEFAULT_GIT_BRANCH_INDICATOR ${git_where#(refs/heads/|tags/)}"
  fi
}

# Git: branch/detached head, dirty status
prompt_git_status() {

  local PL_BRANCH_CHAR
  () {
    local LC_ALL="" LC_CTYPE="en_US.UTF-8"
    PL_BRANCH_CHAR=$'\ue0a0'         # 
  }
  local ref dirty mode repo_path
  repo_path=$(git rev-parse --git-dir 2>/dev/null)

  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    prompt_set_segment_separator
    ref=$(git symbolic-ref HEAD 2> /dev/null) || ref="➦ $(git rev-parse --short HEAD 2> /dev/null)"
    prompt_segment green black

    if [[ -e "${repo_path}/BISECT_LOG" ]]; then
      mode=" <B>"
    elif [[ -e "${repo_path}/MERGE_HEAD" ]]; then
      mode=" >M<"
    elif [[ -e "${repo_path}/rebase" || -e "${repo_path}/rebase-apply" || -e "${repo_path}/rebase-merge" || -e "${repo_path}/../.dotest" ]]; then
      mode=" >R>"
    fi

    setopt promptsubst
    autoload -Uz vcs_info

    zstyle ':vcs_info:*' enable git
    zstyle ':vcs_info:*' get-revision true
    zstyle ':vcs_info:*' check-for-changes true
    zstyle ':vcs_info:*' stagedstr '✚'
    zstyle ':vcs_info:*' unstagedstr '●'
    zstyle ':vcs_info:*' formats ' %u%c'
    zstyle ':vcs_info:*' actionformats ' %u%c'

    #zstyle ':vcs_info:git:*' formats '%b [%u|%n|%c|%a]'
    vcs_info
    echo -n " ${ref/refs\/heads\//$PL_BRANCH_CHAR }${vcs_info_msg_0_%% }${mode}"
    #echo -n "${vcs_info_msg_0_%% }"
  fi
}

prompt_user() {
  prompt_segment blue white "%n"
}

function current_pwd {
  echo $(pwd | sed -e "s,^$HOME,~,")
}


# Dir: current working directory
prompt_dir() {
  prompt_segment 239 246 "%~"
}

prompt_char() {
  #prompt_segment default 246 ">"
  echo ""
  echo -n '>'
}

## Main prompt
build_prompt() {
  RETVAL=$?
  prompt_start
  prompt_set_segment_separator
  #prompt_status
  #prompt_virtualenv
  #prompt_context
  prompt_mode
  prompt_user
  prompt_dir
  prompt_git_status
  #prompt_newline
  prompt_end
  #prompt_set_segment_separator " "
  #prompt_ruby
  #prompt_git_branch
  #prompt_user
  #prompt_set_segment_separator " "
  #prompt_char
  #prompt_hg
  prompt_char
}

build_right_prompt() {
  prompt_start
  prompt_set_segment_separator " "
  prompt_ruby
  prompt_end
}


set_prompt() {

  PS1="%{%f%b%k%}$(build_prompt) "
  ARGHSDF="%{%f%b%k%}$(build_prompt) "

  export SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r$reset_color [(y)es (n)o (a)bort (e)dit]? "

  RPS1="%{%f%b%k%}$(build_right_prompt) "
  #RPS1="${PR_RED}${ruby_version}%{$reset_color%}"
}

set_prompt
