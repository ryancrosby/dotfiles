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
    echo Usage: $(basename "$0") "CMD to run"
    exit 1
  fi

  author=$o_author[2]

  if [[ $? -ne 0 || $#* -eq 0 ]] then
    cmd=$PWD
  else
    cmd=$@
  fi
}

raise_error()
{
  echo Error: $@
  exit 1
}

check_dir()
{
  if [[ -d "$1" ]] then
    echo $1
  else
    raise_error "Invalid Dir"
  fi
}

# now use the function:
parse_options $*

local dir=$(check_dir $cmd)

#After getopts is done, shift all processed options away with
for d in $dir/*(/); do
  echo $d
done


