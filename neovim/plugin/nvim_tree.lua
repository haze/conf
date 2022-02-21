vim.g.nvim_tree_show_icons = {
  git = 0,
  folders = 1,
  files = 0,
  folder_arrows = 0,
}

require 'nvim-tree'.setup {
  hijack_netrw = true,
  disable_netrw = true,
  auto_close = true,
  hijack_cursor = true,
  update_cwd = true,
}

