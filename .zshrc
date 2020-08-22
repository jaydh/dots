
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
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

alias ga='git add -p'
alias r=ranger
alias n=nnn
alias vim=nvim
alias vi=nvim
alias src='cd ~/source'
alias int='cd ~/source/aws/config && yarn test'
alias storybook='cd ~/source/lib/www && yarn storybook'
alias storyshot='cd ~/source/lib/www && yarn jest'
alias rebuild='cd ~/source && gradle docker_rebuild'
alias bs='git branch-select'
alias staging-int='kitty +kitten ssh -i ~/.aws/staging-instance-keypair.pem ubuntu@10.12.2.136'
alias uat-int='kitty +kitten ssh -i ~/.aws/uat-instance-keypair.pem ubuntu@10.11.2.53'
alias staging-api='kitty +kitten ssh -i ~/.aws/staging-instance-secure-keypair.pem ubuntu@10.12.3.110'
alias uat-api='kitty +kitten ssh -i ~/.aws/uat-instance-secure-keypair.pem ubuntu@10.11.3.78'
alias staging-screenshot="scp -i ~/.aws/staging-instance-keypair.pem  ubuntu@10.12.2.144:'/tmp/*.{jpg,png}' /tmp"
