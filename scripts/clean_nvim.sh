#!/bin/bash
# Prompt for confirmation
echo "Are you sure you want to remove all Neovim configurations and state files? (y/n)"
read -r confirmation

if [[ $confirmation != "y" ]]; then
  echo "Operation cancelled."
  exit 0
fi

# Remove Kickstart Neovim configuration folder
rm -rf ~/.config/nvim/*

# Remove Neovim plugin and state files
echo "Removing Neovim plugin and state files..."
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim

# Remove Neovim swap and backup files
echo "Removing Neovim swap and backup files..."
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim

# Remove Neovim cache files
echo "Removing Neovim cache files..."
rm -rf ~/.local/cache/nvim

# Remove global plugin manager directories
echo "Removing Neovim site directories..."
rm -rf ~/.local/share/nvim/site

# Remove Neovim cache
echo "Removing Neovim cache directory..."
rm -rf ~/.cache/nvim

echo "All Neovim configurations and state files removed."

echo "----finding nvim related stuff on the system----"
find ~ -type d -name '*nvim*'
