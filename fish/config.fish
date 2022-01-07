if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_mode_prompt; end
fish_vi_key_bindings

set -g fish_greeting
set -gx EDITOR nvim
set -gx GPG_TTY (tty)

set -gx FZF_DEFAULT_COMMAND 'fd'
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -gx EXA_COLORS 'di=33'

fish_add_path /opt/local/bin
fish_add_path /opt/local/sbin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.cargo/bin
fish_add_path /opt/homebrew/bin
fish_add_path $HOME/src/depot_tools

set -gx CPATH /opt/local/include/
set -gx LIBRARY_PATH /opt/local/lib/

alias cat="bat -p"
alias c="cargo"
alias ls="exa -F"
alias lsa="exa -Fa"
alias lt="exa -T"
alias vim="nvim"
alias g="git"
alias gs="git status"
alias ytdl="youtube-dl"

alias viconf='nvim $HOME/.config/nvim/'
alias vinix='nvim $HOME/.nixpkgs/darwin-configuration.nix'
alias vizsh='nvim $HOME/.zshrc'
alias vifish='nvim $HOME/.config/fish/config.fish'
alias intel='arch -x86_64'
alias lctl='launchctl'

scheme set zenburn

function gen_port_checksums -d "Generate rmd160 & sha256 checksums for the given file"
    set sha256 (openssl dgst -sha256 $argv[1] | cut -d' ' -f2)
    set rmd160 (openssl dgst -rmd160 $argv[1] | cut -d' ' -f2)
    set size (stat -f %z $argv[1])
    echo "checksums           sha256  $sha256 \\"
    echo "                    rmd160  $rmd160 \\"
    echo "                    size    $size"
end

function d -d "Create a directory and set CWD"
    command mkdir -p $argv
    if test $status = 0
        switch $argv[(count $argv)]
            case '-*'

            case '*'
                cd $argv[(count $argv)]
                return
        end
    end
end
