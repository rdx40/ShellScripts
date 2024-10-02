#!/bin/bash

NOTE_FILE="$HOME/quick_notes.txt"
echo "[$(date)] $*" >> "$NOTE_FILE"
echo "Note added: $*"

