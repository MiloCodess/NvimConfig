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

-- Set up mini.deps
require("mini.deps").setup({ path = { package = path_package } })
local add = MiniDeps.add

-- Add `mini.files` properly
add({
	source = "echasnovski/mini.nvim",
	name = "files", -- Required for mini.files
})

require("mini.files").setup()
require("mini.ai").setup()
-- Initialize packer and add plugins
--

require("packer").startup(function(use)
	use("rcarriga/nvim-notify")
	config = function()
		require("notify").setup({
			stages = "fade_in_slide_out",
			background_colour = "FloatShadow",
			timeout = 3000,
		})
	end
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		-- or                            , branch = '0.1.x',
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
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
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
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	use({
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup()
		end,
	})
end)
require("nvim-treesitter.configs").setup({
	ensure_installed = { "c", "python", "javascript", "lua" }, -- Add your languages here
	highlight = {
		enable = true, -- Enable Tree-sitter highlighting
		additional_vim_regex_highlighting = false, -- Disable default regex-based highlighting
	},
})
require("noice").setup({
	lsp = {
		-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
		},
	},
	-- you can enable a preset for easier configuration
	presets = {
		bottom_search = true, -- use a classic bottom cmdline for search
		command_palette = true, -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = false, -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = false, -- add a border to hover docs and signature help
	},
})
require("transparent").setup({
	enable = true, -- boolean: enable transparent
	extra_groups = { -- table/string: additional groups that should be clear
		-- In this case, we need to specify `cterm` as well
		-- as `gui` to ensure that it's cleared on all terminals
		-- this is the default
		-- "GitGutter",
		-- "LspDiagnosticsDefaultError",
		-- "LspDiagnosticsDefaultWarning",
		-- "LspDiagnosticsDefaultInformation",
		-- "LspDiagnosticsDefaultHint"
	},
	exclude = {}, -- table: groups you don't want to clear
})
require("ibl").setup()
require("smart-splits").setup({
	-- You can customize these options as needed.
	default_amount = 3, -- Number of lines/columns to resize by at a time.
	at_edge = "wrap", -- Behavior when at the edge of a split.
})
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "isort", "black" },
		-- You can customize some of the format options for the filetype (:help conform.format)
		rust = { "rustfmt", lsp_format = "fallback" },
		-- Conform will run the first available formatter
		javascript = { "prettierd", "prettier", stop_after_first = true },
	},
})
-- Resize splits
vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left)
vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down)
vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up)
vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right)

-- Moving between splits
vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)

vim.g.mapleader = " " -- Set space as the leader key
vim.api.nvim_set_keymap("n", "<Leader>f", ":lua MiniFiles.open()<CR>", { noremap = true, silent = true })

vim.opt.termguicolors = true

vim.api.nvim_set_keymap(
	"n",
	"<space>g",
	":ToggleTerm size=40 dir=~/Desktop direction=float name=desktop<CR> | startinsert",
	{ noremap = true, silent = true }
)
require("telescope").load_extension("fzf")

require("telescope").load_extension("live_grep_args")
require("telescope").load_extension("noice")

require("notify")("My super important message")

vim.notify = require("notify")

-- Set custom Tree-sitter highlight colors
vim.api.nvim_set_hl(0, "TSFunction", { fg = "#EE8B8E", bold = true }) -- Functions in gold
vim.api.nvim_set_hl(0, "TSKeyword", { fg = "#D8627C", italic = true }) -- Keywords in orange
vim.api.nvim_set_hl(0, "TSString", { fg = "#8DD0D9" }) -- Strings in green
vim.api.nvim_set_hl(0, "TSComment", { fg = "#AF95B0", italic = true }) -- Comments in gray
vim.api.nvim_set_hl(0, "TSVariable", { fg = "#39BFD8" }) -- Variables in light blue
vim.api.nvim_set_hl(0, "TSConstant", { fg = "#E7B59E" }) -- Constants in tomato red

vim.api.nvim_set_keymap("n", "<Leader>f", ":lua MiniFiles.open()<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<CR>")

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
