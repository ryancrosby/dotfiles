#!/bin/bash

# Force declaring variables
set -o nounset

# Exit script if we ever hit an error
set -o errexit

scriptname=$0
verbose=false
author=""
cmd=""
hide_hidden=true
dir="."

function usage () {
   cat <<EOF
Usage: $scriptname [-d] [-v] [-h] command 
   -d   the directory to find directories in  
   -v   executes and prints out verbose messages
   -h   displays basic help
EOF
   exit 0
}

parse_options()
{
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
    echo "$1"
  fi
}

raise_error()
{
  echo Error: "$@"
  exit 1
}

parse_options "$*"

shift $((OPTIND - 1))

cmd=$*

if [ -z "$cmd" ]; then
  verbose_log "No command passed"
  usage
fi

echo "$author"

# Define the path we will pass to the find command to get directories to
# run the script on
find_path=$dir
if $hide_hidden ; then
  find_path="$find_path/[^.]*"
fi

# http://unix.stackexchange.com/questions/86722/how-do-i-loop-through-only-directories-in-bash
find "$find_path" -mindepth 0 -maxdepth 0 -type d | while read -r d; do
  verbose_log "Executing $cmd in $d"
  pushd "$d" >/dev/null
  $cmd || { echo "command failed"; exit 1; }
  popd >/dev/null
done

