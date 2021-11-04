# .bash_profile

export PATH="$PATH:$HOME/Programs"
export PATH="$PATH:$HOME/Scripts"
export XDG_RUNTIME_DIR="/tmp/`id -u`-runtime-dir"
test -d "$XDG_RUNTIME_DIR" || { mkdir "$XDG_RUNTIME_DIR" ; chmod 700 "$XDG_RUNTIME_DIR" ; }
export TERM="alacritty"
export EDITOR="nvim"
export READER="mupdf"
export BROWSER="firefox"

# Get aliases and functions from .bashrc
[ -f $HOME/.bashrc ] && source $HOME/.bashrc
. "$HOME/.cargo/env"
