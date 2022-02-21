return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/lsp-status.nvim'
    use 'dominikduda/vim_current_word'
    use 'ray-x/lsp_signature.nvim'
    use 'folke/lsp-colors.nvim'
    use 'norcalli/nvim-colorizer.lua'
    use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = {
      {
        'stsewd/playground',
        branch = "fix-show-hl"
      },
    },
    }
    use 'tomtom/tcomment_vim'
    use 'tpope/vim-sleuth'
    use 'rhysd/vim-llvm'
    use 'hoob3rt/lualine.nvim'
    use 'L3MON4D3/LuaSnip'
    use {
    'j-hui/fidget.nvim',
    config = function()
        require "fidget".setup {}
    end
    }
    use {
    'romgrk/nvim-treesitter-context',
    config = function()
        require 'treesitter-context'.setup {
        enable = true,
        throttle = true,
        }
    end
    }
    use 'dstein64/nvim-scrollview'
    use 'mhartington/formatter.nvim'
    use {
    'mfussenegger/nvim-lint',
    config = function()
        require('lint').linters_by_ft = {
        markdown = { 'vale', }
        }
    end
    }
    use 'windwp/nvim-autopairs'
    use "msanders/cocoa.vim"
    use {
    'cormacrelf/dark-notify',
    config = function()
        require("dark_notify").run({
        schemes = {
          dark = {
            colorscheme = "github_dark",
          },
          light = {
            colorscheme = "github_light"
          },
        }
        })
    end
    }
    use '/Users/haze/src/github-nvim-theme/'
    -- use "projekt0n/github-nvim-theme"
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
  'lewis6991/gitsigns.nvim',
  requires = {
      'nvim-lua/plenary.nvim'
  },
  config = function()
      require('gitsigns').setup()
  end
    }
    use {
    'ziglang/zig.vim', ft = { 'zig' }
    }
    -- use {'rust-lang/rust.vim', ft = {'rust'}}
    use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons'
    }
    }
    use { 'dag/vim-fish', ft = { 'fish' } }
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
    use { 'yuezk/vim-js', ft = { 'javascript' } }
    use 'lukas-reineke/indent-blankline.nvim'
    use 'vimoxide/vim-cinnabar'
    use '/Users/haze/src/monokrom.vim'
    use '/Users/haze/src/sys_appearance.nvim'
end)

