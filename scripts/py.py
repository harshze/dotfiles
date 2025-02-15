import os
import subprocess
import sys
import time
from datetime import datetime

# Function to display a spinner while processing
def spinner(process):
    spinstr = "|/-\\"
    idx = 0
    print("Processing...", end="", flush=True)
    while process.poll() is None:  # Check if the process is still running
        sys.stdout.write(f" [{spinstr[idx % len(spinstr)]}]  ")
        sys.stdout.flush()
        time.sleep(0.1)
        sys.stdout.write("\b\b\b\b\b\b")  # Erase spinner
        idx += 1
    print(" Done!")

# Main function
def main():
    # Prompt user for inputs
    yt_link = input("Enter your YT link: ")
    start_time = input("Enter Start Time (HH:MM:SS): ")
    end_time = input("Enter End Time (HH:MM:SS): ")

    # Temporary file to store raw output
    temp_file = "temp_output.mp4"

    # Output file with unique name based on timestamp
    output_file = f"Trimmed_{datetime.now().strftime('%Y%m%d%H%M%S')}.mp4"

    # yt-dlp command to download the specified section
    yt_dlp_command = [
        "yt-dlp",
        "--quiet", "--no-warnings",
        "--external-downloader", "ffmpeg",
        "--external-downloader-args", f"-ss {start_time} -to {end_time} -c:v libx264 -c:a aac",
        "-f", "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best",
        yt_link,
        "-o", temp_file,
    ]

    try:
        # Start the yt-dlp process
        process = subprocess.Popen(yt_dlp_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

        # Show spinner while process is running
        spinner(process)

        # Check if the process completed successfully
        if process.returncode == 0:
            # Rename the temporary file to the final output file
            os.rename(temp_file, output_file)
            print(f"Trimmed video saved as {output_file}")
        else:
            print("An error occurred during processing.")
            stderr_output = process.stderr.read().decode()
            print(stderr_output)

    except FileNotFoundError as e:
        print("Error: yt-dlp or ffmpeg not found. Ensure both are installed and in your PATH.")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")

# Run the script
if __name__ == "__main__":
    main()
