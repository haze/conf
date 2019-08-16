set mouse=a
set nu
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif
set tabstop=4 expandtab shiftwidth=2 smarttab autoindent
" Required:
let g:python_host_prog = '/usr/bin/python3'
set runtimepath+=/Users/haze/.cache/dein/repos/github.com/Shougo/dein.vim
set noshowmode
set wildmenu
set termguicolors
set clipboard=unnamed
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'chase/focuspoint-vim'
Plug 'Shougo/defx.nvim'
Plug 'rust-lang/rust.vim'
Plug 'itchyny/lightline.vim'
Plug 'Raimondi/delimitMate'
Plug 'skywind3000/vim-preview'
Plug 'ziglang/zig.vim'
Plug 'chriskempson/base16-vim'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'dim13/smyck.vim'
Plug 'sainnhe/edge'
Plug 'kjssad/quantum.vim'
Plug 'hazebooth/vim-hazepunk'
Plug 'sainnhe/gruvbox-material'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'skywind3000/asyncrun.vim'
Plug 'kamykn/dark-theme.vim'
Plug 'ntk148v/vim-horizon'
Plug 'maksimr/Lucius2'
Plug 'scottymoon/vim-twilight'
" Plug 'parsonsmatt/intero-neovim'

call plug#end()

" Add rust comments:
autocmd FileType rust setlocal commentstring=//\ %s

" Required:
autocmd FileType json syntax match Comment +\/\/.\+$+
filetype plugin indent on
syntax enable
set background=dark
colorscheme lucius

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
autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %
set autoread
command! W  write
" command! Wq  write
" command! WQ  write

let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:rustfmt_autosave = 1

set updatetime=300
set cmdheight=2
set hidden
set signcolumn=yes
set shortmess+=c
