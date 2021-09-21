local lspconfig = require'lspconfig'
local configs = require'lspconfig/configs'

local lsp_status = require('lsp-status')
local capabilities = require('cmp_nvim_lsp').update_capabilities(lsp_status.capabilities)

local map = function(type, key, value)
  vim.api.nvim_buf_set_keymap(0,type,key,value,{noremap = true, silent = true});
end


local custom_attach = function(client)
    lsp_status.on_attach(client)

    print("LanguageServer Attatched");
    if client.name ~= 'tsserver' then 
      vim.api.nvim_command("au BufWritePost <buffer> lua vim.lsp.buf.formatting_sync(nil, 3000)")
    end

    map('n','gD','<cmd>lua vim.lsp.buf.declaration()<CR>')
    map('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>')
    map('n','gr','<cmd>lua vim.lsp.buf.references()<CR>')
    map('n','gs','<cmd>lua vim.lsp.buf.signature_help()<CR>')
    map('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
    map('n','gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
    map('n','<leader>gw','<cmd>lua vim.lsp.buf.document_symbol()<CR>')
    map('n','<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
    map('n','<leader>ah','<cmd>lua vim.lsp.buf.hover()<CR>')
    map('n','<leader>af','<cmd>lua vim.lsp.buf.code_action()<CR>')
    map('n','<leader>ee','<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')
    map('n','rn','<cmd>lua vim.lsp.buf.rename()<CR>')
    map('n','<leader>ai','<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
    map('n','<leader>ao','<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
    map('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')

    if client.resolved_capabilities.document_highlight then
      vim.api.nvim_command('augroup lsp_aucmds')
      vim.api.nvim_command('au CursorHold <buffer> lua vim.lsp.buf.document_highlight()')
      vim.api.nvim_command('au CursorMoved <buffer> lua vim.lsp.buf.clear_references()')
      vim.api.nvim_command('augroup END')
      vim.api.nvim_command('hi LspReferenceText cterm=bold gui=bold')
      vim.api.nvim_command('hi LspReferenceRead cterm=bold gui=bold')
      vim.api.nvim_command('hi LspReferenceWrite cterm=bold gui=bold')
    end
end

lspconfig.zls.setup{
  on_attach = custom_attach,
  capabilities = capabilities,
}
lspconfig.rust_analyzer.setup{
  on_attach = custom_attach, 
  settings = {
  -- ['rust-analyzer'] = {
  --     cargo = {
  --       target = "wasm32-unknown-unknown",
  --     },
  --     checkOnSave = {
  --       target = "wasm32-unknown-unknown",
  --     }
  --   }
  },
  capabilities = capabilities,
}
lspconfig.clangd.setup{
  handlers = lsp_status.extensions.clangd.setup(),
  on_attach=custom_attach,
  init_options = {
    clangdFileStatus = true
  },
  cmd = {'clangd'},
  capabilities = capabilities,
}
lspconfig.jsonls.setup{
  on_attach=custom_attach,
  capabilities = capabilities,
}
lspconfig.html.setup{
  on_attach=custom_attach,
  capabilities = capabilities,
}
lspconfig.cssls.setup{
  on_attach=custom_attach,
  capabilities = capabilities,
}
lspconfig.sourcekit.setup{
  on_attach=custom_attach,
  capabilities = capabilities,
}
lspconfig.tsserver.setup{
  on_attach=custom_attach, 
  root_dir = vim.loop.cwd,
  capabilities = capabilities,
}
