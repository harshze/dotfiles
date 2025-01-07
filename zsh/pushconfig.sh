#!/bin/bash

# Polybar
cp ~/.config/polybar/config.ini ~/github/dotfiles/polybar/config.ini
cp ~/.config/polybar/launch_polybar.sh ~/github/dotfiles/polybar/launch_polybar.sh

# Zsh
cp ~/.zshrc ~/github/dotfiles/zsh/.zshrc

# i3
cp ~/.config/i3/config ~/github/dotfiles/i3/i3-config

# Alacritty
cp ~/.config/alacritty/alacritty.toml ~/github/dotfiles/alacritty/alacritty.toml

# Tmux
cp ~/.config/tmux/tmux.conf ~/github/dotfiles/tmux/tmux.conf

# Neovim
rm -rf ~/github/dotfiles/nvim/*
cp -r ~/.config/nvim/* ~/github/dotfiles/nvim

# Copy script to dotfiles directory
cp ~/pushconfig.sh ~/github/dotfiles/zsh/pushconfig.sh
chmod +x ~/github/dotfiles/zsh/pushconfig.sh
