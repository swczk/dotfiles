[[ -f ~/.config/zsh/aliases.zsh ]] && source ~/.config/zsh/aliases.zsh
[[ -f ~/.config/zsh/functions.zsh ]] && source ~/.config/zsh/functions.zsh
[[ -f ~/.config/zsh/distro.sh ]] && source ~/.config/zsh/distro.sh

#setopt HIST_EXPIRE_DUPS_FIRST
#setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
#setopt HIST_IGNORE_SPACE
#setopt HIST_FIND_NO_DUPS
#setopt HIST_SAVE_NO_DUPS

# Load oh-my-posh
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/config.toml)"

export PATH="${PATH}:${HOME}/.local/bin/"
