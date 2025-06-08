[[ -f ~/.config/zsh/aliases.zsh ]] && source ~/.config/zsh/aliases.zsh
[[ -f ~/.config/zsh/functions.zsh ]] && source ~/.config/zsh/functions.zsh
[[ -f ~/.config/zsh/distro.zsh ]] && source ~/.config/zsh/distro.zsh
[[ -f ~/.config/zsh/autocomplete.zsh ]] && source ~/.config/zsh/autocomplete.zsh
[[ -f ~/.config/zsh/autosuggestions.zsh ]] && source ~/.config/zsh/autosuggestions.zsh

# Load oh-my-posh
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/config.toml)"
eval "$(zoxide init zsh)"
#eval "$(zellij setup --generate-auto-start zsh)"
