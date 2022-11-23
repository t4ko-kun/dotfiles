#!/usr/local/bin/zsh
# .zshrc
# This file is sourced after .zprofile and before .zlogin and .zlogout
# Interactive zsh sessions are configured here

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch
unsetopt beep notify
bindkey -v
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/mab/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Aliases
alias o='xdg-open'
alias vi='nvim'
alias vim='nvim'

alias ls='ls --color=auto'

# Use lsd as ls if it's in PATH
if type "lsd" > /dev/null; then
  alias ls='lsd -1L'
  alias lst='ls --tree'
fi

alias l='ls'
alias ll='ls -l'
alias la='ls -a'
alias lla='la -l'

alias rmd='rm -r'

alias gss='git status -bs'
alias lg='lazygit'

# Screenshot in wayland
alias wscrot='grim -g "$(slurp)" - | swappy -f -'

# Prompt
autoload -Uz vcs_info
autoload -U add-zsh-hook
setopt prompt_subst

NEWLINE=$'\n'
USERNAME='%n'
HOSTNAME='%m'
DIRECTORY='%~'

# Command hook which is executed before a prompt is printed
precmd() {
}

# Load version control information if available
if [[ -f $HOME/.zvcs ]] then
	source $HOME/.zvcs
fi

# Foreground color %F{<color>}<text>%f
# Bold text %B<text>%b
PROMPT='┌[%F{red}%B${USERNAME}%b%f@%B${HOSTNAME}%b]─[%F{blue}%B${DIRECTORY}%b%f]${vcs_info_msg_0_}${NEWLINE}└[i]λ '
RPROMPT='[%F{magenta}%T%f]'

# Advanced autompletion
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#AAAAAA"
ZSH_AUTOSUGGEST_STRATEGY=(completion history)
bindkey '^ ' autosuggest-accept
#
# Use Starship prompt
eval "$(starship init zsh)"

