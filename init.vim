
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
let g:python_host_prog = '/Library/Frameworks/Python.framework/Versions/3.7/bin/python3'

"Searching 
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search


let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'rust-lang/rust.vim'
Plug 'itchyny/lightline.vim'
Plug 'Raimondi/delimitMate'
Plug 'ziglang/zig.vim'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdtree'
Plug 'evanleck/vim-svelte'
Plug 'hazebooth/vimdiscord'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'itchyny/vim-cursorword'
Plug 'yuezk/vim-js'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'flrnd/plastic.vim'

" Plug 'parsonsmatt/intero-neovim'

call plug#end()

" Rust comments:
autocmd FileType rust setlocal commentstring=//\ %s
" Json comments
autocmd FileType json syntax match Comment +\/\/.\+$+

filetype plugin indent on
syntax enable
set background=dark
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
colorscheme plastic

let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:vim_jsx_pretty_colorful_config = 1
let g:polyglot_disabled = ['jsx']

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
inoremap <silent><expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
set autoread
command! W  write
" command! Wq  write
" command! WQ  write

let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:rustfmt_autosave = 1
" let g:rustfmt_command = "cargo fmt -- "

set updatetime=300
set cmdheight=2
set hidden
set signcolumn=yes
set shortmess+=c

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
map <C-e> :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'currentfunction', 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction',
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

nnoremap <S-j> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==
" inoremap <S-j> <Esc>:m .+1<CR>==gi
" inoremap <S-k> <Esc>:m .-2<CR>==gi
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv

" fzf key bindings
nnoremap <silent> <S-F> :Files<CR>
nnoremap <silent> <S-Tab> :Rg<CR>

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Send x's to blackhole reg

" nnoremap x "_x
" vnoremap x "_x

nnoremap c "_c
vnoremap c "_c

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
" let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
" let g:fzf_layout = { 'window': 'enew' }
" let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': 'below 15split enew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
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

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
