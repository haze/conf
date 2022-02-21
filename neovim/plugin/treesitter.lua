require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  sync_install = false,
  highlight = {
    enable = false,
    additional_vim_regex_highlighting = {"rust"},
  },
  indent = {
    enable = false
  },
}
