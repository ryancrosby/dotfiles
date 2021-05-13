declare -A DF_FONT_STYLES

# Starship Colors https://github.com/ogham/rust-ansi-term/blob/master/src/ansi.rs
DF_FONT_STYLES[RED]=$(tput setaf 196)
DF_FONT_STYLES[YELLOW]=$(tput setaf 226)
DF_FONT_STYLES[MAGENTA]=$(tput setaf 9)
DF_FONT_STYLES[ORANGE]=$(tput setaf 172)
DF_FONT_STYLES[GREEN]=$(tput setaf 190)
DF_FONT_STYLES[PURPLE]=$(tput setaf 141)
DF_FONT_STYLES[WHITE]=$(tput setaf 256)
DF_FONT_STYLES[BOLD]=$(tput bold)
DF_FONT_STYLES[RESET]=$(tput sgr0)

DF_FONT_STYLES[ERROR]=${DF_FONT_STYLES[RED]}
DF_FONT_STYLES[WARN]=$(tput setaf 202)

export DF_FONT_STYLES