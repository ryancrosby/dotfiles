# Todo.txt
alias t="$HOME/.bash/todo/todo.sh -d $HOME/.bash/todo/todo.cfg"
source "$HOME/.bash/todo/todo_completion"
complete -F _todo t

# Custom Command Line Programs
export PATH="${HOME}/.bin:${PATH}"

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Source our local file, for stuff we don't want to share
#if [ -f ~/.local_bashrc ]; then
#  source ~/.local_bashrc
#fi
# Easier way to right the above snippet
[[ -s ~/.local_bashrc ]] && . ~/.local_bashrc

# Source our nice prompt
source ~/.bash/prompt.sh

# make ls command show color output
alias ls="ls -G"
# colorize everything
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
