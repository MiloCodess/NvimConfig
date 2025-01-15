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
require("mini.icons").setup()
require("mini.files").setup()
require("mini.ai").setup()
colorscheme = mycolors
vim.cmd("colorscheme mycolors")
vim.g.mapleader = " " -- Set space as the leader key
require("lspconfig").pyright.setup({})
-- ===========================================
-- Packer Plugin Management
-- ===========================================
require("packer").startup(function(use)
	use("nvim-tree/nvim-web-devicons")
	use("lewis6991/gitsigns.nvim")
	use("rcarriga/nvim-notify")
	use({
		"SmiteshP/nvim-navic",
		requires = "neovim/nvim-lspconfig",
	})
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({
		"itchyny/calendar.vim",
		config = function()
			vim.cmd("source ~/.cache/calendar.vim/credentials.vim") -- Source the credentials file
		end,
	})
	use({
		"glepnir/galaxyline.nvim",
		branch = "main",
		-- your statusline
		-- some optional icons
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})
	use("nvim-telescope/telescope-ui-select.nvim")
	use("nvim-lua/plenary.nvim")
	use("MunifTanjim/nui.nvim")
	use("xiyaowong/transparent.nvim")
	use("mrjones2014/smart-splits.nvim")
	use("wbthomason/packer.nvim")
	use("elihunter173/dirbuf.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("honza/vim-snippets")

	use("lervag/vimtex")
	use("KeitaNakamura/tex-conceal.vim")
	use("dylanaraps/wal")
	use({
		"rareitems/anki.nvim",
		config = function()
			require("anki").setup({
				-- this function will add support for associating '.anki' extension with both 'anki' and 'tex' filetype.
				tex_support = false,
				models = {
					-- Here you specify which notetype should be associated with which deck
					NoteType = "PathToDeck",
					["Basic"] = "Deck",
					["Super Basic"] = "Deck::ChildDeck",
				},
				-- linters = require("anki.linters").default_linters();
			})
		end,
	})
	use({ "akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons" })
	use({
		"utilyre/barbecue.nvim",
		tag = "*",
		requires = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		after = "nvim-web-devicons", -- keep this if you're using NvChad
		config = function()
			require("barbecue").setup({
				theme = {
					-- this highlight is used to override other highlights
					-- you can take advantage of its `bg` and set a background throughout your winbar
					-- (e.g. basename will look like this: { fg = "#c0caf5", bold = true })
					normal = { fg = "#c0caf5" },

					-- these highlights correspond to symbols table from config
					ellipsis = { fg = "#737aa2" },
					separator = { fg = "#737aa2" },
					modified = { fg = "#737aa2" },

					-- these highlights represent the _text_ of three main parts of barbecue
					dirname = { fg = "#737aa2" },
					basename = { bold = true },
					context = {},

					-- these highlights are used for context/navic icons
					context_file = { fg = "#ac8fe4" },
					context_module = { fg = "#ac8fe4" },
					context_namespace = { fg = "#ac8fe4" },
					context_package = { fg = "#ac8fe4" },
					context_class = { fg = "#ac8fe4" },
					context_method = { fg = "#ac8fe4" },
					context_property = { fg = "#ac8fe4" },
					context_field = { fg = "#ac8fe4" },
					context_constructor = { fg = "#ac8fe4" },
					context_enum = { fg = "#ac8fe4" },
					context_interface = { fg = "#ac8fe4" },
					context_function = { fg = "#ac8fe4" },
					context_variable = { fg = "#ac8fe4" },
					context_constant = { fg = "#ac8fe4" },
					context_string = { fg = "#ac8fe4" },
					context_number = { fg = "#ac8fe4" },
					context_boolean = { fg = "#ac8fe4" },
					context_array = { fg = "#ac8fe4" },
					context_object = { fg = "#ac8fe4" },
					context_key = { fg = "#ac8fe4" },
					context_null = { fg = "#ac8fe4" },
					context_enum_member = { fg = "#ac8fe4" },
					context_struct = { fg = "#ac8fe4" },
					context_event = { fg = "#ac8fe4" },
					context_operator = { fg = "#ac8fe4" },
					context_type_parameter = { fg = "#ac8fe4" },
				},
			})
		end,
	})

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
		"nvimdev/dashboard-nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
	})
	-- Set header (ASCII art)
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})
	-- require this lua file somewhere in your `init.vim`, or use `:lua`
	use({
		"epwalsh/obsidian.nvim",
		tag = "*", -- recommended, use latest release instead of latest commit
		requires = {
			-- Required.
			"nvim-lua/plenary.nvim",

			-- see below for full list of optional dependencies 👇
		},
		config = function()
			require("obsidian").setup({
				workspaces = {
					{
						name = "classes",
						path = "/Users/miloarjana/vaults/classes",
					},
				},
				templates = {
					folder = "my-templates-folder",
					date_format = "%Y-%m-%d-%a",
					time_format = "%H:%M",
				},
				note_id_func = function(title)
					return title
				end,

				-- see below for full list of options 👇
			})
		end,
	})
	require("nvim-treesitter.configs").setup({
		ensure_installed = { "c", "python", "javascript", "lua" },
		highlight = { enable = true, additional_vim_regex_highlighting = true },
	})
	require("transparent").setup({ enable = true, extra_groups = {}, exclude = {} })

	use({
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup()
		end,
	})
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
	})
	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({
				preset = "classic",
				spelling = {
					enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
					suggestions = 20, -- how many suggestions should be shown in the list?
				},
				-- Your configuration goes here
				-- Leave it empty to use the default settings
			})
		end,
	})
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
			"hrsh7th/cmp-buffer", -- Buffer completions
			"hrsh7th/cmp-path", -- Path completions
			"hrsh7th/cmp-cmdline", -- Cmdline completions
			"hrsh7th/vim-vsnip", -- Snippet engine
			"hrsh7th/cmp-vsnip", -- Snippet completions
		},
	})
end)

-- ===========================================
-- Plugin Configurations
-- ===========================================
local navic = require("nvim-navic")

require("lspconfig").clangd.setup({
	on_attach = function(client, bufnr)
		navic.attach(client, bufnr)
	end,
})
require("nvim-treesitter.configs").setup({
	ensure_installed = { "c", "python", "javascript", "lua" },
	highlight = { enable = true, additional_vim_regex_highlighting = false },
})
require("gitsigns").setup({
	current_line_blame = true,
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
require("ibl").setup()
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

require("dashboard").setup({
	theme = "hyper", -- or 'doom' depending on preference
	config = {
		header = {
			"	     █████                           ",
			"        ████  ██                            ",
			"       ████  ██   ██████   ████  ███    ",
			"        ███████   ███  ███  ██████ ███    ",
			"        ██        ███  ███  ███ ██████   ",
			"        ██          ██████   ███  ████    ",
			"       ██                                   ",
			"     ██        󰹞󰹞󰹞      █  █      ",
			"                   █         █  █       ",
			"                 █         █    █       ",
			"                   󰹞󰹞󰹞       █    █       ",
			"  󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞  ",
		},
		shortcut = {
			{ desc = " Find Files", group = "@property", action = "Telescope find_files", key = "f" },
			{ desc = " Edit Config", group = "Number", action = "edit $MYVIMRC", key = "e" },
			{ desc = "󰊳 Update Plugins", group = "@variable", action = "Lazy update", key = "u" },
		},
		footer = { "LESS IS MORE" },
	},
})

-- Enable the LSP server for Python (pyright)

-- Keybindwdwddings
-- ====================================
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
require("ibl").setup({
	exclude = {
		filetypes = { "dashboard" }, -- Add your dashboard filetype here
	},
})
local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For vsnip users.
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "vsnip" },
	}, {
		{ name = "buffer" },
	}),
})
local capabilities = require("cmp_nvim_lsp").default_capabilities()
require("lspconfig")["pyright"].setup({
	capabilities = capabilities,
})

vim.opt.termguicolors = true
require("bufferline").setup({})
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

vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#39bfd8" })

vim.api.nvim_set_hl(0, "Beige", { fg = "#e7b59e" }) -- Beige
vim.api.nvim_set_hl(0, "DarkBlue", { fg = "#39bfd8" }) -- DarkBlue
vim.api.nvim_set_hl(0, "LightBlue", { fg = "#8dd0d9" }) -- LightBlue

vim.api.nvim_set_hl(0, "Pink", { fg = "#ee8b8e" }) -- Pink
vim.api.nvim_set_hl(0, "DarkPink", { fg = "#d8627c" }) -- DarkPink
vim.api.nvim_set_hl(0, "Purple", { fg = "#af95b0" }) -- Purple

vim.g.calendar_google_calendar = 1
vim.g.calendar_google_task = 1

vim.o.conceallevel = 1 -- You can also use 2 for more concealment

-- UltiSnips settings
vim.g.UltiSnipsExpandTrigger = "<tab>"
vim.g.UltiSnipsJumpForwardTrigger = "<tab>"
vim.g.UltiSnipsJumpBackwardTrigger = "<s-tab>"

-- VimTeX settings
vim.g.tex_flavor = "latex"
vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_quickfix_mode = 0

-- Tex Conceal settings
vim.o.conceallevel = 1
vim.g.tex_conceal = "abdmg"
vim.cmd([[hi Conceal ctermbg=none]])
