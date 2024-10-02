#!/bin/bash

##how to use --> ./dir_size.sh /path/to/directory

DIR="$1"

if [[ -d "$DIR" ]]; then
  du -sh "$DIR"/* | sort -hr
else
  echo "Please provide a valid directory."
fi

