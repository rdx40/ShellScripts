#!/bin/bash

read -p "Enter the input video file path: " input_file
read -p "Enter the output audio file path (e.g., output.mp3): " output_file
ffmpeg -i "$input_file" -q:a 0 -map a "$output_file"
echo "Audio extraction complete!"

