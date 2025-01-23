# 🚀 Harsh's Dotfiles

This repository contains my personal dotfiles and an automated setup script to configure a new Linux system effortlessly. With just **one command**, you can install essential tools, set up configurations, and get your workflow running smoothly.

## 📋 Table of Contents
- [Features](#-features)
- [Dotfile Structure](#-dotfile-structure)
- [Setup Instructions](#️-setup-instructions)
- [Tool References](#-tool-references)

## ✨ Features

- 🏗️ **Automated installation** for Ubuntu, Arch, Fedora, and OpenSUSE.
- 🔗 **Uses GNU Stow** for easy dotfile management.
- 🎨 **Configures i3, Polybar, Neovim, and more**.
- 🛠️ **Installs essential packages** (git, vim, curl, zsh, tmux, etc.).
- 🔥 **Minimal effort, maximum setup!**

## 📂 Dotfile Structure

Each program's configuration is stored in a separate folder:

```bash
dotfiles/
│── alacritty/
│── i3/
│── nvim/
│── tmux/
│── zsh/
│   └── .zshrc
│── polybar/
 ```
## 🛠️ Setup Instructions
 ### **1️⃣ Clone the Repository**
```bash
git clone https://github.com/harshze/dotfiles.git ~/dotfiles
cd ~/dotfiles
  ```

### 2️⃣ Run the Setup Script
```bash
bash setup.sh
 ```
---

### 3️⃣ Follow the Prompts
The script will ask you to select your Linux distribution:

- 🐧 Ubuntu/Debian
- 🏴‍☠️ Arch/Manjaro
- 🔵 Fedora
- 🟢 OpenSUSE

Once selected, the script will:

- Update and upgrade your system.
- Install essential tools (i3, Polybar, Vim, Neovim, Rofi, etc.).
- Create symlinks to manage your dotfiles.
- Reload i3 to apply configurations.

🎯 Uninstalling
If you want to remove a specific configuration, use:
```bash
stow -D <folder_name>
 ```
For example, to remove the i3 configuration:
```bash
stow -D i3 
 ```
---
## 🔗 Tool References
| Tool | Description | Config Location | Key Features | Official Repo |
|------|-------------|-----------------|--------------|---------------|
| i3 | Tiling window manager that's highly customizable and efficient | `~/.config/i3/` | Tiling layout, keyboard-centric control, multi-monitor support | [i3wm on GitHub](https://github.com/i3/i3) |
| LazyVim | Neovim configuration that provides a rich set of features out of the box | `~/.config/nvim` | Lazy-loading plugins, built-in LSP support, sleek UI | [LazyVim on GitHub](https://github.com/LazyVim/LazyVim) |
| tmux | Terminal multiplexer that allows you to manage multiple terminal sessions within a single window | `~/.tmux.conf` or `~/.config/tmux/` | Session management, pane splitting, customizable status bar | [tmux on GitHub](https://github.com/tmux/tmux) |
| Polybar | Highly customizable status bar for your desktop environment | `~/.config/polybar/` | Modular design, extensive customization options, multi-monitor support | [Polybar on GitHub](https://github.com/polybar/polybar) |
| Alacritty | Fast, cross-platform terminal emulator focused on performance and simplicity | `~/.config/alacritty/` | GPU-accelerated rendering, minimal resource usage, extensive configuration options | [Alacritty on GitHub](https://github.com/alacritty/alacritty) |
| Zsh (Oh My Zsh) | Powerful shell with many features, and Oh My Zsh provides additional customization options | `~/.zshrc` | Advanced command-line completion, plugins, themes | [Oh My Zsh on GitHub](https://github.com/ohmyzsh/ohmyzsh) |
| Ghostty | Modern, GPU-accelerated terminal emulator with a focus on performance and customizability | `~/.config/ghostty/` | GPU acceleration, native UI, Lua configuration, built-in multiplexer, rich color support | [Ghostty on GitHub](https://github.com/ghostty-org/ghostty) |
