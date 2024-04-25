vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.swapfile = true
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.directory = os.getenv("HOME") .. "/.vim/swap"
vim.opt.undodir = os.getenv("HOME") .. "/.vom/undo"

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- vim.opt.colorcolumn = "80"

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
