#
# ~/.profile
#

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
# Pyenv shims
export PATH="$PYENV_ROOT/shims:$PATH"

[[ -f ~/.bashrc ]] && . ~/.bashrc

[[ $(fgconsole 2> /dev/null) == 1 ]] && exec startx --vt1
eval "$(pyenv init --path)"
