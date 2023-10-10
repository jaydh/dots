export VKD3D_CONFIG=dxr11,dxr
export PROTON_ENABLE_NVAPI=1
export PROTON_ENABLE_NGX_UPDATER=1
export PROTON_HIDE_NVIDIA_GPU=0

export EDITOR=nvim
autoload -Uz compinit
compinit
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completionkk

export ZSH="/home/jay/.oh-my-zsh"
ZSH_THEME="flazz"
plugins=(git vi-mode)

source $ZSH/oh-my-zsh.sh

alias ga='git add -p'
alias vim=nvim
alias vi=nvim
alias bs='git branch-select'
alias contexts='kubectl config get-contexts'
alias k="kubectl"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/etc/profile.d/conda.sh" ]; then
        . "/usr/etc/profile.d/conda.sh"
    else
        export PATH="/usr/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
#
if [ "$TMUX" = "" ]; then tmux; fi
eval "$(starship init zsh)"
