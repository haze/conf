set mouse=a
set nu
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif
set tabstop=4 expandtab shiftwidth=2 smarttab autoindent
" Required:
let g:python_host_prog = '/usr/bin/python3'
set noshowmode
set wildmenu
set termguicolors
set clipboard=unnamed
set autoread | au CursorHold * checktime | call feedkeys("lh")
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
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'hazebooth/vim-hazepunk'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'vim-scripts/wombat256.vim'
Plug 'maksimr/vim-jsbeautify'
" Plug 'Yggdroot/indentLine'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdtree'
Plug 'evanleck/vim-svelte'
Plug 'challenger-deep-theme/vim'
Plug 'hazebooth/vimdiscord'
Plug 'caksoylar/vim-mysticaltutor'
Plug 'sjl/badwolf'
Plug 'chriskempson/base16-vim'
Plug 'jdsimcoe/abstract.vim'
Plug 'dikiaap/minimalist'
Plug 'christophermca/meta5'
Plug 'yorickpeterse/happy_hacking.vim'

" Plug 'parsonsmatt/intero-neovim'

call plug#end()

" Add rust comments:
autocmd FileType rust setlocal commentstring=//\ %s

" Required:
autocmd FileType json syntax match Comment +\/\/.\+$+
filetype plugin indent on
syntax enable
set background=dark
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
let ayucolor="dark"
colorscheme minimalist

let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1


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
" for js
autocmd FileType javascript noremap <buffer> <c-f> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for jsx
autocmd FileType javascript,jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
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
      \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }

nnoremap <S-j> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==
" inoremap <S-j> <Esc>:m .+1<CR>==gi
" inoremap <S-k> <Esc>:m .-2<CR>==gi
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv
