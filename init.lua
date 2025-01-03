-- ===========================================
-- Bootstrap mini.nvim
-- ===========================================
local path_package = vim.fn.stdpath("data") .. "/site/"
local mini_path = path_package .. "pack/deps/start/mini.nvim"

if not vim.loop.fs_stat(mini_path) then
	vim.cmd('echo "Installing `mini.nvim`" | redraw')
	local clone_cmd = {
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/echasnovski/mini.nvim",
		mini_path,
	}
	vim.fn.system(clone_cmd)
	vim.cmd("packadd mini.nvim | helptags ALL")
	vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

-- ===========================================
-- Setup mini.nvim
-- ===========================================
require("mini.deps").setup({ path = { package = path_package } })
local add = MiniDeps.add

add({
	source = "echasnovski/mini.nvim",
	name = "files", -- Required for mini.files
})

require("mini.files").setup()
require("mini.ai").setup()
vim.g.mapleader = " " -- Set space as the leader key

-- ===========================================
-- Packer Plugin Management
-- ===========================================
require("packer").startup(function(use)
	use("rcarriga/nvim-notify")
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use("nvim-lua/plenary.nvim")
	use("MunifTanjim/nui.nvim")
	use("xiyaowong/transparent.nvim")
	use("mrjones2014/smart-splits.nvim")
	use("wbthomason/packer.nvim")
	use("elihunter173/dirbuf.nvim")
	use("nvim-tree/nvim-web-devicons")
	use("lukas-reineke/indent-blankline.nvim")
	use("folke/noice.nvim")
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("toggleterm").setup()
		end,
	})
	use({
		"kylechui/nvim-surround",
		tag = "*",
		config = function()
			require("nvim-surround").setup()
		end,
	})
	use("tpope/vim-sleuth")
	use({
		"goolord/alpha-nvim",
		config = function()
			require("alpha").setup(require("alpha.themes.dashboard").config)
		end,
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})
	use({
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup()
		end,
	})
end)

-- ===========================================
-- Plugin Configurations
-- ===========================================
require("nvim-treesitter.configs").setup({
	ensure_installed = { "c", "python", "javascript", "lua" },
	highlight = { enable = true, additional_vim_regex_highlighting = false },
})

require("noice").setup({
	lsp = {
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
	},
	presets = {
		bottom_search = true,
		command_palette = true,
		long_message_to_split = true,
		inc_rename = false,
		lsp_doc_border = false,
	},
})

require("transparent").setup({ enable = true, extra_groups = {}, exclude = {} })

require("smart-splits").setup({
	default_amount = 3,
	at_edge = "wrap",
})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		rust = { "rustfmt", lsp_format = "fallback" },
		javascript = { "prettierd", "prettier", stop_after_first = true },
	},
})

-- ===========================================
-- Keybindings
-- ===========================================
vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left)
vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down)
vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up)
vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right)

vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)

vim.keymap.set("n", "<Leader>f", function()
	print("MiniFiles.open() triggered")
	require("mini.files").open()
end, { noremap = true, silent = true })

vim.keymap.set(
	"n",
	"<space>g",
	":ToggleTerm size=40 dir=~/Desktop direction=float name=desktop<CR> | startinsert",
	{ noremap = true, silent = true }
)
vim.keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<CR>")

-- ===========================================
-- Additional Settings
-- ===========================================

vim.opt.termguicolors = true
vim.notify = require("notify")

-- ===========================================
-- Autocommands
-- ===========================================
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

-- ===========================================
-- Custom Highlights
-- ===========================================
vim.api.nvim_set_hl(0, "TSFunction", { fg = "#EE8B8E", bold = true })
vim.api.nvim_set_hl(0, "TSKeyword", { fg = "#D8627C", italic = true })
vim.api.nvim_set_hl(0, "TSString", { fg = "#8DD0D9" })
vim.api.nvim_set_hl(0, "TSComment", { fg = "#AF95B0", italic = true })
vim.api.nvim_set_hl(0, "TSVariable", { fg = "#39BFD8" })
vim.api.nvim_set_hl(0, "TSConstant", { fg = "#E7B59E" })
