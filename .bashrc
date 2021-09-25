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
export PATH=$PATH:/home/giuseppe/scripts/

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
eval $(keychain --eval --quiet rpi github gitlab_work)

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
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
