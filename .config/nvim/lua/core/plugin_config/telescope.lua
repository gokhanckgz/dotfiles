require('telescope').setup{
  extensions = {
    repo = {
      list = {
          search_dirs = {
           "~/Workspace",
          },
          settings = {
            auto_lcd = true,
          }
        },
      },
    },
}

require'telescope'.load_extension('project')
require'telescope'.load_extension('repo')


local builtin = require('telescope.builtin')

vim.keymap.set('n', '<c-f>', function() builtin.find_files({ hidden = true}) end , {})
vim.keymap.set('n', '<Space><Space>', builtin.oldfiles, {})
vim.keymap.set('n', '<Space>fg', builtin.live_grep, {})
vim.keymap.set('n', '<Space>fh', builtin.help_tags, {})


vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
vim.keymap.set("n", "<leader>p", ":lua require('telescope').extensions.project.project{}<CR>")
vim.keymap.set("n", "<leader>r", ":lua require('telescope').extensions.repo.list{fd_opts=[[--ignore-file=myignorefile]]}<CR>")

