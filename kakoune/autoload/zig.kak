hook global WinSetOption filetype=zig %{
    set-option window formatcmd 'zig fmt --stdin'

    # Enable lsp support with semantic highlighting
    lsp-enable-window
    hook window -group semantic-tokens BufReload .* lsp-semantic-tokens
    hook window -group semantic-tokens NormalIdle .* lsp-semantic-tokens
    hook window -group semantic-tokens InsertIdle .* lsp-semantic-tokens
    hook -once -always window WinSetOption filetype=.* %{
        remove-hooks window semantic-tokens
    }
}
