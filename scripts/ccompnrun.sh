#!/bin/bash

# Check if the source file is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <source_file.c>"
    exit 1
fi

SOURCE_FILE=$1
EXECUTABLE=${SOURCE_FILE%.c}

# Compile the source file
gcc "$SOURCE_FILE" -o "$EXECUTABLE"

# Check if the compilation was successful
if [ $? -eq 0 ]; then
    echo "Compilation successful! Running the program..."
    ./"$EXECUTABLE"
else
    echo "Compilation failed."
fi

