local conform = require("conform")
conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "isort", "black" },
		-- Use a sub-list to run only the first available formatter
		javascript = { { "prettierd", "prettier" } },

		go = { "gofmt", "goimports", "golines" },

		json = { "jq" },

		sh = { "shfmt", "shellcheck" },

		terraform = { "terraform_fmt" },

		yaml = { "yamlfmt" },
	},
	---format_on_save = {
	-- I recommend these options. See :help conform.format for details.
	---lsp_fallback = true,
	---timeout_ms = 500,
	---},
})


vim.keymap.set("n", "V", function ()
  conform.format({ async= true, lsp_fallback = true})
end )
