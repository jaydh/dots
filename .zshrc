if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export EDITOR=nvim
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
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

alias ga='git add -p'
alias r=ranger
alias n=nnn
alias vim=nvim
alias vi=nvim
alias bs='git branch-select'
alias vmrun="/Applications/VMware Fusion Tech Preview.app/Contents/Library/vmrun"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
