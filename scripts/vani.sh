#!/bin/bash

# Prompt user for inputs
read -p "Enter your YT link: " url
read -p "Enter Start Time (HH:MM:SS): " start_time
read -p "Enter End Time (HH:MM:SS): " end_time

# Temporary file to store raw output
temp_file="temp_output.mp4"

# Function to display a spinner while processing
spinner() {
  local pid=$1
  local delay=0.1
  local spinstr='|/-\'
  echo -n "Processing..."
  while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
    local temp=${spinstr#?}
    printf " [%c]  " "$spinstr"
    spinstr=$temp${spinstr%"$temp"}
    sleep $delay
    printf "\b\b\b\b\b\b"
  done
  echo " Done!"
}

# Start the yt-dlp and FFmpeg process in the background
yt-dlp --quiet --no-warnings \
  --external-downloader ffmpeg \
  --external-downloader-args "-ss $start_time -to $end_time -c:v libx264 -c:a aac" \
  -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best" \
  "$url" \
  -o "$temp_file" &

# Get the PID of the background process and show the spinner
spinner $!

# Rename the output file to something meaningful
output_file="Trimmed_$(date +%Y%m%d%H%M%S).mp4"
mv "$temp_file" "$output_file"

echo "Trimmed video saved as $output_file"
