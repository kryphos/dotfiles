-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

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
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/luca/.cache/nvim/packer_hererocks/2.1.1731601260/share/lua/5.1/?.lua;/home/luca/.cache/nvim/packer_hererocks/2.1.1731601260/share/lua/5.1/?/init.lua;/home/luca/.cache/nvim/packer_hererocks/2.1.1731601260/lib/luarocks/rocks-5.1/?.lua;/home/luca/.cache/nvim/packer_hererocks/2.1.1731601260/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/luca/.cache/nvim/packer_hererocks/2.1.1731601260/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
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
  ["Abstract-cs"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/Abstract-cs",
    url = "https://github.com/Abstract-IDE/Abstract-cs"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["baleia.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/baleia.nvim",
    url = "https://github.com/m00qek/baleia.nvim"
  },
  ["barbar.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/barbar.nvim",
    url = "https://github.com/romgrk/barbar.nvim"
  },
  catppuccin = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["citruszest.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/citruszest.nvim",
    url = "https://github.com/zootedb0t/citruszest.nvim"
  },
  ["cloak.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/cloak.nvim",
    url = "https://github.com/laytan/cloak.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["compile-mode.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/compile-mode.nvim",
    url = "https://github.com/ej-shafran/compile-mode.nvim"
  },
  ["copilot.vim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/copilot.vim",
    url = "https://github.com/github/copilot.vim"
  },
  ["crates.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/crates.nvim",
    url = "https://github.com/saecki/crates.nvim"
  },
  ["cyberdream.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/cyberdream.nvim",
    url = "https://github.com/scottmckendry/cyberdream.nvim"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["dressing.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  everblush = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/everblush",
    url = "https://github.com/Everblush/nvim"
  },
  ["fidget.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  flexoki = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/flexoki",
    url = "https://github.com/kepano/flexoki-neovim"
  },
  ["garbage-day.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/garbage-day.nvim",
    url = "https://github.com/zeioth/garbage-day.nvim"
  },
  ["git-conflict.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/git-conflict.nvim",
    url = "https://github.com/akinsho/git-conflict.nvim"
  },
  ["github-nvim-theme"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/github-nvim-theme",
    url = "https://github.com/projekt0n/github-nvim-theme"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  harpoon = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/ThePrimeagen/harpoon"
  },
  ["icon-picker.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/icon-picker.nvim",
    url = "https://github.com/ziontee113/icon-picker.nvim"
  },
  ["image.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/image.nvim",
    url = "https://github.com/3rd/image.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["jupynium.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/jupynium.nvim",
    url = "https://github.com/kiyoon/jupynium.nvim"
  },
  ["kanagawa.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/kanagawa.nvim",
    url = "https://github.com/rebelot/kanagawa.nvim"
  },
  kiss = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/kiss",
    url = "https://github.com/rileytwo/kiss"
  },
  ["leap.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/leap.nvim",
    url = "https://github.com/ggandor/leap.nvim"
  },
  ["lsp-inlayhints.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/lsp-inlayhints.nvim",
    url = "https://github.com/lvimuser/lsp-inlayhints.nvim"
  },
  ["lsp-zero.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspkind.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/lspkind.nvim",
    url = "https://github.com/onsails/lspkind.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/lush.nvim",
    url = "https://github.com/rktjmp/lush.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason-null-ls.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/mason-null-ls.nvim",
    url = "https://github.com/jay-babu/mason-null-ls.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["material.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/material.nvim",
    url = "https://github.com/marko-cerovac/material.nvim"
  },
  ["melange-nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/melange-nvim",
    url = "https://github.com/savq/melange-nvim"
  },
  ["mgz.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/mgz.nvim",
    url = "https://github.com/stankovictab/mgz.nvim"
  },
  ["midnight.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/midnight.nvim",
    url = "https://github.com/dasupradyumna/midnight.nvim"
  },
  ["mini.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/mini.nvim",
    url = "https://github.com/echasnovski/mini.nvim"
  },
  ["modus-themes.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/modus-themes.nvim",
    url = "https://github.com/miikanissi/modus-themes.nvim"
  },
  ["neo-tree.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  ["neodev.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/neodev.nvim",
    url = "https://github.com/folke/neodev.nvim"
  },
  ["neofusion.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/neofusion.nvim",
    url = "https://github.com/diegoulloao/neofusion.nvim"
  },
  ["neovim-auto-autoread"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/neovim-auto-autoread",
    url = "https://github.com/TheZoq2/neovim-auto-autoread"
  },
  ["neovim-ayu"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/neovim-ayu",
    url = "https://github.com/Shatur/neovim-ayu"
  },
  nerdcommenter = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/nerdcommenter",
    url = "https://github.com/scrooloose/nerdcommenter"
  },
  nightfly = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/nightfly",
    url = "https://github.com/bluz71/vim-nightfly-colors"
  },
  ["nightfox.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/nightfox.nvim",
    url = "https://github.com/EdenEast/nightfox.nvim"
  },
  ["no-clown-fiesta.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/no-clown-fiesta.nvim",
    url = "https://github.com/aktersnurra/no-clown-fiesta.nvim"
  },
  ["noctis.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/noctis.nvim",
    url = "https://github.com/kartikp10/noctis.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["numb.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/numb.nvim",
    url = "https://github.com/nacro90/numb.nvim"
  },
  ["nvcode-color-schemes.vim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/nvcode-color-schemes.vim",
    url = "https://github.com/christianchiarulli/nvcode-color-schemes.vim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/NvChad/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text",
    url = "https://github.com/theHamsta/nvim-dap-virtual-text"
  },
  ["nvim-early-retirement"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/nvim-early-retirement",
    url = "https://github.com/chrisgrieser/nvim-early-retirement"
  },
  ["nvim-gdb"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/nvim-gdb",
    url = "https://github.com/sakhnik/nvim-gdb"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-nio"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/nvim-nio",
    url = "https://github.com/nvim-neotest/nvim-nio"
  },
  ["nvim-notify"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-pqf"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/nvim-pqf",
    url = "https://github.com/yorickpeterse/nvim-pqf"
  },
  ["nvim-spectre"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/nvim-spectre",
    url = "https://github.com/nvim-pack/nvim-spectre"
  },
  ["nvim-test"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/nvim-test",
    url = "https://github.com/klen/nvim-test"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-context"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["oil.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/oil.nvim",
    url = "https://github.com/stevearc/oil.nvim"
  },
  ["oldworld.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/oldworld.nvim",
    url = "https://github.com/dgox16/oldworld.nvim"
  },
  ["oxocarbon.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/oxocarbon.nvim",
    url = "https://github.com/nyoom-engineering/oxocarbon.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["radium.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/radium.nvim",
    url = "https://github.com/Sly-Harvey/radium.nvim"
  },
  ["rose-pine"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/rose-pine",
    url = "https://github.com/rose-pine/neovim"
  },
  ["scratch.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/scratch.nvim",
    url = "https://github.com/LintaoAmons/scratch.nvim"
  },
  ["smart-splits.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/smart-splits.nvim",
    url = "https://github.com/mrjones2014/smart-splits.nvim"
  },
  spaceduck = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/spaceduck",
    url = "https://github.com/pineapplegiant/spaceduck"
  },
  ["starry.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/starry.nvim",
    url = "https://github.com/ray-x/starry.nvim"
  },
  sttusline = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/sttusline",
    url = "https://github.com/sontungexpt/sttusline"
  },
  ["sweet-fusion"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/sweet-fusion",
    url = "https://github.com/DanielEliasib/sweet-fusion"
  },
  ["symbol-usage.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/symbol-usage.nvim",
    url = "https://github.com/Wansmer/symbol-usage.nvim"
  },
  ["tailwindcss-colorizer-cmp.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/tailwindcss-colorizer-cmp.nvim",
    url = "https://github.com/roobert/tailwindcss-colorizer-cmp.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["tokyodark.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/tokyodark.nvim",
    url = "https://github.com/tiagovla/tokyodark.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["transparent.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/transparent.nvim",
    url = "https://github.com/xiyaowong/transparent.nvim"
  },
  ["trouble.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["troublesum.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/troublesum.nvim",
    url = "https://github.com/ivanjermakov/troublesum.nvim"
  },
  ["truedark-vim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/truedark-vim",
    url = "https://github.com/bratpeki/truedark-vim"
  },
  ["ts-error-translator.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/ts-error-translator.nvim",
    url = "https://github.com/dmmulroy/ts-error-translator.nvim"
  },
  ["vim-camelsnek"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/vim-camelsnek",
    url = "https://github.com/nicwest/vim-camelsnek"
  },
  ["vim-cyberpunk"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/vim-cyberpunk",
    url = "https://github.com/thedenisnikulin/vim-cyberpunk"
  },
  ["vim-dadbod"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/vim-dadbod",
    url = "https://github.com/tpope/vim-dadbod"
  },
  ["vim-dadbod-completion"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/vim-dadbod-completion",
    url = "https://github.com/kristijanhusak/vim-dadbod-completion"
  },
  ["vim-dadbod-ui"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/vim-dadbod-ui",
    url = "https://github.com/kristijanhusak/vim-dadbod-ui"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/vim-easy-align",
    url = "https://github.com/junegunn/vim-easy-align"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-illuminate"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/vim-illuminate",
    url = "https://github.com/RRethy/vim-illuminate"
  },
  ["vim-moonfly-colors"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/vim-moonfly-colors",
    url = "https://github.com/bluz71/vim-moonfly-colors"
  },
  ["vim-move"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/vim-move",
    url = "https://github.com/matze/vim-move"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  vimtex = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/vimtex",
    url = "https://github.com/lervag/vimtex"
  },
  ["virtcolumn.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/virtcolumn.nvim",
    url = "https://github.com/xiyaowong/virtcolumn.nvim"
  },
  ["winshift.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/winshift.nvim",
    url = "https://github.com/sindrets/winshift.nvim"
  },
  ["zenbones.nvim"] = {
    loaded = true,
    path = "/home/luca/.local/share/nvim/site/pack/packer/start/zenbones.nvim",
    url = "https://github.com/zenbones-theme/zenbones.nvim"
  }
}

time([[Defining packer_plugins]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
