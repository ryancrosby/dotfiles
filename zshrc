# Load shared resource config gile
source ~/dotfiles/sharedrc

#Path to your oh-my-zsh configuration.
ZSH=$HOME/dotfiles/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
# ZSH_THEME="kardan"
ZSH_THEME="juanghurtado"

COMPLETION_WAITING_DOTS="true"

# Tmux plugin
ZSH_TMUX_ITERM2="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew vi-mode tmux)

source $ZSH/oh-my-zsh.sh

# Customizations 
#

# Search within history for commands matching current input
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward


