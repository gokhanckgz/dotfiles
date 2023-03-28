require('telescope').setup()

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<c-f>', function() builtin.find_files({ hidden = true}) end , {})
vim.keymap.set('n', '<Space><Space>', builtin.oldfiles, {})
vim.keymap.set('n', '<Space>fg', builtin.live_grep, {})
vim.keymap.set('n', '<Space>fh', builtin.help_tags, {})


vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

