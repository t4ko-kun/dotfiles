# .bash_profile

PATH="$PATH:$HOME/Programs"
PATH="$PATH:$HOME/Scripts"
export PATH

export EDITOR=emacsclient

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc

if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
	exec startx
fi
