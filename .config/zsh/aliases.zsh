# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias rm='rm -i'
alias rmdir='rmdir -i'

# LSD alias to LS
alias ls='lsd -l'

# CP with verbose
alias cp='cp -v'

# Bat alias to Cat
alias cat='bat'

# Fd alias to Find
alias fd='find'

# Procs alias to Ps
alias procs='ps'

# RipGrep alias to Grep
alias grep='rg'

alias apt='pkg'

alias python='python3'
alias pip='pip3'

# Map Vim to Neovim
alias vi='nvim'
alias vim='nvim'

# Docker
alias dco='docker-compose'
alias de='docker exec'
alias dr='docker run'
alias dsh='docker exec -it `$(docker ps -q)` bash'
alias dshalpine='docker exec -it $(docker ps -q) /bin/sh'
alias dps='docker ps'
alias dpa='docker ps -a'
alias dl='docker ps -l -q'
alias di='docker images'
