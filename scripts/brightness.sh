#!/bin/bash
# Usage: ./brightness.sh [0.1-1.0]

output="HDMI-A-0" # From xrandr output
brightness=$1

xrandr --output $output --gamma ${brightness}:${brightness}:${brightness}
