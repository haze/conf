if &compatible
  set nocompatible               " Be iMproved
endif

set mouse=a
set nu
set tabstop=4 expandtab shiftwidth=2 smarttab autoindent
set noshowmode
set wildmenu
set termguicolors
set clipboard=unnamed
set laststatus=0

" Searching 
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

call plug#begin('~/.vim/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'justinmk/vim-syntax-extra'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'bluz71/vim-moonfly-colors'
Plug 'sainnhe/sonokai'
Plug 'sainnhe/edge'
Plug 'nvim-lua/completion-nvim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'tmsvg/pear-tree'
Plug 'ziglang/zig.vim'
Plug 'LnL7/vim-nix'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/vim-cursorword'
Plug 'yuezk/vim-js'
Plug 'miyakogi/conoline.vim'
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-abolish'
Plug 'arzg/vim-rust-syntax-ext'
Plug 'PeterRincker/vim-searchlight'
Plug 'APZelos/blamer.nvim'
Plug 'haze/sitruuna.vim'
Plug 'farmergreg/vim-lastplace'
Plug 'darfink/vim-plist'
call plug#end()

colorscheme sitruuna
filetype plugin indent on
syntax enable
set background=dark

" Rust comments:
autocmd FileType rust setlocal commentstring=//\ %s

" CoC stuff
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction

" xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
" nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

" inoremap <silent><expr> <Tab>
"     \ pumvisible() ? "\<C-n>" :
"     \ <SID>check_back_space() ? "\<Tab>" :
"     \ coc#refresh()
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" inoremap <silent><expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
" autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
" inoremap <silent><expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
inoremap <expr> <Tab> pumvisible() ? "\<CR>" : "\<Tab>"
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
set autoread

let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:rustfmt_autosave = 1

set updatetime=50
set nobackup
set nowritebackup
set cmdheight=2
set hidden
set signcolumn=yes
set shortmess+=c
set completeopt=menuone,noinsert
autocmd CompleteDone * pclose

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
map <C-e> :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
function! CocCurrentFunction()
  return get(b:, 'coc_current_function', '')
endfunction

nnoremap <S-j> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==
" inoremap <S-j> <Esc>:m .+1<CR>==gi
" inoremap <S-k> <Esc>:m .-2<CR>==gi
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv

" fzf key bindings
nnoremap <silent> <S-F> :Files<CR>
nnoremap <silent> <S-Tab> :Rg<CR>

" Show/Hide 
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use Q to show documentation in preview window
nnoremap <silent> Q :call <SID>show_documentation()<CR>

nmap <silent> rn <Plug>(coc-rename)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Send x's from z to blackhole reg
nnoremap z "_x
vnoremap z "_x

nnoremap c "_c
vnoremap c "_c

let g:fzf_layout = { 'window': 'below 15split enew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors = {
      \ 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Command for git grep
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
command! -bang -nargs=* GGrep
      \ call fzf#vim#grep(
      \   'git grep --line-number '.shellescape(<q-args>), 0,
      \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

" Override Colors command. You can safely do this in your .vimrc as fzf.vim
" will not override existing commands.
command! -bang Colors
      \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)

" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], preview window, [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
      \ call fzf#vim#ag(<q-args>,
      \                 <bang>0 ? fzf#vim#with_preview('up:60%')
      \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
      \                 <bang>0)

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--color', 'fg:-1,bg:-1,hl:230,fg+:3,bg+:233,hl+:229', '--color', 'info:150,prompt:110,spinner:150,pointer:167,marker:174', '--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--color', 'fg:-1,bg:-1,hl:230,fg+:3,bg+:233,hl+:229','--color', 'info:150,prompt:110,spinner:150,pointer:167,marker:174']}), <bang>0)

" Print group under cursor
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

let g:pear_tree_repeatable_expand = 0
let g:conoline_auto_enable = 1

let g:blamer_delay = 1500

let mapleader = ','

" LSP Stuff
lua <<EOF
local lspconfig = require'lspconfig'
local configs = require'lspconfig/configs'
local completion = require'completion'

local map = function(type, key, value)
	vim.fn.nvim_buf_set_keymap(0,type,key,value,{noremap = true, silent = true});
end

local custom_attach = function(client)
    print("LSP started");

    completion.on_attach(client)

    map('n','gD','<cmd>lua vim.lsp.buf.declaration()<CR>')
    map('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>')
    map('n','gr','<cmd>lua vim.lsp.buf.references()<CR>')
    map('n','gs','<cmd>lua vim.lsp.buf.signature_help()<CR>')
    map('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
    map('n','gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
    map('n','<leader>gw','<cmd>lua vim.lsp.buf.document_symbol()<CR>')
    map('n','<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
    map('n','<leader>ah','<cmd>lua vim.lsp.buf.hover()<CR>')
    map('n','<leader>af','<cmd>lua vim.lsp.buf.code_action()<CR>')
    map('n','<leader>ee','<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')
    map('n','rn','<cmd>lua vim.lsp.buf.rename()<CR>')
    map('n','<leader>ai','<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
    map('n','<leader>ao','<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
    map('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')


    if client.resolved_capabilities.document_highlight then
      vim.api.nvim_command('augroup lsp_aucmds')
      vim.api.nvim_command('au CursorHold <buffer> lua vim.lsp.buf.document_highlight()')
      vim.api.nvim_command('au CursorMoved <buffer> lua vim.lsp.buf.clear_references()')
      vim.api.nvim_command('augroup END')
    end
end

lspconfig.zls.setup{on_attach=custom_attach}
lspconfig.rust_analyzer.setup{on_attach=custom_attach}
lspconfig.clangd.setup{
  on_attach=custom_attach,
  cmd = {'clangd'},
}
lspconfig.jsonls.setup{on_attach=custom_attach}
lspconfig.html.setup{on_attach=custom_attach}
lspconfig.cssls.setup{on_attach=custom_attach}
lspconfig.rnix.setup{on_attach=custom_attach}

require'nvim-treesitter.configs'.setup {
  indent = {
    enable = true
  },
  highlight = {
    enable = true
  }
}

EOF

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
autocmd BufEnter * lua require'completion'.on_attach()
autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.json lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.c lua vim.lsp.buf.formatting_sync(nil, 1000)

set background=dark
" colorscheme sitruuna-blue
colorscheme moonfly

let g:cursorword_delay = 100
