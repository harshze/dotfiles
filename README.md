# 🚀 Harsh's Dotfiles

This repository contains my personal dotfiles and an automated setup script to configure a new Linux system effortlessly. With just **one command**, you can install essential tools, set up configurations, and get your workflow running smoothly.

---

## 📜 Features

- 🏗️ **Automated installation** for Ubuntu, Arch, Fedora, and OpenSUSE.
- 🔗 **Uses GNU Stow** for easy dotfile management.
- 🎨 **Configures i3, Polybar, Neovim, and more**.
- 🛠️ **Installs essential packages** (git, vim, curl, zsh, tmux, etc.).
- 🔥 **Minimal effort, maximum setup!**

---

## 📂 Dotfile Structure
Each program's configuration is stored in a separate folder:'
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
## Specific Configurations

### i3 Window Manager
i3 is a tiling window manager that's highly customizable and efficient.
- **Config location**: `~/.config/i3/`
- **Key features**: Tiling layout, keyboard-centric control, multi-monitor support
- **Official repo**: [i3wm on GitHub](https://github.com/i3/i3)

### LazyVim (Neovim Configuration)
LazyVim is a Neovim configuration that provides a rich set of features out of the box.
- **Config location**: `~/.config/nvim`
- **Key features**: Lazy-loading plugins, built-in LSP support, sleek UI
- **Official repo**: [LazyVim on GitHub](https://github.com/LazyVim/LazyVim)

### tmux
tmux is a terminal multiplexer that allows you to manage multiple terminal sessions within a single window.
- **Config location**: `~/.tmux.conf` or `~/.config/tmux/`
- **Key features**: Session management, pane splitting, customizable status bar
- **Official repo**: [tmux on GitHub](https://github.com/tmux/tmux)

### Polybar
Polybar is a highly customizable status bar for your desktop environment.
- **Config location**: `~/.config/polybar/`
- **Key features**: Modular design, extensive customization options, multi-monitor support
- **Official repo**: [Polybar on GitHub](https://github.com/polybar/polybar)

### Alacritty
Alacritty is a fast, cross-platform terminal emulator focused on performance and simplicity.
- **Config location**: `~/.config/alacritty/`
- **Key features**: GPU-accelerated rendering, minimal resource usage, extensive configuration options
- **Official repo**: [Alacritty on GitHub](https://github.com/alacritty/alacritty)

### Zsh (with Oh My Zsh)
Zsh is a powerful shell with many features, and Oh My Zsh provides additional customization options.
- **Config location**: `~/.zshrc`
- **Key features**: Advanced command-line completion, plugins, themes
- **Official repo**: [Oh My Zsh on GitHub](https://github.com/ohmyzsh/ohmyzsh)

### Ghostty
Ghostty is a modern, GPU-accelerated terminal emulator with a focus on performance and customizability.
- **Config location**: `~/.config/ghostty/`
- **Key features**: GPU acceleration, native UI, Lua configuration, built-in multiplexer, rich color support
- **Official repo**: [Ghostty on GitHub](https://github.com/ghostty-org/ghostty)


