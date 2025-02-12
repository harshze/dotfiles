#!/bin/bash

# Ask for YouTube link
read -p "Enter YouTube link: " url

# Ask for start and end time
read -p "Enter start time (in seconds): " start
read -p "Enter end time (in seconds): " end

# Define output directory
output_dir="/home/harsh/Videos"
mkdir -p "$output_dir"

# Generate filename based on timestamp
filename="clip_$(date +%Y%m%d_%H%M%S).mp4"

# Download and trim the video
yt-dlp -f "bestvideo+bestaudio" --download-sections "*$start-$end" -o "$output_dir/$filename" "$url"

echo "Download complete: $output_dir/$filename"
