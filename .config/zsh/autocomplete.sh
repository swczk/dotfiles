# AUTOCOMPLETION

# initialize autocompletion
autoload -U compinit
compinit

# history setup
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY
# source <(fzf --zsh)

# autocompletion using arrow keys (based on history)
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

# GENERAL

# (bonus: Disable sound errors in Zsh)

# never beep
setopt NO_BEEP
