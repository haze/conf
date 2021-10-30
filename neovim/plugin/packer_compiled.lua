-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/haze/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/haze/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/haze/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/haze/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/haze/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/Users/haze/.local/share/nvim/site/pack/packer/start/LuaSnip"
  },
  ["Vim-Jinja2-Syntax"] = {
    loaded = true,
    path = "/Users/haze/.local/share/nvim/site/pack/packer/start/Vim-Jinja2-Syntax"
  },
  based = {
    loaded = true,
    path = "/Users/haze/.local/share/nvim/site/pack/packer/start/based"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/haze/.local/share/nvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-calc"] = {
    loaded = true,
    path = "/Users/haze/.local/share/nvim/site/pack/packer/start/cmp-calc"
  },
  ["cmp-emoji"] = {
    loaded = true,
    path = "/Users/haze/.local/share/nvim/site/pack/packer/start/cmp-emoji"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/haze/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/haze/.local/share/nvim/site/pack/packer/start/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/haze/.local/share/nvim/site/pack/packer/start/cmp_luasnip"
  },
  ["cocoa.vim"] = {
    loaded = true,
    path = "/Users/haze/.local/share/nvim/site/pack/packer/start/cocoa.vim"
  },
  ["fzf-lua"] = {
    loaded = true,
    path = "/Users/haze/.local/share/nvim/site/pack/packer/start/fzf-lua"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/Users/haze/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lightspeed.nvim"] = {
    loaded = true,
    path = "/Users/haze/.local/share/nvim/site/pack/packer/start/lightspeed.nvim"
  },
  ["lsp-colors.nvim"] = {
    loaded = true,
    path = "/Users/haze/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/Users/haze/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/Users/haze/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/Users/haze/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/Users/haze/.local/share/nvim/site/pack/packer/start/lush.nvim"
  },
  ["monokrom.vim"] = {
    loaded = true,
    path = "/Users/haze/.local/share/nvim/site/pack/packer/start/monokrom.vim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/Users/haze/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/haze/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/Users/haze/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-fzf"] = {
    loaded = true,
    path = "/Users/haze/.local/share/nvim/site/pack/packer/start/nvim-fzf"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/haze/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/Users/haze/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/haze/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  tcomment_vim = {
    loaded = true,
    path = "/Users/haze/.local/share/nvim/site/pack/packer/start/tcomment_vim"
  },
  ["vim-cinnabar"] = {
    loaded = true,
    path = "/Users/haze/.local/share/nvim/site/pack/packer/start/vim-cinnabar"
  },
  ["vim-cool"] = {
    loaded = true,
    path = "/Users/haze/.local/share/nvim/site/pack/packer/start/vim-cool"
  },
  ["vim-fish"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/haze/.local/share/nvim/site/pack/packer/opt/vim-fish"
  },
  ["vim-js"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/haze/.local/share/nvim/site/pack/packer/opt/vim-js"
  },
  ["vim-lastplace"] = {
    loaded = true,
    path = "/Users/haze/.local/share/nvim/site/pack/packer/start/vim-lastplace"
  },
  ["vim-llvm"] = {
    loaded = true,
    path = "/Users/haze/.local/share/nvim/site/pack/packer/start/vim-llvm"
  },
  ["vim-searchlight"] = {
    loaded = true,
    path = "/Users/haze/.local/share/nvim/site/pack/packer/start/vim-searchlight"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/Users/haze/.local/share/nvim/site/pack/packer/start/vim-sleuth"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/Users/haze/.local/share/nvim/site/pack/packer/start/vim-unimpaired"
  },
  vim_current_word = {
    loaded = true,
    path = "/Users/haze/.local/share/nvim/site/pack/packer/start/vim_current_word"
  },
  ["zig.vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/haze/.local/share/nvim/site/pack/packer/opt/zig.vim"
  }
}

time([[Defining packer_plugins]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'vim-js'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType zig ++once lua require("packer.load")({'zig.vim'}, { ft = "zig" }, _G.packer_plugins)]]
vim.cmd [[au FileType fish ++once lua require("packer.load")({'vim-fish'}, { ft = "fish" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /Users/haze/.local/share/nvim/site/pack/packer/opt/vim-fish/ftdetect/fish.vim]], true)
vim.cmd [[source /Users/haze/.local/share/nvim/site/pack/packer/opt/vim-fish/ftdetect/fish.vim]]
time([[Sourcing ftdetect script at: /Users/haze/.local/share/nvim/site/pack/packer/opt/vim-fish/ftdetect/fish.vim]], false)
time([[Sourcing ftdetect script at: /Users/haze/.local/share/nvim/site/pack/packer/opt/vim-js/ftdetect/javascript.vim]], true)
vim.cmd [[source /Users/haze/.local/share/nvim/site/pack/packer/opt/vim-js/ftdetect/javascript.vim]]
time([[Sourcing ftdetect script at: /Users/haze/.local/share/nvim/site/pack/packer/opt/vim-js/ftdetect/javascript.vim]], false)
time([[Sourcing ftdetect script at: /Users/haze/.local/share/nvim/site/pack/packer/opt/zig.vim/ftdetect/zig.vim]], true)
vim.cmd [[source /Users/haze/.local/share/nvim/site/pack/packer/opt/zig.vim/ftdetect/zig.vim]]
time([[Sourcing ftdetect script at: /Users/haze/.local/share/nvim/site/pack/packer/opt/zig.vim/ftdetect/zig.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
