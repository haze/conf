bindkey -v
bindkey '^R' history-search-multi-word

setopt MENU_COMPLETE
export KEYTIMEOUT=1

export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/google-cloud-sdk/bin:$PATH
export PATH="/usr/local/sbin:$PATH"
export PATH=$HOME/.roswell/bin:$PATH
export PATH=$HOME/Library/Python/3.7/bin:$PATH
export PATH=$HOME/zig/build:$PATH
export PATH=$HOME/Library/Python/3.8/bin:$PATH
export EDITOR=nvim

export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
export PATH=$HOME/Library/Python/3.9/bin:$PATH
export FZF_DEFAULT_COMMAND='rg --files --hidden'
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'

--color=dark
--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
'
export LS_COLORS="$(vivid generate molokai)"
export NIX_PATH=darwin-config=$HOME/.nixpkgs/darwin-configuration.nix:$HOME/.nix-defexpr/channels:$NIX_PATH

d() {
  mkdir -p -- "$1" && cd -P -- "$1"
}

alias cat='bat -p'
alias c=cargo
alias ls='exa -F'
alias lsa='exa -Fa'
alias lt='exa -T' 
alias vim=nvim
alias g=git
alias gs='git status'
alias ytdl=youtube-dl

alias viconf='nvim $HOME/.config/nvim/init.vim'
alias vinix='nvim $HOME/.nixpkgs/darwin-configuration.nix'
alias vizsh='nvim $HOME/.zshrc'
alias intel='arch -x86_64'
alias lctl='launchctl'

unset zle_bracketed_paste

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz compinit

for dump in ~/.zcompdump(N.mh+24); do
  compinit
done

compinit -C

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

function kube() {
  if [ $commands[kubectl] ]; then
      source <(kubectl completion zsh)
  fi
}


autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit load haze/bruh 
zinit wait lucid light-mode for \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-bin-gem-node \
    hlissner/zsh-autopair \
    Aloxaf/fzf-tab \
    zsh-users/zsh-autosuggestions \
    mattmc3/zsh-safe-rm \
    zdharma/history-search-multi-word \
    zdharma/fast-syntax-highlighting \

### End of Zinit's installer chunk

export GPG_TTY=$(tty)
export BRUH_ALIAS_COLOR='yellow'

eval "$(direnv hook zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"

[ -s "/Users/haze/.jabba/jabba.sh" ] && source "/Users/haze/.jabba/jabba.sh"
