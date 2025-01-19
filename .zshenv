export PATH=$PATH:$HOME/.local/bin

export HISTSIZE=100000
export SAVEHIST=100000
setopt appendhistory

export HISTCONTROL=ignoreboth:erasedups
export HISTFILE=~/.zsh_history

export EDITOR=nvim
export KUBE_EDITOR=nvim

export ANDROID_HOME="$HOME/Android/Sdk"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

export PATH="$PATH:$HOME/dev/flutter/bin"

export PATH=$PATH:$(go env GOPATH)/bin

export CHROME_EXECUTABLE="/usr/bin/brave-browser"

export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-17.0.13.0.11-3.fc41.x86_64
#export JAVA_HOME=/usr/lib/jvm/java-21-openjdk-21.0.5.0.11-1.fc41.x86_64
#export JAVA_HOME=/usr/lib/jvm/java-23-openjdk-23.0.1.0.11-1.rolling.fc41.x86_64
export PATH=$JAVA_HOME/bin:$PATH

# Add local 'pip' to PATH:
# (In your .zshrc etc)
export PATH="${PATH}:${HOME}/.local/bin/"
