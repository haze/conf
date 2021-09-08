vim.cmd [[highlight IndentBlanklineChar guifg=#505050 blend=nocombine]]

require("indent_blankline").setup {
  buftype_exclude = {
    "terminal",
    "nofile",
  }
}
