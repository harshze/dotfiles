#!/bin/bash
# Open browser in background after a delay
(sleep 2 && open "http://localhost:8000") &

# Start tmuxifier layout
tmuxifier load-session mad1
