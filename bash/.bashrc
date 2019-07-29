# t4ko's .bashrc

alias ls='ls -C --color=auto'
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

#alias groups='/etc/groups'
#alias sudoers='/etc/sudoers'

PS1='\n┌[\e[1;39m\u\e[m@\e[1;31m\h\e[m]-[\e[1;34m\w\e[m]\nλ '
#╼
set -o vi
bind 'set show-mode-in-prompt on'
bind 'set vi-ins-mode-string └[\1\e[0;32m\2i\1\e[m\2]'
bind 'set vi-cmd-mode-string └[\1\e[0;34m\2c\1\e[m\2]'
