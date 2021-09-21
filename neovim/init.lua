-- Adapted from https://github.com/wbthomason/dotfiles/blob/linux/neovim/.config/nvim/init.lua
local g = vim.g
local cmd = vim.cmd
local o, wo, bo = vim.o, vim.wo, vim.bo
local utils = require 'config.utils'
local opt = utils.opt
local autocmd = utils.autocmd
local map = utils.map

-- Leader/local leader
g.mapleader = [[,]]
g.maplocalleader = [[,]]

-- Skip some remote provider loading
g.loaded_python_provider = 0
g.python_host_prog = '/usr/bin/python2'
g.python3_host_prog = '/usr/bin/python'

-- Disable some built-in plugins we don't want
local disabled_built_ins = {
  'gzip',
  'man',
  'shada_plugin',
  'tarPlugin',
  'tar',
  'zipPlugin',
  'zip',
  'netrwPlugin',
}

for i = 1, 8 do
  g['loaded_' .. disabled_built_ins[i]] = 1
end


local buffer = { o, bo }
local window = { o, wo }
opt('textwidth', 100, buffer)
opt('scrolloff', 7)
opt('wildignore', '*.o,*~,*.pyc')
opt('wildmode', 'longest,full')
opt('whichwrap', vim.o.whichwrap .. '<,>,h,l')
opt('inccommand', 'nosplit')
opt('lazyredraw', true)
opt('showmatch', true)
opt('ignorecase', true)
opt('smartcase', true)
opt('tabstop', 2, buffer)
opt('softtabstop', 0, buffer)
opt('expandtab', true, buffer)
opt('shiftwidth', 2, buffer)
opt('number', true, window)
opt('smartindent', true, buffer)
opt('laststatus', 2)
opt('showmode', false)
opt('shada', [['20,<50,s10,h,/100]])
opt('hidden', true)
opt('shortmess', o.shortmess .. 'c')
opt('completeopt', 'menuone,noselect')
opt('joinspaces', false)
opt('updatetime', 500)
opt('conceallevel', 2, window)
opt('concealcursor', 'nc', window)
opt('previewheight', 5)
opt('undofile', true, buffer)
opt('synmaxcol', 500, buffer)
opt('display', 'msgsep')
opt('cursorline', true, window)
opt('modeline', false, buffer)
opt('mouse', 'nivh')
opt('clipboard', 'unnamedplus')
opt('signcolumn', 'yes:1', window)
opt('hlsearch', true)
opt('incsearch', true)
opt('swapfile', false)
opt('icm', 'nosplit')

-- Colorscheme
opt('termguicolors', true)
opt('background', 'dark')
cmd [[colorscheme based]]

-- Autocommands
autocmd(
  'syntax_aucmds',
  [[Syntax * syn match extTodo "\<\(NOTE\|HACK\|BAD\|TODO\):\?" containedin=.*Comment.* | hi! link extTodo Todo]],
  true
)
autocmd('misc_aucmds', {
  [[BufWinEnter * checktime]],
  [[TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=500}]],
  [[FileType qf set nobuflisted ]],
}, true)

-- Commands
cmd [[command! WhatHighlight :call util#syntax_stack()]]
cmd [[command! PackerInstall packadd packer.nvim | lua require('plugins').install()]]
cmd [[command! PackerUpdate packadd packer.nvim | lua require('plugins').update()]]
cmd [[command! Sync packadd packer.nvim | lua require('plugins').sync()]]
cmd [[command! PackerClean packadd packer.nvim | lua require('plugins').clean()]]
cmd [[command! PackerCompile packadd packer.nvim | lua require('plugins').compile()]]

-- Mappings
local silent = { silent = true }
map('n', '<C-e>', '<cmd>NvimTreeToggle<cr>', silent)
map('n', '<S-f>', "<cmd>lua require('fzf-lua').files()<cr>", silent)
map('n', '<S-tab>', "<cmd>lua require'fzf-lua.providers.grep'.live_grep()<cr>", silent)
map('n', '<S-l>', "<cmd>lua require('fzf-lua').lsp_live_workspace_symbols()<cr>", silent)
map('n', '<S-w>', "<cmd>lua require('fzf-lua').lsp_document_diagnostics()<cr>", silent)
map({'n','v'}, 'c', '"_c',  silent)
map({'n','v'}, 'z', '"_x',  silent)
map('n', '<S-k>', '<cmd>m .-2<cr>==', silent)
map('n', '<S-j>', '<cmd>m .+1<cr>==', silent)
map('n', '<leader>t', '<cmd>WhatHighlight<cr>', silent)
map('v', '<S-k>', '[egv', { silent = true, noremap = false })
map('v', '<S-j>', ']egv', { silent = true, noremap = false })
map('n', ':W', ':w')

-- Bootstrap packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end
