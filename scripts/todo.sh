#!/bin/bash

TODO_FILE="$HOME/todo.txt"

case "$1" in
  add)
    echo "$2" >> "$TODO_FILE"
    echo "Added: $2"
    ;;
  list)
    echo "TODO List:"
    cat "$TODO_FILE"
    ;;
  remove)
    sed -i.bak "/$2/d" "$TODO_FILE"
    echo "Removed: $2"
    ;;
  *)
    echo "Usage: $0 {add|list|remove} [task]"
    ;;
esac

