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
  "folke/tokyonight.nvim",           -- ui theme
  "mfussenegger/nvim-dap",           -- dap plugin for debugging
  "nvim-tree/nvim-tree.lua",         -- file explorer
  "nvim-tree/nvim-web-devicons",     -- icons
  "nvim-lualine/lualine.nvim",       -- statusline plugin
  "nvim-treesitter/nvim-treesitter", -- parser
  "vim-test/vim-test",               -- for test ?
  "lewis6991/gitsigns.nvim",         -- git decorations on editor changes deletions etc.
  "tpope/vim-fugitive",              -- git integration blame etc
  "sindrets/diffview.nvim",
  "kkharji/sqlite.lua",
  "Afourcat/treesitter-terraform-doc.nvim",
  "prochri/telescope-all-recent.nvim",
  {
    "rcarriga/nvim-dap-ui",
     dependencies = {
	{ "mfussenegger/nvim-dap" },
	{ "nvim-neotest/nvim-nio" },
     },
  },
  {
    "someone-stole-my-name/yaml-companion.nvim",
    dependencies = {
      { "neovim/nvim-lspconfig" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
    },
    config = function()
      require("telescope").load_extension("yaml_schema")
    end,
  },
  { "kevinhwang91/nvim-ufo", dependencies = "kevinhwang91/promise-async" },
  -- completion
  "hrsh7th/nvim-cmp",     -- completion plugin ??
  "hrsh7th/cmp-nvim-lsp", --
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
  },
  "saadparwaiz1/cmp_luasnip",
  "rafamadriz/friendly-snippets",
  "williamboman/mason.nvim", -- manage lsp dap etc
  "neovim/nvim-lspconfig",
  "williamboman/mason-lspconfig.nvim",
  { "romgrk/barbar.nvim",    dependencies = "nvim-tree/nvim-web-devicons" },
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
    tag = "0.1.4",
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
  {
    "hinell/lsp-timeout.nvim",
    dependencies = {
      "neovim/nvim-lspconfig"
    }
  },
  "dstein64/nvim-scrollview",
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      -- configurations go here
    },
  },
  {
    'linux-cultist/venv-selector.nvim',
    dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap-python' },
    opts = {
      -- Your options go here
      -- name = "venv",
      -- auto_refresh = false
    },
    event = 'VeryLazy', -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
    keys = {
      -- Keymap to open VenvSelector to pick a venv.
      { '<leader>vs', '<cmd>VenvSelect<cr>' },
      -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
      { '<leader>vc', '<cmd>VenvSelectCached<cr>' },
    },
  },
}

local opts = {}

require("lazy").setup(plugins, opts)

-- notify

vim.notify = require("notify")
