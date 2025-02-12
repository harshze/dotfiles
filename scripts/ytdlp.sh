#!/bin/bash

# Ask for YouTube link
read -p "Enter YouTube link: " yt_link

# Ask for start and end times in HH:MM:SS format
read -p "Enter start time (HH:MM:SS): " start_time
read -p "Enter end time (HH:MM:SS): " end_time

# Output file path
output_dir="/home/harsh/Videos"
filename="clip_$(date +%Y%m%d%H%M%S).mp4"
temp_file="temp_video.mp4"

# Download the best video and audio
yt-dlp -f "bestvideo+bestaudio" -o "$temp_file" "$yt_link"

# Trim the video using ffmpeg
ffmpeg -i "$temp_file" -ss "$start_time" -to "$end_time" -c copy "$output_dir/$filename"

# Remove temporary file
rm "$temp_file"

echo "Video saved as $output_dir/$filename"
