vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  update_cwd = true,
  view = {
    adaptive_size = true
  },
  live_filter = {
    always_show_folders = false
  }
})

local api = require('nvim-tree.api')

vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')
vim.keymap.set('n', '+', api.tree.change_root_to_node)
vim.keymap.set('n', '-', api.tree.change_root_to_parent)


vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
      vim.cmd "quit"
    end
  end
})
