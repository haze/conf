return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/lsp-status.nvim'
  use 'dominikduda/vim_current_word'
  use 'ray-x/lsp_signature.nvim'
  use 'folke/lsp-colors.nvim'
  use 'norcalli/nvim-colorizer.lua'
  use 'tomtom/tcomment_vim'
  use 'tpope/vim-sleuth'
  use 'hoob3rt/lualine.nvim'
  use 'L3MON4D3/LuaSnip'
  use {
    'hrsh7th/nvim-cmp', 
    requires = {
      'windwp/nvim-autopairs',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      { 'Saecki/crates.nvim',
        requires = {
          'nvim-lua/plenary.nvim',
        },
      },
      'hrsh7th/cmp-emoji',
      'hrsh7th/cmp-calc',
      'saadparwaiz1/cmp_luasnip',
    }
  }
  use {'ziglang/zig.vim', ft = {'zig'}}
  use {'dag/vim-fish', ft = {'fish'}}
  use 'kyazdani42/nvim-tree.lua'
  use {'rust-lang/rust.vim', ft = {'rust'}}
  use {'arzg/vim-rust-syntax-ext', ft = {'rust'}}
  use 'PeterRincker/vim-searchlight'
  use 'farmergreg/vim-lastplace'
  use 'junegunn/fzf.vim'
  use 'junegunn/fzf'
  use 'romainl/vim-cool'
  use 'tpope/vim-unimpaired'
  use 'rktjmp/lush.nvim'
  use '~/src/based'
end)
