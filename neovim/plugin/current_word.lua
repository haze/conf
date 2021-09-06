local utils = require 'config.utils'
local autocmd = utils.autocmd

vim.g['vim_current_word#highlight_twins'] = 0;

autocmd('current_word_underline', {
  [[VimEnter * hi CurrentWord guifg=NONE guibg=NONE gui=underline]],
}, true)
