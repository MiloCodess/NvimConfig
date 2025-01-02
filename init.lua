local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'

if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    'git', 'clone', '--filter=blob:none',
    'https://github.com/echasnovski/mini.nvim', mini_path
  }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end
 
-- Set up mini.deps
require('mini.deps').setup({ path = { package = path_package } })
local add = MiniDeps.add

-- Add `mini.files` properly
add({
  source = 'echasnovski/mini.nvim',
  name = 'files', -- Required for mini.files
})

require('mini.files').setup()
require('mini.ai').setup()
-- Initialize packer and add plugins
--

require('packer').startup(function(use)
  use('mrjones2014/smart-splits.nvim')
  use 'wbthomason/packer.nvim'
  use 'elihunter173/dirbuf.nvim'
  use 'nvim-tree/nvim-web-devicons'
  use "lukas-reineke/indent-blankline.nvim"
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end}
 
  use {
      "kylechui/nvim-surround",
      tag = "*", -- Use for stability; omit to use `main` branch for the latest features
      config = function()
          require("nvim-surround").setup()
      end,
  }
  use 'tpope/vim-sleuth'

  use {
    'goolord/alpha-nvim',
    config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
  }
  
end)
require("ibl").setup()
require('smart-splits').setup({
  -- You can customize these options as needed.
  default_amount = 3, -- Number of lines/columns to resize by at a time.
  at_edge = 'wrap', -- Behavior when at the edge of a split.
})
-- Resize splits
vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left)
vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down)
vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up)
vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right)

-- Moving between splits
vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)


vim.g.mapleader = ' '  -- Set space as the leader key
vim.api.nvim_set_keymap('n', '<Leader>f', ':lua MiniFiles.open()<CR>', { noremap = true, silent = true })


vim.api.nvim_set_keymap('n', '<space>g', ':ToggleTerm size=40 dir=~/Desktop direction=float name=desktop<CR> | startinsert', { noremap = true, silent = true })

