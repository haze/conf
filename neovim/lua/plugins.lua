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
  use 'rhysd/vim-llvm'
  use 'hoob3rt/lualine.nvim'
  use 'L3MON4D3/LuaSnip'
  use 'windwp/nvim-autopairs'
  use 'msanders/cocoa.vim'
  use 'ggandor/lightspeed.nvim'
  use 'Glench/Vim-Jinja2-Syntax'
  use {
    'hrsh7th/nvim-cmp', 
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-emoji',
      'hrsh7th/cmp-calc',
      'hrsh7th/cmp-buffer',
      'saadparwaiz1/cmp_luasnip',
    }
  }
  use {
    'ziglang/zig.vim', ft = {'zig'}
  }
  -- use {'rust-lang/rust.vim', ft = {'rust'}}
  use 'kyazdani42/nvim-tree.lua'
  use {'dag/vim-fish', ft = {'fish'}}
  use 'PeterRincker/vim-searchlight'
  use 'farmergreg/vim-lastplace'
  use {
    'ibhagwan/fzf-lua',
    requires = {
      'vijaymarupudi/nvim-fzf'
    }
  }
  use 'romainl/vim-cool'
  use 'tpope/vim-unimpaired'
  use 'rktjmp/lush.nvim'
  use {'yuezk/vim-js', ft = {'javascript'}}
  use 'lukas-reineke/indent-blankline.nvim'
  use 'vimoxide/vim-cinnabar'
  use '/Users/haze/src/monokrom.vim'
end)
