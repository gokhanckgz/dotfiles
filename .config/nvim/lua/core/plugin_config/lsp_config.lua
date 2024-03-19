require("mason-lspconfig").setup {
  ensure_installed = { "lua_ls", "bashls", "dockerls", "docker_compose_language_service", "gopls", "golangci_lint_ls", "helm_ls", "jsonls", "pyright", "taplo", "terraformls", "tflint", "yamlls", "ansiblels" },
}

local configs = require("lspconfig.configs")
local lspconfig = require("lspconfig")
local util = require("lspconfig.util")

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

vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { silent = true })
vim.keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", { silent = true })
vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<cr>", { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })
vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { silent = true })
vim.keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>")

lspconfig.lua_ls.setup({
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

lspconfig.tflint.setup({})

lspconfig.jsonnet_ls.setup({})

lspconfig.bashls.setup({})

lspconfig.ansiblels.setup({})

lspconfig.pyright.setup({
  capabilities = capabilities,
})

lspconfig.gopls.setup({
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

lspconfig.tsserver.setup({
  capabilities = capabilities,
})

lspconfig.html.setup({
  capabilities = capabilities,
})

lspconfig.terraformls.setup({
  on_attach = function()
    -- This register the user command "OpenDoc" that you are able to bind to any key.
    require('treesitter-terraform-doc').setup()
  end,
  capabilities = capabilities,
})

if not configs.helm_ls then
  configs.helm_ls = {
    default_config = {
      cmd = { "helm_ls", "serve" },
      filetypes = { "helm" },
      root_dir = function(fname)
        return util.root_pattern("Chart.yaml")(fname)
      end,
    },
  }
end

lspconfig.helm_ls.setup({
  filetypes = { "helm" },
  cmd = { "helm_ls", "serve" },
})

require'lspconfig'.groovyls.setup{}



vim.api.nvim_create_autocmd("CursorHold", {
  buffer = bufnr,
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = 'rounded',
      source = 'always',
      prefix = ' ',
      scope = 'cursor',
    }
    vim.diagnostic.open_float(nil, opts)
  end
})
