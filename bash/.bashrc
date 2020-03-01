# t4ko's .bashrc

# allow to omit 'cd' to change directories
shopt -s autocd

alias ls='ls -C -G --color=auto'
alias l='ls'
alias ll='ls -hl'
alias la='ll -A'
alias suspend='zzz'
alias hibernate='ZZZ'
alias clr='clear'
alias fetch='neofetch'
#alias scrot="scrot -q 100 -e 'mv $f ~/Pictures/Screenshots'"

# xbps aliases
alias install='sudo xbps-install -Sv'
alias ins='sudo xbps-install -Sv'
alias update='sudo xbps-install -Suv'
alias upd='sudo xbps-install -Suv'
alias clean='sudo xbps-remove -oORv'
alias cln='sudo xbps-remove -oORv'
alias remove='sudo xbps-remove -Rv'
alias rmp='sudo xbps-remove -Rv'
alias packages='xbps-query -l'
alias pkgs='xbps-query -l'
alias search='xbps-query -Rs'
alias srch='xbps-query -Rs'

# git aliases
alias pull='git pull' 
alias push='git push' 
alias fetch='git fetch' 
alias rebase='git rebase' 

alias wlan='nmcli dev wifi list'
alias wlan-rescan='nmcli dev wifi rescan'
alias irc='weechat'
alias vi='nvim'

#alias groups='/etc/groups'
#alias sudoers='/etc/sudoers'

git_info() {
	curr_branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null);
	curr_remote=$(git config branch.$curr_branch.remote);
	curr_merge_branch=$(git config branch.$curr_branch.merge | cut -d / -f 3)
	ahead_behind=$(git rev-list --left-right --count $curr_remote/$curr_merge_branch...$curr_branch 2> /dev/null| sed -e 's/\([0-9]\)/↓\1/1' -e 's/\([0-9]\)/↑\1/2')
	( echo -n $curr_branch || echo -n " "; echo -n $ahead_behind; ) | sed 's/\([a-zA-Z]*\)\(.*\)/─( \1 \2)/'
}

PS1='\n┌[\e[1;39m\u\e[m@\e[1;31m\h\e[m]─[\e[1;34m\w\e[m]$(git_info)\nλ '
#╼
set -o vi
bind 'set show-mode-in-prompt on'
bind 'set vi-ins-mode-string └[\1\e[0;32m\2i\1\e[m\2]'
bind 'set vi-cmd-mode-string └[\1\e[0;34m\2c\1\e[m\2]'
