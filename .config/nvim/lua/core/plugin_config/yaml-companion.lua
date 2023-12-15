local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

local cfg = require("yaml-companion").setup({
	-- Add any options here, or leave empty to use the default settings
	-- lspconfig = {
	--   cmd = {"yaml-language-server"}
	-- },
	builtin_matchers = {
		-- Detects Kubernetes files based on content
		kubernetes = { enabled = true },
		cloud_init = { enabled = true },
	},
	lspconfig = {
		settings = {
			yaml = {
				validate = false,
			},
		},
    capabilities = capabilities
	},
})


require("lspconfig")["yamlls"].setup(cfg)

local function get_schema()
	local schema = require("yaml-companion").get_buf_schema(0)
	if schema.result[1].name == "none" then
		return ""
	end
	return schema.result[1].name
end
