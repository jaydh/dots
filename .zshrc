export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export GOPATH=$HOME/go
export PATH=${PATH}:`go env GOPATH`/bin
export VKD3D_CONFIG=dxr11,dxr
export PROTON_ENABLE_NVAPI=1
export PROTON_ENABLE_NGX_UPDATER=1
export PROTON_HIDE_NVIDIA_GPU=0
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

export EDITOR=nvim
autoload -Uz compinit
compinit
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completionkk

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="flazz"
plugins=(
    git
    vi-mode
)


source $ZSH/oh-my-zsh.sh

alias ga='git add -p'
alias vim=nvim
alias vi=nvim
alias bs='git branch-select'
alias contexts='kubectl config get-contexts'
alias k="kubectl"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if command -v conda >/dev/null 2>&1; then
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
fi
if [ "$TMUX" = "" ]; then tmux; fi
eval "$(starship init zsh)"


bindkey '\t' end-of-line
export ZSH_AUTOSUGGEST_STRATEGY=(
    history
    completion
)

# Arch-packaged zsh plugins (not in oh-my-zsh's custom/plugins, so sourced directly)
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
