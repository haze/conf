source $HOME/.zsh_plugins.sh

bindkey -v
bindkey '^R' history-search-multi-word

setopt MENU_COMPLETE
export KEYTIMEOUT=1

export CXX=clang

export PATH=$HOME/.cargo/bin/:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/anaconda3/bin:$PATH
export PATH=$HOME/google-cloud-sdk/bin:$PATH
export PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH=$HOME/.roswell/bin:$PATH

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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/haze/src/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/haze/src/google-cloud-sdk/path.zsh.inc'; fi
unset zle_bracketed_paste

# opam configuration
test -r /Users/haze/.opam/opam-init/init.zsh && . /Users/haze/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

[ -s "/Users/haze/.jabba/jabba.sh" ] && source "/Users/haze/.jabba/jabba.sh"
# jabba use adopt-openj9@1.12.0-2
