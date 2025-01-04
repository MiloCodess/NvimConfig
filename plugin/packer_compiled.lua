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
local package_path_str = "/Users/miloarjana/.cache/nvim/packer_hererocks/2.1.1731601260/share/lua/5.1/?.lua;/Users/miloarjana/.cache/nvim/packer_hererocks/2.1.1731601260/share/lua/5.1/?/init.lua;/Users/miloarjana/.cache/nvim/packer_hererocks/2.1.1731601260/lib/luarocks/rocks-5.1/?.lua;/Users/miloarjana/.cache/nvim/packer_hererocks/2.1.1731601260/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/miloarjana/.cache/nvim/packer_hererocks/2.1.1731601260/lib/lua/5.1/?.so"
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
  ["alpha-nvim"] = {
    config = { "\27LJ\2\n―\n\0\0\t\0\17\1\0306\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0019\2\4\0025\3\6\0=\3\5\0029\2\3\0019\2\a\0024\3\3\0009\4\b\1'\6\t\0'\a\n\0'\b\v\0B\4\4\2>\4\1\0039\4\b\1'\6\f\0'\a\r\0'\b\14\0B\4\4\0?\4\0\0=\3\5\0029\2\15\0009\4\16\1B\2\2\1K\0\1\0\vconfig\nsetup\f:qa<CR>\19ο  Quit NVIM\6q :ene <BAR> startinsert <CR>\18ο  New file\6e\vbutton\fbuttons\1\r\0\0@       \tξΊ βββββξΈ                             C        \tββββ ξΎ ββ      ξ―                     k              ξ²ββββ ξΊ ββ  ξΊ ββββββξΈ   ββββξΈ ξΎ βββ   m              \tβββββββξΌ   βββξΌ ξΎ βββ  ββββββξΈ βββ   e               ββξΌ        βββξΈ ξΊ βββ  βββξΎ ββββββξ°  S\t \tββ         ξΎ ββββββξΌ   βββξΈ ξΎ ββββ   A        ξΊ      ββ     ξΈ                             \\\t ξΎ ξΈ  ξΎ ββξΌ  ξΊ ξΌ    ξΊ σ°Ήσ°Ήσ°ΉξΈ     ξΎ βξΈ ξΊ βξΌ     K          ξΎ ξΈ     ξΊ ξΌ         β         βξΎ ξΌ β      E\t    ξΈξΎ ξΈ ξΊ ξΌξΊ          β         β    β      H\t       ξΎ ξΌ          ξΎ σ°Ήσ°Ήσ°ΉξΌ       β    β      ΄\1     ξ²σ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήξ°    \bval\vheader\fsection\27alpha.themes.dashboard\nalpha\frequire\5ΐ\4\0" },
    loaded = true,
    path = "/Users/miloarjana/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["conform.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fconform\frequire\0" },
    loaded = true,
    path = "/Users/miloarjana/.local/share/nvim/site/pack/packer/start/conform.nvim",
    url = "https://github.com/stevearc/conform.nvim"
  },
  ["dirbuf.nvim"] = {
    loaded = true,
    path = "/Users/miloarjana/.local/share/nvim/site/pack/packer/start/dirbuf.nvim",
    url = "https://github.com/elihunter173/dirbuf.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/Users/miloarjana/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["noice.nvim"] = {
    loaded = true,
    path = "/Users/miloarjana/.local/share/nvim/site/pack/packer/start/noice.nvim",
    url = "https://github.com/folke/noice.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/Users/miloarjana/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-notify"] = {
    loaded = true,
    path = "/Users/miloarjana/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18nvim-surround\frequire\0" },
    loaded = true,
    path = "/Users/miloarjana/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/miloarjana/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/miloarjana/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/miloarjana/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/miloarjana/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["smart-splits.nvim"] = {
    loaded = true,
    path = "/Users/miloarjana/.local/share/nvim/site/pack/packer/start/smart-splits.nvim",
    url = "https://github.com/mrjones2014/smart-splits.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    loaded = true,
    path = "/Users/miloarjana/.local/share/nvim/site/pack/packer/start/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/miloarjana/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/Users/miloarjana/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["transparent.nvim"] = {
    loaded = true,
    path = "/Users/miloarjana/.local/share/nvim/site/pack/packer/start/transparent.nvim",
    url = "https://github.com/xiyaowong/transparent.nvim"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/Users/miloarjana/.local/share/nvim/site/pack/packer/start/vim-sleuth",
    url = "https://github.com/tpope/vim-sleuth"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\2\n―\n\0\0\t\0\17\1\0306\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0019\2\4\0025\3\6\0=\3\5\0029\2\3\0019\2\a\0024\3\3\0009\4\b\1'\6\t\0'\a\n\0'\b\v\0B\4\4\2>\4\1\0039\4\b\1'\6\f\0'\a\r\0'\b\14\0B\4\4\0?\4\0\0=\3\5\0029\2\15\0009\4\16\1B\2\2\1K\0\1\0\vconfig\nsetup\f:qa<CR>\19ο  Quit NVIM\6q :ene <BAR> startinsert <CR>\18ο  New file\6e\vbutton\fbuttons\1\r\0\0@       \tξΊ βββββξΈ                             C        \tββββ ξΎ ββ      ξ―                     k              ξ²ββββ ξΊ ββ  ξΊ ββββββξΈ   ββββξΈ ξΎ βββ   m              \tβββββββξΌ   βββξΌ ξΎ βββ  ββββββξΈ βββ   e               ββξΌ        βββξΈ ξΊ βββ  βββξΎ ββββββξ°  S\t \tββ         ξΎ ββββββξΌ   βββξΈ ξΎ ββββ   A        ξΊ      ββ     ξΈ                             \\\t ξΎ ξΈ  ξΎ ββξΌ  ξΊ ξΌ    ξΊ σ°Ήσ°Ήσ°ΉξΈ     ξΎ βξΈ ξΊ βξΌ     K          ξΎ ξΈ     ξΊ ξΌ         β         βξΎ ξΌ β      E\t    ξΈξΎ ξΈ ξΊ ξΌξΊ          β         β    β      H\t       ξΎ ξΌ          ξΎ σ°Ήσ°Ήσ°ΉξΌ       β    β      ΄\1     ξ²σ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήσ°Ήξ°    \bval\vheader\fsection\27alpha.themes.dashboard\nalpha\frequire\5ΐ\4\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)
-- Config for: conform.nvim
time([[Config for conform.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fconform\frequire\0", "config", "conform.nvim")
time([[Config for conform.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18nvim-surround\frequire\0", "config", "nvim-surround")
time([[Config for nvim-surround]], false)

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
