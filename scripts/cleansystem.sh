#!/bin/bash
echo "Clearing apt cache..."
sudo apt clean
echo "Removing unused packages..."
sudo apt autoremove -y
echo "Deleting temporary files..."
rm -rf /tmp/*
echo "Disk cleanup complete!"
