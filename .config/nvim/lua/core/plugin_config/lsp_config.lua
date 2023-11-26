require("mason-lspconfig").setup()

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

require("lspsaga").setup({
	code_action_icon = "💡",
	symbol_in_winbar = {
		in_custom = false,
		enable = false,
		separator = " ",
		show_file = true,
		file_formatter = "",
	},
})

vim.keymap.set("n", "gd", "<cmd>Lspsaga finder<CR>", { silent = true })
vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<cr>", { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })
vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { silent = true })
vim.keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>")

require("lspconfig").lua_ls.setup({
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})

require("lspconfig").jsonnet_ls.setup({})

require("lspconfig").bashls.setup({})

require("lspconfig").pyright.setup({
	capabilities = capabilities,
})

local util = require("lspconfig/util")

require("lspconfig").gopls.setup({
	cmd = { "gopls", "serve" },
	filetypes = { "go", "gomod" },
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
})

require("lspconfig").tsserver.setup({
	capabilities = capabilities,
})

require("lspconfig").html.setup({
	capabilities = capabilities,
})

require("lspconfig").terraformls.setup({
	capabilities = capabilities,
})
