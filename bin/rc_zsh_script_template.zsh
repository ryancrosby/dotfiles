#! /bin/zsh

# Parse the paramters passed into this script, this sets global
# variables that the rest of the script will use.
#
# https://coderwall.com/p/pav1uw/zsh-option-parsing-with-zparseopts
parse_options()
{
  o_author=(-a rcrosby@crowdcompass.com)

  zparseopts -D a:=author h=o_help
  if [[ $? != 0 || "$o_help" != "" ]]; then
    echo Usage: $(basename "$0") "[-a AUTHOR]"
    exit 1
  fi

  author=$o_author[2]

  cmd=$@
}

# now use the function:
parse_options $*

#After getopts is done, shift all processed options away with
echo $author
echo $cmd


