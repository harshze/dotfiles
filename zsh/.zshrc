# Enable Powerlevel10k instant prompt. Must stay at the very top.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
#export ZSH="$HOME/.oh-my-zsh"
#ZSH_THEME="robbyrussell"
#source $ZSH/oh-my-zsh.sh
#---------------------------------------------AlIAS---------------------------------------------------------------------------------------------
#alias
alias ls='ls --color'
alias vim='nvim'
alias c='clear'
#alias@package-update
alias upgrade='sudo apt upgrade -y'
alias upg='sudo apt update && sudo apt upgrade -y'
alias up='sudo apt update && sudo apt upgrade -y'
alias update='sudo apt update'

alias p='python3'
alias lgit='lazygit'
#alias@cd
alias .='cd ..'
alias ..='cd ../..'
alias ...='cd ../../..'
alias ....='cd ../../../..'

#alias@tmux
alias t='tmux'
alias tks='tmux kill-server'
alias tat='tmux attach -d -t'
alias tsource='tmux source ~/.config/tmux/tmux.conf'

source ~/dotfiles/zsh/tflayouts-alias #go to this file to make tmuxifier layouts alias.
source ~/dotfiles/zsh/git-alias       #go to this file to make git/github alias.
source ~/dotfiles/zsh/sc

#alias#pavucontrol : for volume
alias sound='pavucontrol'
alias volume='pavucontrol'
alias gpt='tgpt'
#scripts
alias nvimreset='~/dotfiles/scripts/clean_nvim.sh'
alias cleansystem='~/dotfiles/scripts/cleansystem.sh'
alias mad1session='~/dotfiles/scripts/mad1.sh'
alias ytdlp='~/dotfiles/scripts/ytdlp.sh'
#---------------------------------------------CUSTOM-CD-FUNCTIONS--------------------------------------------------------------------------------
# Move unalias below the function definition
unalias cd 2>/dev/null  # Ignore errors if the alias does not exist
cd() {
    local target="$1"
    if [[ "$target" == "me" || "$target" == "mayaesc" ]]; then
        if [[ -d "$PWD/me" ]]; then
            builtin cd "$PWD/me"
        elif [[ -d "$HOME/Desktop/me" ]]; then
            builtin cd "$HOME/Desktop/me"
        else
            builtin cd "$HOME/Desktop/mayaescalation"
        fi
    elif [[ "$target" == */me || "$target" == */mayaesc ]]; then
        local base_dir="${target%/*}"
        local last_part="${target##*/}"
        if [[ "$last_part" == "me" ]]; then
            if [[ -d "$base_dir/me" ]]; then
                builtin cd "$base_dir/me"
            elif [[ -d "$HOME/$base_dir/me" ]]; then
                builtin cd "$HOME/$base_dir/me"
            else
                builtin cd "$HOME/$base_dir/mayaescalation"
            fi
        elif [[ "$last_part" == "mayaesc" ]]; then
            if [[ -d "$base_dir/mayaesc" ]]; then
                builtin cd "$base_dir/mayaesc"
            elif [[ -d "$HOME/$base_dir/mayaesc" ]]; then
                builtin cd "$HOME/$base_dir/mayaescalation"
            else
                builtin cd "$HOME/$base_dir/mayaescalation"
            fi
        fi
    elif [[ "$target" == "code" ]] && [[ ! -d "$PWD/code" ]]; then
        builtin cd ~/Desktop/code
    else
        builtin cd "$@"
    fi
}
#-----------------------------------------------MISCELLANEOUS-----------------------------------------------------------------------------------
#displays the PWD in the activity bar of terminal.
#update_title() {
 # if [[ "$PWD" == "$HOME" ]]; then
  #  print -Pn "\e]0;~\a"
  #else
   #local dir="${PWD/#$HOME/~}"
    #print -Pn "\e]0;${dir}\a"
  #fi
#}

#precmd() { update_title }
#for i3-battery-popup
export PATH="$HOME/scripts:$PATH"

#Export Zig bath, used for ghostty build
export PATH=$PATH:~/Documents/zig-linux-x86_64-0.14.0-dev.2568+42dac40b3
export PATH="$HOME/.local/bin:$PATH"

export PATH="$HOME/.tmuxifier/bin:$PATH"
eval "$(tmuxifier init -)"
#export TMUXIFIER_LAYOUT_PATH="$HOME/.tmux-layouts"
export EDITOR=nvim
#-----------------------------------------------------------------------------------------------------------------------------------------------
# Disable instant prompt (suppress the warning)
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Directory where Zinit and plugins are stored
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit if it's not already present
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname "$ZINIT_HOME")"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load Zinit
source "${ZINIT_HOME}/zinit.zsh"

#Load Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Add plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History settings
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'


# fzf integration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zoxide integration
eval "$(zoxide init zsh)"

# Load completions
autoload -Uz compinit && compinit

# Zinit replay
zinit cdreplay -q



