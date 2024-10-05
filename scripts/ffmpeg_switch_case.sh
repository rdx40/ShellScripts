#!/bin/bash

show_menu() {
    echo "Choose an option:"
    echo "1) Convert Video to MP4"
    echo "2) Extract Audio from Video"
    echo "3) Resize Video"
    echo "4) Compress Video"
    echo "5) Create GIF from Video"
    echo "6) Exit"
}

while true; do
    show_menu
    read -p "Enter your choice (1-6): " choice

    case $choice in
        1)
            read -p "Enter the input video file path: " input_file
            read -p "Enter the output video file path: " output_file
            ffmpeg -i "$input_file" -c:v libx264 -crf 23 -c:a aac "$output_file"
            echo "Video converted to MP4!"
            ;;
        2)
            read -p "Enter the input video file path: " input_file
            read -p "Enter the output audio file path (e.g., output.mp3): " output_file
            ffmpeg -i "$input_file" -q:a 0 -map a "$output_file"
            echo "Audio extracted from video!"
            ;;
        3)
            read -p "Enter the input video file path: " input_file
            read -p "Enter the output video file path: " output_file
            read -p "Enter the desired resolution (e.g., 1280:720): " resolution
            ffmpeg -i "$input_file" -vf "scale=$resolution" "$output_file"
            echo "Video resized!"
            ;;
        4)
            read -p "Enter the input video file path: " input_file
            read -p "Enter the output video file path: " output_file
            read -p "Enter the desired bitrate (e.g., 1000k): " bitrate
            ffmpeg -i "$input_file" -b:v "$bitrate" "$output_file"
            echo "Video compressed!"
            ;;
        5)
            read -p "Enter the input video file path: " input_file
            read -p "Enter the output GIF file path: " output_file
            read -p "Enter the frame rate (e.g., 10): " fps
            read -p "Enter the width of the GIF (e.g., 320): " width
            ffmpeg -i "$input_file" -vf "fps=$fps,scale=$width:-1:flags=lanczos" -c:v gif "$output_file"
            echo "GIF created!"
            ;;
        6)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please select a number between 1 and 6."
            ;;
    esac
done

