#! /bin/zsh

# Parse the paramters passed into this script, this sets global
# variables that the rest of the script will use.
#
# https://coderwall.com/p/pav1uw/zsh-option-parsing-with-zparseopts
parse_options()
{
  zparseopts -D h=o_help
  if [[ $? != 0 || "$o_help" != "" ]]; then
    echo Usage: $(basename "$0")
    exit 1
  fi

  script=$@
}

# now use the function:
parse_options $*

#After getopts is done, shift all processed options away with
echo $script