# shellcheck shell=bash

# Starship Colors https://github.com/ogham/rust-ansi-term/blob/master/src/ansi.rs
DF_FONT_RED=$(tput setaf 196)
DF_FONT_YELLOW=$(tput setaf 226)
DF_FONT_MAGENTA=$(tput setaf 9)
DF_FONT_ORANGE=$(tput setaf 172)
DF_FONT_GREEN=$(tput setaf 190)
DF_FONT_PURPLE=$(tput setaf 141)
DF_FONT_WHITE=$(tput setaf 256)
DF_FONT_BOLD=$(tput bold)
DF_FONT_RESET=$(tput sgr0)
DF_FONT_ERROR=$DF_FONT_RED
DF_FONT_WARN=$(tput setaf 202)

export DF_FONT_RED
export DF_FONT_YELLOW
export DF_FONT_MAGENTA
export DF_FONT_ORANGE
export DF_FONT_GREEN
export DF_FONT_PURPLE
export DF_FONT_WHITE
export DF_FONT_BOLD
export DF_FONT_RESET
export DF_FONT_ERROR
export DF_FONT_WARN