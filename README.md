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

dotfiles/ │── alacritty/ │ └── .config/alacritty/ │── i3/ │ └── .config/i3/ │── nvim/ │ └── .config/nvim/ │── tmux/ │ └── .config/tmux/ │── zsh/ │ └── .zshrc │── vim/ │ └── .vimrc │── polybar/ │ └── .config/polybar/ 

## 🛠️ Setup Instructions

<details>
  <summary><strong>🚀 Complete System Setup</strong> (Click to expand)</summary>

### **1️⃣ Clone the Repository**
```bash
git clone https://github.com/harshze/dotfiles.git ~/dotfiles
cd ~/dotfiles
  ```

2️⃣ Run the Setup Script
bash setup.sh

3️⃣ Follow the Prompts
The script will ask you to select your Linux distribution:

🐧 Ubuntu/Debian
🏴‍☠️ Arch/Manjaro
🔵 Fedora
🟢 OpenSUSE
Once selected, the script will:

Update and upgrade your system.
Install essential tools (i3, Polybar, Vim, Neovim, Rofi, etc.).
Use GNU Stow to manage your dotfiles and create symlinks.
Reload i3 to apply configurations.

🎯 Uninstalling
If you want to remove a specific configuration, use:
stow -D <folder_name>

For example, to remove the i3 configuration:
stow -D i3
</details>

<details> <summary><strong>🎯 Only Use a Specific Config</strong> (Click to expand)</summary>
