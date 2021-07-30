# Path to your oh-my-bash installation.
export OSH=/home/giuseppe/.oh-my-bash

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-bash is loaded.
OSH_THEME="candy"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_OSH_DAYS=13

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Example format: completions=(ssh git bundler gem pip pip3)
# Add wisely, as too many completions slow down shell startup.
completions=(
  git
)

# Which aliases would you like to load? (aliases can be found in ~/.oh-my-bash/aliases/*)
# Custom aliases may be added to ~/.oh-my-bash/custom/aliases/
# Example format: aliases=(vagrant composer git-avh)
# Add wisely, as too many aliases slow down shell startup.
aliases=(
  general
	git
)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-bash/plugins/*)
# Custom plugins may be added to ~/.oh-my-bash/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  bashmarks
)

source $OSH/oh-my-bash.sh

# Android Path
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# GO path
export PATH=$PATH:/usr/local/go/bin

# GO Global Packages
export PATH=$PATH:$HOME/go/bin
 
# scripts
export PATH=$PATH:/home/giuseppe/.config/scripts/

# nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# ssh-agent
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
	ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi

if [[ ! "$SSH_AUTH_SOCK" ]]; then
	source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

# keychain
eval $(keychain --eval --quiet rpi github)

### nnn
export NNN_BMS="h:~;d:~/Downloads/;p:~/Pictures;c:~/.config"
export NNN_PLUG='f:finder;m:nmount'

# trash cli
export NNN_TRASH=1

# nnn in sudo mode
alias N='sudo -E nnn -dH'

# default nnn start mode
alias nnn='nnn -de'

# editor 
export EDITOR=vim
export TERMINAL=alacritty

# alias
alias l='ls -l'
alias ssh='TERM=xterm ssh'
alias code='vscodium'
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
