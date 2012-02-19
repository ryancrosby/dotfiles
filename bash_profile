# Source .bashrc if it exists,
# I use that file to have a bunch of code that is confusing to look at.
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

if [ -f ~/.local_bashrc ]; then
  source ~/.local_bashrc
fi


# make ls command show color output
alias ls="ls -G"
# colorize everything
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
