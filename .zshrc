export EDITOR=nvim
export JAVA_HOME=$(/usr/libexec/java_home -v 12)
export BYOBU_PREFIX=/usr/local

export PATH="/usr/local/mysql/bin:$PATH"
autoload -Uz compinit
compinit
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completionkk

export ZSH="/Users/jayhoward/.oh-my-zsh"
ZSH_THEME="flazz"
plugins=(git vi-mode)
source $ZSH/oh-my-zsh.sh

alias ga='git add -p'
alias n=nnn
alias vim=nvim
alias vi=nvim
alias src='cd ~/source'
alias int='cd ~/source/aws/config && yarn test'
alias bs='git branch-select'
