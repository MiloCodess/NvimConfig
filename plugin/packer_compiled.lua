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
local package_path_str = "/Users/miloarjana/.cache/nvim/packer_hererocks/2.1.1734355927/share/lua/5.1/?.lua;/Users/miloarjana/.cache/nvim/packer_hererocks/2.1.1734355927/share/lua/5.1/?/init.lua;/Users/miloarjana/.cache/nvim/packer_hererocks/2.1.1734355927/lib/luarocks/rocks-5.1/?.lua;/Users/miloarjana/.cache/nvim/packer_hererocks/2.1.1734355927/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/miloarjana/.cache/nvim/packer_hererocks/2.1.1734355927/lib/lua/5.1/?.so"
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
  ["anki.nvim"] = {
    config = { "\27LJ\2\n›\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\vmodels\1\0\3\nBasic\tDeck\16Super Basic\20Deck::ChildDeck\rNoteType\15PathToDeck\1\0\2\16tex_support\1\vmodels\0\nsetup\tanki\frequire\0" },
    loaded = true,
    path = "/Users/miloarjana/.local/share/nvim/site/pack/packer/start/anki.nvim",
    url = "https://github.com/rareitems/anki.nvim"
  },
  ["barbecue.nvim"] = {
    config = { "\27LJ\2\në\r\0\0\5\0G\0K6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2E\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\0034\4\0\0=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\0035\4\21\0=\4\22\0035\4\23\0=\4\24\0035\4\25\0=\4\26\0035\4\27\0=\4\28\0035\4\29\0=\4\30\0035\4\31\0=\4 \0035\4!\0=\4\"\0035\4#\0=\4$\0035\4%\0=\4&\0035\4'\0=\4(\0035\4)\0=\4*\0035\4+\0=\4,\0035\4-\0=\4.\0035\4/\0=\0040\0035\0041\0=\0042\0035\0043\0=\0044\0035\0045\0=\0046\0035\0047\0=\0048\0035\0049\0=\4:\0035\4;\0=\4<\0035\4=\0=\4>\0035\4?\0=\4@\0035\4A\0=\4B\0035\4C\0=\4D\3=\3F\2B\0\2\1K\0\1\0\ntheme\1\0\1\ntheme\0\27context_type_parameter\1\0\1\afg\f#ac8fe4\21context_operator\1\0\1\afg\f#ac8fe4\18context_event\1\0\1\afg\f#ac8fe4\19context_struct\1\0\1\afg\f#ac8fe4\24context_enum_member\1\0\1\afg\f#ac8fe4\17context_null\1\0\1\afg\f#ac8fe4\16context_key\1\0\1\afg\f#ac8fe4\19context_object\1\0\1\afg\f#ac8fe4\18context_array\1\0\1\afg\f#ac8fe4\20context_boolean\1\0\1\afg\f#ac8fe4\19context_number\1\0\1\afg\f#ac8fe4\19context_string\1\0\1\afg\f#ac8fe4\21context_constant\1\0\1\afg\f#ac8fe4\21context_variable\1\0\1\afg\f#ac8fe4\21context_function\1\0\1\afg\f#ac8fe4\22context_interface\1\0\1\afg\f#ac8fe4\17context_enum\1\0\1\afg\f#ac8fe4\24context_constructor\1\0\1\afg\f#ac8fe4\18context_field\1\0\1\afg\f#ac8fe4\21context_property\1\0\1\afg\f#ac8fe4\19context_method\1\0\1\afg\f#ac8fe4\18context_class\1\0\1\afg\f#ac8fe4\20context_package\1\0\1\afg\f#ac8fe4\22context_namespace\1\0\1\afg\f#ac8fe4\19context_module\1\0\1\afg\f#ac8fe4\17context_file\1\0\1\afg\f#ac8fe4\fcontext\rbasename\1\0\1\tbold\2\fdirname\1\0\1\afg\f#737aa2\rmodified\1\0\1\afg\f#737aa2\14separator\1\0\1\afg\f#737aa2\rellipsis\1\0\1\afg\f#737aa2\vnormal\1\0!\27context_type_parameter\0\21context_operator\0\18context_event\0\19context_struct\0\24context_enum_member\0\17context_null\0\16context_key\0\19context_object\0\18context_array\0\20context_boolean\0\19context_number\0\19context_string\0\21context_constant\0\21context_variable\0\21context_function\0\22context_interface\0\17context_enum\0\24context_constructor\0\18context_field\0\21context_property\0\19context_method\0\18context_class\0\20context_package\0\22context_namespace\0\19context_module\0\17context_file\0\fcontext\0\rbasename\0\fdirname\0\rmodified\0\14separator\0\rellipsis\0\vnormal\0\1\0\1\afg\f#c0caf5\nsetup\rbarbecue\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/miloarjana/.local/share/nvim/site/pack/packer/opt/barbecue.nvim",
    url = "https://github.com/utilyre/barbecue.nvim"
  },
  ["bufferline.nvim"] = {
    loaded = true,
    path = "/Users/miloarjana/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["calendar.vim"] = {
    config = { "\27LJ\2\nP\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0001source ~/.cache/calendar.vim/credentials.vim\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/miloarjana/.local/share/nvim/site/pack/packer/start/calendar.vim",
    url = "https://github.com/itchyny/calendar.vim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/miloarjana/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/miloarjana/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/miloarjana/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/miloarjana/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/Users/miloarjana/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  ["conform.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fconform\frequire\0" },
    loaded = true,
    path = "/Users/miloarjana/.local/share/nvim/site/pack/packer/start/conform.nvim",
    url = "https://github.com/stevearc/conform.nvim"
  },
  ["dashboard-nvim"] = {
    loaded = true,
    path = "/Users/miloarjana/.local/share/nvim/site/pack/packer/start/dashboard-nvim",
    url = "https://github.com/nvimdev/dashboard-nvim"
  },
  ["dirbuf.nvim"] = {
    loaded = true,
    path = "/Users/miloarjana/.local/share/nvim/site/pack/packer/start/dirbuf.nvim",
    url = "https://github.com/elihunter173/dirbuf.nvim"
  },
  ["galaxyline.nvim"] = {
    loaded = true,
    path = "/Users/miloarjana/.local/share/nvim/site/pack/packer/start/galaxyline.nvim",
    url = "https://github.com/glepnir/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/miloarjana/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  harpoon = {
    loaded = true,
    path = "/Users/miloarjana/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/ThePrimeagen/harpoon"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/Users/miloarjana/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["neo-tree.nvim"] = {
    loaded = true,
    path = "/Users/miloarjana/.local/share/nvim/site/pack/packer/start/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
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
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/miloarjana/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/miloarjana/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-navic"] = {
    loaded = true,
    path = "/Users/miloarjana/.local/share/nvim/site/pack/packer/start/nvim-navic",
    url = "https://github.com/SmiteshP/nvim-navic"
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
  ["obsidian.nvim"] = {
    config = { "\27LJ\2\n\v\0\1\1\0\0\0\1L\0\2\0£\2\1\0\5\0\n\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0004\3\3\0005\4\3\0>\4\1\3=\3\5\0025\3\6\0=\3\a\0023\3\b\0=\3\t\2B\0\2\1K\0\1\0\17note_id_func\0\14templates\1\0\3\16date_format\16%Y-%m-%d-%a\16time_format\n%H:%M\vfolder\24my-templates-folder\15workspaces\1\0\3\17note_id_func\0\15workspaces\0\14templates\0\1\0\2\tpath%/Users/miloarjana/vaults/classes\tname\fclasses\nsetup\robsidian\frequire\0" },
    loaded = true,
    path = "/Users/miloarjana/.local/share/nvim/site/pack/packer/start/obsidian.nvim",
    url = "https://github.com/epwalsh/obsidian.nvim"
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
  ["tex-conceal.vim"] = {
    loaded = true,
    path = "/Users/miloarjana/.local/share/nvim/site/pack/packer/start/tex-conceal.vim",
    url = "https://github.com/KeitaNakamura/tex-conceal.vim"
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
  ultisnips = {
    loaded = true,
    path = "/Users/miloarjana/.local/share/nvim/site/pack/packer/start/ultisnips",
    url = "https://github.com/SirVer/ultisnips"
  },
  undotree = {
    loaded = true,
    path = "/Users/miloarjana/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-latex-live-preview"] = {
    loaded = true,
    path = "/Users/miloarjana/.local/share/nvim/site/pack/packer/start/vim-latex-live-preview",
    url = "https://github.com/xuhdev/vim-latex-live-preview"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/Users/miloarjana/.local/share/nvim/site/pack/packer/start/vim-sleuth",
    url = "https://github.com/tpope/vim-sleuth"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/Users/miloarjana/.local/share/nvim/site/pack/packer/start/vim-snippets",
    url = "https://github.com/honza/vim-snippets"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/miloarjana/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  },
  vimtex = {
    config = { "\27LJ\2\nh\0\0\2\0\6\0\t6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0K\0\1\0\flatexmk\27vimtex_compiler_method\tskim\23vimtex_view_method\6g\bvim\0" },
    loaded = true,
    path = "/Users/miloarjana/.local/share/nvim/site/pack/packer/start/vimtex",
    url = "https://github.com/lervag/vimtex"
  },
  wal = {
    loaded = true,
    path = "/Users/miloarjana/.local/share/nvim/site/pack/packer/start/wal",
    url = "https://github.com/dylanaraps/wal"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n‚\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\rspelling\1\0\2\fenabled\2\16suggestions\3\20\1\0\2\rspelling\0\vpreset\fclassic\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/Users/miloarjana/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: obsidian.nvim
time([[Config for obsidian.nvim]], true)
try_loadstring("\27LJ\2\n\v\0\1\1\0\0\0\1L\0\2\0£\2\1\0\5\0\n\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0004\3\3\0005\4\3\0>\4\1\3=\3\5\0025\3\6\0=\3\a\0023\3\b\0=\3\t\2B\0\2\1K\0\1\0\17note_id_func\0\14templates\1\0\3\16date_format\16%Y-%m-%d-%a\16time_format\n%H:%M\vfolder\24my-templates-folder\15workspaces\1\0\3\17note_id_func\0\15workspaces\0\14templates\0\1\0\2\tpath%/Users/miloarjana/vaults/classes\tname\fclasses\nsetup\robsidian\frequire\0", "config", "obsidian.nvim")
time([[Config for obsidian.nvim]], false)
-- Config for: conform.nvim
time([[Config for conform.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fconform\frequire\0", "config", "conform.nvim")
time([[Config for conform.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: vimtex
time([[Config for vimtex]], true)
try_loadstring("\27LJ\2\nh\0\0\2\0\6\0\t6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0K\0\1\0\flatexmk\27vimtex_compiler_method\tskim\23vimtex_view_method\6g\bvim\0", "config", "vimtex")
time([[Config for vimtex]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18nvim-surround\frequire\0", "config", "nvim-surround")
time([[Config for nvim-surround]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n‚\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\rspelling\1\0\2\fenabled\2\16suggestions\3\20\1\0\2\rspelling\0\vpreset\fclassic\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: anki.nvim
time([[Config for anki.nvim]], true)
try_loadstring("\27LJ\2\n›\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\vmodels\1\0\3\nBasic\tDeck\16Super Basic\20Deck::ChildDeck\rNoteType\15PathToDeck\1\0\2\16tex_support\1\vmodels\0\nsetup\tanki\frequire\0", "config", "anki.nvim")
time([[Config for anki.nvim]], false)
-- Config for: calendar.vim
time([[Config for calendar.vim]], true)
try_loadstring("\27LJ\2\nP\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0001source ~/.cache/calendar.vim/credentials.vim\bcmd\bvim\0", "config", "calendar.vim")
time([[Config for calendar.vim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-web-devicons ]]
vim.cmd [[ packadd barbecue.nvim ]]

-- Config for: barbecue.nvim
try_loadstring("\27LJ\2\në\r\0\0\5\0G\0K6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2E\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\0034\4\0\0=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\0035\4\21\0=\4\22\0035\4\23\0=\4\24\0035\4\25\0=\4\26\0035\4\27\0=\4\28\0035\4\29\0=\4\30\0035\4\31\0=\4 \0035\4!\0=\4\"\0035\4#\0=\4$\0035\4%\0=\4&\0035\4'\0=\4(\0035\4)\0=\4*\0035\4+\0=\4,\0035\4-\0=\4.\0035\4/\0=\0040\0035\0041\0=\0042\0035\0043\0=\0044\0035\0045\0=\0046\0035\0047\0=\0048\0035\0049\0=\4:\0035\4;\0=\4<\0035\4=\0=\4>\0035\4?\0=\4@\0035\4A\0=\4B\0035\4C\0=\4D\3=\3F\2B\0\2\1K\0\1\0\ntheme\1\0\1\ntheme\0\27context_type_parameter\1\0\1\afg\f#ac8fe4\21context_operator\1\0\1\afg\f#ac8fe4\18context_event\1\0\1\afg\f#ac8fe4\19context_struct\1\0\1\afg\f#ac8fe4\24context_enum_member\1\0\1\afg\f#ac8fe4\17context_null\1\0\1\afg\f#ac8fe4\16context_key\1\0\1\afg\f#ac8fe4\19context_object\1\0\1\afg\f#ac8fe4\18context_array\1\0\1\afg\f#ac8fe4\20context_boolean\1\0\1\afg\f#ac8fe4\19context_number\1\0\1\afg\f#ac8fe4\19context_string\1\0\1\afg\f#ac8fe4\21context_constant\1\0\1\afg\f#ac8fe4\21context_variable\1\0\1\afg\f#ac8fe4\21context_function\1\0\1\afg\f#ac8fe4\22context_interface\1\0\1\afg\f#ac8fe4\17context_enum\1\0\1\afg\f#ac8fe4\24context_constructor\1\0\1\afg\f#ac8fe4\18context_field\1\0\1\afg\f#ac8fe4\21context_property\1\0\1\afg\f#ac8fe4\19context_method\1\0\1\afg\f#ac8fe4\18context_class\1\0\1\afg\f#ac8fe4\20context_package\1\0\1\afg\f#ac8fe4\22context_namespace\1\0\1\afg\f#ac8fe4\19context_module\1\0\1\afg\f#ac8fe4\17context_file\1\0\1\afg\f#ac8fe4\fcontext\rbasename\1\0\1\tbold\2\fdirname\1\0\1\afg\f#737aa2\rmodified\1\0\1\afg\f#737aa2\14separator\1\0\1\afg\f#737aa2\rellipsis\1\0\1\afg\f#737aa2\vnormal\1\0!\27context_type_parameter\0\21context_operator\0\18context_event\0\19context_struct\0\24context_enum_member\0\17context_null\0\16context_key\0\19context_object\0\18context_array\0\20context_boolean\0\19context_number\0\19context_string\0\21context_constant\0\21context_variable\0\21context_function\0\22context_interface\0\17context_enum\0\24context_constructor\0\18context_field\0\21context_property\0\19context_method\0\18context_class\0\20context_package\0\22context_namespace\0\19context_module\0\17context_file\0\fcontext\0\rbasename\0\fdirname\0\rmodified\0\14separator\0\rellipsis\0\vnormal\0\1\0\1\afg\f#c0caf5\nsetup\rbarbecue\frequire\0", "config", "barbecue.nvim")

time([[Sequenced loading]], false)

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
