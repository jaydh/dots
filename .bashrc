#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias k='kubectl'

PS1='[\u@\h \W]\$ '
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

export PATH="$HOME/.local/bin:$PATH"
