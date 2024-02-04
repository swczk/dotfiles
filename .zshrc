[[ -f ~/.config/zsh/aliases.zsh ]] && source ~/.config/zsh/aliases.zsh
[[ -f ~/.config/zsh/functions.zsh ]] && source ~/.config/zsh/functions.zsh
[[ -f ~/.config/zsh/starship.zsh ]] && source ~/.config/zsh/starship.zsh

#setopt HIST_EXPIRE_DUPS_FIRST
#setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
#setopt HIST_IGNORE_SPACE
#setopt HIST_FIND_NO_DUPS
#setopt HIST_SAVE_NO_DUPS

# Load Starship
eval "$(starship init zsh)"

# Add local 'pip' to PATH:
# (In your .bashrc, .zshrc etc)
export PATH="${PATH}:${HOME}/.local/bin/"
