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
	use("nvim-telescope/telescope-ui-select.nvim")
	use("nvim-lua/plenary.nvim")
	use("MunifTanjim/nui.nvim")
	use("xiyaowong/transparent.nvim")
	use("mrjones2014/smart-splits.nvim")
	use("wbthomason/packer.nvim")
	use("elihunter173/dirbuf.nvim")
	use("nvim-tree/nvim-web-devicons")
	use("lukas-reineke/indent-blankline.nvim")
	use({
		"folke/noice.nvim",
		requires = { "nvim-telescope/telescope.nvim" },
	})
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

	local function centerText(text, width)
		local totalPadding = width - #text
		local leftPadding = math.floor(totalPadding / 2)
		local rightPadding = totalPadding - leftPadding
		return string.rep(" ", leftPadding) .. text .. string.rep(" ", rightPadding)
	end
	use({
		"goolord/alpha-nvim",
		requires = { "nvim-tree/nvim-web-devicons" }, -- Optional dependency for icons
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")
			dashboard.section.header.val = {

				[[       	 █████                             ]],
				[[        	████  ██                           ]],
				[[              ████  ██   ██████   ████  ███   ]],
				[[              	███████   ███  ███  ██████ ███   ]],
				[[               ██        ███  ███  ███ ██████  ]],
				[[	 	██          ██████   ███  ████   ]],
				[[              ██                                  ]],
				[[	     ██        󰹞󰹞󰹞      █  █     ]],
				[[                          █         █  █      ]],
				[[	                 █         █    █      ]],
				[[	                   󰹞󰹞󰹞       █    █      ]],
				[[        󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞 ]],
			}
			dashboard.section.buttons.val = {
				dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
				dashboard.button("q", "  Quit NVIM", ":qa<CR>"),
			}
			alpha.setup(dashboard.config)
		end,
	})

	-- Set header (ASCII art)
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})
	require("nvim-treesitter.configs").setup({
		ensure_installed = { "c", "python", "javascript", "lua" },
		highlight = { enable = true, additional_vim_regex_highlighting = true },
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

require("telescope").setup({
	extensions = {
		["ui-select"] = {
			-- Optionally customize the display options
			-- e.g., themes, custom displays, etc.
			-- you can refer to the readme for specific configurations
		},
	},
})

require("noice").setup({
	cmdline = {
		view = "cmdline_popup", -- use a popup for the command line
		format = {
			cmdline = { pattern = "^:", icon = ">", lang = "vim" },
		},
	},
	popupmenu = {
		backend = "telescope", -- use telescope for dropdown suggestions
	},
})
require("telescope").setup({
	defaults = {
		layout_strategy = "horizontal",
		sorting_strategy = "ascending",
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
require("telescope").load_extension("noice")
require("telescope").load_extension("ui-select")

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

colorscheme = mycolors
vim.cmd("colorscheme mycolors")
