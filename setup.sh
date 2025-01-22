#!/bin/bash

# Flags to track which parts failed
UPDATE_FAILED=true
ESSENTIALS_FAILED=true
UTILITIES_FAILED=true

# Backup directory
BACKUP_DIR=~/config_backup
mkdir -p "$BACKUP_DIR"
mkdir -p ~/screenshots # When using i3 WM, this will store the screenshots you take.

# Detect Linux Distro
echo "============================================"
echo "🖥️   Which Linux distribution are you using?"
echo "============================================"
echo "1) Ubuntu/Debian"
echo "2) Arch/Manjaro"
echo "3) Fedora"
echo "4) OpenSUSE"
read -p "📌 Enter the number corresponding to your OS: " os_choice

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
  echo "❌ Invalid selection. Please run the script again and select a valid OS."
  exit 1
fi

# Update and upgrade system
echo "============================================"
echo "🔄 Updating and upgrading the system..."
echo "============================================"
if eval "$UPDATE_CMD"; then
  UPDATE_FAILED=false
else
  echo "⚠️  System update failed."
  read -p "❓ Do you want to continue with dotfiles setup anyway? (y/n): " choice
  if [[ "$choice" != "y" ]]; then
    echo "🚫 Setup aborted."
    exit 1
  fi
fi

# Install essential packages
echo "============================================"
echo "📦 Installing essential packages..."
echo "============================================"
if eval "$PKG_MANAGER git wget curl i3 i3blocks i3status feh dmenu vim tmux lxappearance nitrogen x11-utils xautolock polybar pavucontrol xdotool rofi picom flameshot unzip"; then
  ESSENTIALS_FAILED=false
else
  echo "⚠️  Some essential packages failed to install."
  read -p "❓ Do you want to continue with dotfiles setup anyway? (y/n): " choice
  if [[ "$choice" != "y" ]]; then
    echo "🚫 Setup aborted."
    exit 1
  fi
fi

# Install additional utilities
echo "============================================"
echo "🛠️  Installing additional utilities..."
echo "============================================"
if eval "$PKG_MANAGER zsh neovim python3-pip alacritty ripgrep fzf redshift"; then
  UTILITIES_FAILED=false
else
  echo "⚠️  Some additional utilities failed to install."
  read -p "❓ Do you want to continue with dotfiles setup anyway? (y/n): " choice
  if [[ "$choice" != "y" ]]; then
    echo "🚫 Setup aborted."
    exit 1
  fi
fi

# Backup .zshrc separately since it's in ~/
if [[ -f ~/.zshrc ]]; then
  echo "🗄️  Backing up ~/.zshrc to $BACKUP_DIR..."
  mv ~/.zshrc "$BACKUP_DIR/"
fi

# Backup existing configurations if they exist
echo "📂 Backing up existing config files to $BACKUP_DIR..."
for config in nvim alacritty ghostty i3 polybar tmux; do
  if [[ -d ~/.config/$config || -f ~/.config/$config ]]; then
    echo "📦 Backing up ~/.config/$config"
    mv ~/.config/$config "$BACKUP_DIR/"
  fi
done

# Symlink new configs
echo "🔗 Creating symlinks for dotfiles..."
ln -sf ~/dotfiles/nvim ~/.config/
ln -sf ~/dotfiles/alacritty ~/.config/
ln -sf ~/dotfiles/ghostty ~/.config/
ln -sf ~/dotfiles/i3 ~/.config/
ln -sf ~/dotfiles/polybar ~/.config/
ln -sf ~/dotfiles/tmux ~/.config/
ln -sf ~/dotfiles/zsh/.zshrc ~/

# Determine the final message based on success/failure
if [[ "$UPDATE_FAILED" == true && "$ESSENTIALS_FAILED" == true && "$UTILITIES_FAILED" == true ]]; then
  echo "============================================"
  echo "⚠️  Dotfiles setup completed with some issues."
  echo "🗂️  Your previous configs are backed up at: $BACKUP_DIR"
  echo "-----Raise issues if you face any problems https://github.com/harshze/dotfiles -----"
  echo "============================================"
else
  echo "============================================"
  echo "✅ Dotfiles setup completed successfully!"
  echo "🗂️  Your previous configs are backed up at: $BACKUP_DIR"
  echo "-----Raise issues if you face any problems https://github.com/harshze/dotfiles -----"
  echo "============================================"
fi
