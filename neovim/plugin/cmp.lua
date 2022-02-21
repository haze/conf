local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require'cmp';

local check_back_space = function()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
end

cmp.setup {
  snippet = {
    expand = function(args) 
      require'luasnip'.lsp_expand(args.body)
    end
  },
  experimental = {
    ghost_text = {
      hl_group = 'Comment',
    },
  },
  view = {
    entries = "custom"
  },
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },
  -- preselect = cmp.PreselectMode.Item,
  mapping = {
    ['<C-e>'] = cmp.mapping.close(),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif check_back_space() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, true, true), 'n')
      else
        fallback()
      end
    end,
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
    -- { name = 'buffer' },
  };
}

require('nvim-autopairs').setup{};

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
