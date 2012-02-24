# Todo.txt
alias t="$HOME/.bash/todo/todo.sh"

# Source our local file, for stuff we don't want to share
if [ -f ~/.local_bashrc ]; then
  source ~/.local_bashrc
fi

# Source our nice prompt
source ~/.bash/prompt.sh

# make ls command show color output
alias ls="ls -G"
# colorize everything
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
