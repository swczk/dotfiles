[[ -f ~/dotfiles/zsh/aliases.zsh ]] && source ~/dotfiles/zsh/aliases.zsh
[[ -f ~/dotfiles/zsh/functions.zsh ]] && source ~/dotfiles/zsh/functions.zsh
[[ -f ~/dotfiles/zsh/starship.zsh ]] && source ~/dotfiles/zsh/starship.zsh

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
