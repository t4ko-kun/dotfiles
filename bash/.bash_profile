# .bash_profile

PATH="$PATH:$HOME/Programs"
PATH="$PATH:$HOME/Scripts"
export PATH

export EDITOR="nvim"

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc

if [ -z "$DISPLAY" ]; then
	exec startx
fi
