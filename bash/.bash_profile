# .bash_profile

export PATH="$PATH:$HOME/Programs"
export PATH="$PATH:$HOME/Scripts"
export TERM="alacritty"
export EDITOR="nvim"
export READER="mupdf"
export BROWSER="firefox"

# Get aliases and functions from .bashrc
[ -f $HOME/.bashrc ] && source $HOME/.bashrc

if [ -z "$DISPLAY" ]; then
	exec startx
fi
