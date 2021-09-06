local lsp_status = require('lsp-status')
require('lualine').setup{
  options = {
    theme = 'modus_vivendi'
  },
  sections = {
    lualine_c = {'filename', {lsp_status.status}},
    lualine_x = {},
    lualine_y = {},
  },
  inactive_sections = {
  },
}
