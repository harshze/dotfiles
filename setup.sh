#!/bin/bash

# Backup directory
BACKUP_DIR=~/config_backup
mkdir -p "$BACKUP_DIR"
mkdir -p ~/screenshots #when using I3 WM, this will store the screenshots you take.

# Detect Linux Distro
echo "Which Linux distribution are you using?"
echo "1) Ubuntu/Debian"
echo "2) Arch/Manjaro"
echo "3) Fedora"
echo "4) OpenSUSE"
read -p "Enter the number corresponding to your OS: " os_choice

# Package Manager Selection
if [[ "$os_choice" == "1" ]]; then
  PKG_MANAGER="sudo apt install -y"
  UPDATE_CMD="sudo apt update && sudo apt upgrade -y"
elif [[ "$os_choice" == "2" ]]; then
  PKG_MANAGER="sudo pacman -S --noconfirm"
  UPDATE_CMD="sudo pacman -Syu --noconfirm"
elif [[ "$os_choice" == "3" ]]; then
  PKG_MANAGER="sudo dnf install -y"
  UPDATE_CMD="sudo dnf update -y"
elif [[ "$os_choice" == "4" ]]; then
  PKG_MANAGER="sudo zypper install -y"
  UPDATE_CMD="sudo zypper refresh && sudo zypper update -y"
else
  echo "Unsupported OS. Exiting..."
  exit 1
fi

# Update and upgrade system
echo "Updating and upgrading the system..."
eval "$UPDATE_CMD"

# Install essential packages
echo "Installing essential packages..."
eval "$PKG_MANAGER git wget curl i3 i3blocks i3status feh dmenu vim tmux lxappearance nitrogen x11-utils xautolock polybar pavucontrol xdotool rofi picom flameshot unzip"

# Additional utilities
echo "Installing additional utilities..."
eval "$PKG_MANAGER zsh neovim python3-pip alacritty ripgrep fzf"

# Backup .zshrc separately since it's in ~/
if [[ -f ~/.zshrc ]]; then
  mv ~/.zshrc "$BACKUP_DIR/"
fi

# Backup existing configurations if they exist
echo "Backing up existing config files to $BACKUP_DIR..."
for config in nvim alacritty ghostty i3 polybar tmux; do
  if [[ -d ~/.config/$config || -f ~/.config/$config ]]; then
    mv ~/.config/$config "$BACKUP_DIR/"
  fi
done

# Symlink new configs
echo "Creating symlinks for dotfiles..."
ln -sf ~/dotfiles/nvim ~/.config/
ln -sf ~/dotfiles/alacritty ~/.config/
ln -sf ~/dotfiles/ghostty ~/.config/
ln -sf ~/dotfiles/i3 ~/.config/
ln -sf ~/dotfiles/polybar ~/.config/
ln -sf ~/dotfiles/tmux ~/.config/
ln -sf ~/dotfiles/zsh/.zshrc ~/
echo "-----------------------------------------------------------------------"
echo "Dotfiles setup completed. Your previous configs are backed up at: $BACKUP_DIR"
echo "-----------------------------------------------------------------------"
