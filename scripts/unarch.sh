#!/bin/bash

# Function to unzip all zip files in a directory and its subdirectories
unzip_all() {
  local folder="$1"

  # Find all .zip files in the folder and its subfolders
  find "$folder" -type f -name '*.zip' | while read -r zipfile; do
    # Get the directory where the zip file is located
    zipdir=$(dirname "$zipfile")
    
    echo "Unzipping $zipfile into $zipdir"
    
    # Unzip the file in its directory
    unzip -o "$zipfile" -d "$zipdir"
    
    # Optionally delete the zip file after unzipping
    # rm "$zipfile"
  done
}

# Check if the folder is passed as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <folder>"
  exit 1
fi

# Call the function with the provided folder
unzip_all "$1"

