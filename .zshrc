export AM_SHOW_PROCESS_TIME=2
export AM_UPDATE_L_PROMPT=1
export AM_SHOW_PROCESS_TIME=2
export AM_UPDATE_L_PROMPT=1
export AM_PROMPT_START_TAG_COLOR=8
source $HOME/.zsh_plugins.sh

setopt MENU_COMPLETE

export CXX=clang
export PATH=$HOME/.cargo/bin/:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/google-cloud-sdk/bin:$PATH
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
export PATH=$HOME/.nimble/bin:$PATH
export PATH=$HOME/.elastic/bin:$PATH
export PATH=$HOME/.elastic/kibana/bin:$PATH
export PATH=$HOME/.cabal/bin:$PATH
export PATH=$HOME/.ghcup/bin:$PATH
export PATH=$HOME/Library/Python/3.7/bin:$PATH
export PATH=/Library/TeX/texbin/:$PATH
export FZF_DEFAULT_COMMAND='rg --files --hidden'
source $HOME/.ghcup/env

alias cat=bat
alias c=cargo
alias ls=exa -F
alias vim=nvim

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/haze/src/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/haze/src/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/haze/src/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/haze/src/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="/usr/local/sbin:$PATH"
