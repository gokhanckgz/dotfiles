vim.g.mapleader = ' '
vim.g.maplocalleader = ';'

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

-- use spaces for tabs and whatnot
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

-- disable autofold function
vim.opt.foldlevelstart = 20

-- set relative number
vim.wo.relativenumber = true
vim.wo.number = true

-- disable swapfile
vim.cmd [[ set noswapfile ]]
