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
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },
  -- preselect = cmp.PreselectMode.Item,
  mapping = {
    ['<C-e>'] = cmp.mapping.close(),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<Tab>'] = function (fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
      elseif check_back_space() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, true, true), 'n')
      else
        fallback()
      end
    end,
    -- ['<CR>'] = cmp.mapping.confirm({
    --   behavior = cmp.ConfirmBehavior.Replace,
    --   select = true,
    -- }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

_G.smart_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return vim.fn['compe#confirm']();
  else
    return t "<Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})

require('nvim-autopairs').setup{}

require("nvim-autopairs.completion.cmp").setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true, -- it will auto insert `(` after select function or method item
  auto_select = true -- automatically select the first item
})
