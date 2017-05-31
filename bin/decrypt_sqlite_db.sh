#!/bin/bash

# Force declaring variables
set -o nounset

# Exit script if we ever hit an error
set -o errexit

scriptname=$0
verbose=false
encrypted_db=""
decrypted_db=""
encryption_key=""

function usage () {
   cat <<EOF
Usage: $scriptname [-h] encryption_key
   -v   executes and prints out verbose messages
   -h   displays basic help
   -p   path to encrypted db
   -e   path to export decrypted db to
EOF
  exit 1
}

parse_options()
{
  while getopts ":hvp:e:" opt; do
    case $opt in
      v)  verbose=true ;;
      h)  usage ;;
      p)
        encrypted_db=$OPTARG
        if [[ ! -f "$encrypted_db" ]]; then
          raise_error "$encrypted_db is not a valid path"
        fi
        ;;
      e)
        decrypted_db=$OPTARG ;;
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

shift $(($OPTIND - 2))

encryption_key=$*

if [ -z "$encryption_key" ]; then
  raise_error "No Enryption Key Passed"
fi

if [ -z "$decrypted_db" ]; then
  decrypted_db="decrypted_db.sqlite"
fi

if [ -z "$encrypted_db" ]; then
  raise_error "Encrypted db not defined"
fi

sqlite3 $encrypted_db <<EOF
PRAGMA key=$encryption_key;
ATTACH DATABASE '$decrypted_db' AS plaintext KEY '';
SELECT sqlcipher_export('plaintext');
DETACH DATABASE plaintext;
EOF

