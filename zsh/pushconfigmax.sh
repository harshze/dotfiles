#!/bin/bash

# Polybar
rm -rf ~/github/dotfiles/polybar
mkdir -p ~/github/dotfiles/polybar
cp -r ~/.config/polybar/* ~/github/dotfiles/polybar

# Zsh
rm -rf ~/github/dotfiles/zsh
mkdir -p ~/github/dotfiles/zsh
cp ~/.zshrc ~/github/dotfiles/zsh

# i3
rm -rf ~/github/dotfiles/i3
mkdir -p ~/github/dotfiles/i3
cp -r ~/.config/i3/* ~/github/dotfiles/i3

# Alacritty
rm -rf ~/github/dotfiles/alacritty
mkdir -p ~/github/dotfiles/alacritty
cp -r ~/.config/alacritty/* ~/github/dotfiles/alacritty

# Tmux
rm -rf ~/github/dotfiles/tmux
mkdir -p ~/github/dotfiles/tmux
cp -r ~/.config/tmux/* ~/github/dotfiles/tmux

# Neovim
rm -rf ~/github/dotfiles/nvim
mkdir -p ~/github/dotfiles/nvim
cp -r ~/.config/nvim/* ~/github/dotfiles/nvim

# Copy script to dotfiles directory
cp ~/pushconfigmax.sh ~/github/dotfiles/zsh/pushconfigmax.sh
chmod +x ~/github/dotfiles/zsh/pushconfigmax.sh
cp ~/pushconfig.sh ~/github/dotfiles/zsh/pushconfig.sh
chmod +x ~/github/dotfiles/zsh/pushconfig.sh
