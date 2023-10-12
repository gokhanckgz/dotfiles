local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	"towolf/vim-helm",
	"rcarriga/nvim-notify",
	{
		"stevearc/conform.nvim",
		opts = {},
	},
	"folke/tokyonight.nvim", -- ui theme
	"mfussenegger/nvim-dap", -- dap plugin for debugging
	"nvim-tree/nvim-tree.lua", -- file explorer
	"nvim-tree/nvim-web-devicons", -- icons
	"nvim-lualine/lualine.nvim", -- statusline plugin
	"nvim-treesitter/nvim-treesitter", -- parser
	"vim-test/vim-test", -- for test ?
	"lewis6991/gitsigns.nvim", -- git decorations on editor changes deletions etc.
	"tpope/vim-fugitive", -- git integration blame etc
	"kkharji/sqlite.lua",
	"prochri/telescope-all-recent.nvim",
	{
		"rcarriga/nvim-dap-ui",
		dependencies = "mfussenegger/nvim-dap", -- debugger ui
	},
	{
		"wfxr/minimap.vim",
		build = "cargo install --locked code-minimap",
		lazy = false,
		cmd = { "Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight" },
		init = function()
			vim.cmd("let g:minimap_width = 10")
			vim.cmd("let g:minimap_auto_start = 1")
			vim.cmd("let g:minimap_auto_start_win_enter = 1")
			vim.cmd("let g:minimap_git_colors = 1")
		end,
		-- config = function()
		--     vim.cmd("let g:minimap_width = 10")
		--     vim.cmd("let g:minimap_auto_start = 1")
		--     vim.cmd("let g:minimap_auto_start_win_enter = 1")
		-- end,
	},
	-- completion
	"hrsh7th/nvim-cmp", -- completion plugin ??
	"hrsh7th/cmp-nvim-lsp", --
	"L3MON4D3/LuaSnip",
	dependencies = { "rafamadriz/friendly-snippets" },
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",

	"williamboman/mason.nvim", -- manage lsp dap etc
	"neovim/nvim-lspconfig",
	"williamboman/mason-lspconfig.nvim",
	{ "romgrk/barbar.nvim", dependencies = "nvim-tree/nvim-web-devicons" },
	"glepnir/lspsaga.nvim",

	--- telescope
	"cljoly/telescope-repo.nvim",
	"nvim-telescope/telescope-live-grep-args.nvim",
	{
		"glepnir/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				-- config
			})
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		dependencies = { { "nvim-lua/plenary.nvim" }, { "nvim-telescope/telescope-live-grep-args.nvim" } },
	},
	"nvim-telescope/telescope-project.nvim",
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
	},
	"hrsh7th/cmp-nvim-lsp",
}

local opts = {}

require("lazy").setup(plugins, opts)

-- notify

vim.notify = require("notify")
