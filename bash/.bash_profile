# .bash_profile

export PATH="$PATH:$HOME/Programs"
export PATH="$PATH:$HOME/Scripts"
export EDITOR="nvim"

# Get aliases and functions from .bashrc
[ -f $HOME/.bashrc ] && source $HOME/.bashrc

if [ -z "$DISPLAY" ]; then
	exec startx
fi
