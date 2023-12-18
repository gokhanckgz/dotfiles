require('scrollview').setup({
  current_only = true,
  base = 'buffer',
  column = 130,
  signs_on_startup = {'all'},
  diagnostics_severities = {vim.diagnostic.severity.ERROR}
})
