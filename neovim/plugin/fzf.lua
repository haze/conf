require'fzf-lua'.setup {
  winopts = {
    split = 'belowright new',
    win_row = 1,
    preview = {
      vertical = "down:80%",
    },
  },
  files = {
    git_icons = false,
    file_icons = false,
    color_icons = false,
  },
  lsp = {
    git_icons = false,
    file_icons = false,
    color_icons = false,
  },
}
