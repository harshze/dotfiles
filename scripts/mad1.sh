#!/bin/bash

# Ask user for preference
read -p "Do you want to open in browser? (y/n): " choice

if [[ $choice =~ ^[Yy]$ ]]; then
  # Start browser opening in background after delay
  (sleep 2 && open "http://localhost:8000") &
fi

# Start tmuxifier layout
tmuxifier load-session mad1
