require'fzf-lua'.setup {
  winopts = {
    split = 'belowright new',
    win_row = 1,
  },
  preview_border = 'noborder',
  preview_vertical = 'down:80%',
  default_previewer = 'bat',
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
