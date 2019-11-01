#!/bin/bash

# Force declaring variables
set -o nounset

# Exit script if we ever hit an error
set -o errexit

scriptname=$0
verbose=false
author=""
cmd=""
dir="."

function usage () {
   cat <<EOF
Usage: $scriptname [-p] [-v] [-h] filename
   -p   probes the ftp sites and check urls in
        filename
   -v   executes and prints out verbose messages
   -h   displays basic help
EOF
   exit 0
}

# Get script output and status
# https://mywiki.wooledge.org/BashFAQ/002

# iterate over command output
# https://stackoverflow.com/questions/2859908/iterating-over-each-line-of-ls-l-output


parse_options()
{
  # http://wiki.bash-hackers.org/howto/getopts_tutorial
  while getopts ":hva:d:" opt; do
    case $opt in
      a)  author=$OPTARG ;;
      d)  
        dir=$OPTARG 
        if [[ ! -d "$dir" ]]; then
          echo "$dir is an invalid directory"
          usage
        fi
        ;;
      v)  verbose=true ;;
      h)  usage ;;
      \?) echo "Invalid option: -$OPTARG" >&2 ;;
    esac
  done
}

function verbose_log {
  if $verbose ; then
    echo $1
  fi
}

raise_error()
{
  echo Error: $@
  exit 1
}

parse_options $*

shift $(($OPTIND - 1))

cmd=$*

if [ -z "$cmd" ]; then
  verbose_log "No command passed"
  usage
fi

# http://unix.stackexchange.com/questions/86722/how-do-i-loop-through-only-directories-in-bash
find $dir -mindepth 1 -maxdepth 1 -type d | while read d; do
  verbose_log "Executing $cmd in $d"
  $cmd || { echo "command failed"; exit 1; }
done

