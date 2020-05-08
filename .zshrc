bindkey -v
bindkey '^R' history-search-multi-word

setopt MENU_COMPLETE
export KEYTIMEOUT=1

export CXX=clang

export PATH=$HOME/.cargo/bin/:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/google-cloud-sdk/bin:$PATH
export PATH="/usr/local/sbin:$PATH"
export PATH=$HOME/.roswell/bin:$PATH
export PATH=$HOME/Library/Python/3.7/bin:$PATH
export PATH=$HOME/zig/build/bin:$PATH
export RUSTC_WRAPPER=sccache cargo build

export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
export FZF_DEFAULT_COMMAND='rg --files --hidden'
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=dark
--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
'

d() {
  mkdir -p -- "$1" && cd -P -- "$1"
}

alias cat=bat
alias c=cargo
alias ls='exa -F'
alias lsa='exa -Fa'
alias lt='exa -T' 
alias vim=nvim
alias g=git
alias gs='git status'
alias ytdl=youtube-dl
alias lisp='rlwrap sbcl'
alias iina='/Applications/IINA.app/Contents/MacOS/iina-cli'

alias viconf='nvim $HOME/conf/init.vim'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/haze/src/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/haze/src/google-cloud-sdk/path.zsh.inc'; fi
unset zle_bracketed_paste

[ -s "/Users/haze/.jabba/jabba.sh" ] && source "/Users/haze/.jabba/jabba.sh"
# jabba use adopt-openj9@1.12.0-2

[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-bin-gem-node \
    hlissner/zsh-autopair \
    zsh-users/zsh-autosuggestions \
    MikeDacre/careful_rm \
    zdharma/history-search-multi-word \
    haze/bruh \
    zdharma/fast-syntax-highlighting \

### End of Zinit's installer chunk


# Nix
source $HOME/.nix-profile/etc/profile.d/nix.sh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/haze/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/haze/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/haze/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/haze/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

