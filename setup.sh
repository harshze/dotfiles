#!/bin/bash

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

echo "-----------------------------------------------------------------------"
echo "work in progress on the repository, stow manually. Will be fixed soon!"
echo "-----------------------------------------------------------------------"
# Create necessary directories first
#mkdir -p ~/.config/{i3,alacritty,nvim,tmux,polybar}

# Create symlinks
#ln -sf ~/dotfiles/i3/.config/i3/* ~/.config/i3/
#ln -sf ~/dotfiles/alacritty/.config/alacritty/* ~/.config/alacritty/
#ln -sf ~/dotfiles/nvim/.config/nvim/* ~/.config/nvim/
#ln -sf ~/dotfiles/tmux/.config/tmux/* ~/.config/tmux/
#ln -sf ~/dotfiles/polybar/.config/polybar/* ~/.config/polybar/
#ln -sf ~/dotfiles/vim/.vimrc ~/.vimrc
#ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc
