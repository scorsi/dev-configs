local opt = vim.opt

opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.smartindent = true

opt.number = true
opt.relativenumber = true

opt.splitright = true
opt.splitbelow = true

opt.backspace = "indent,eol,start"

opt.swapfile = true
opt.backup = false
opt.undofile = true
opt.directory = os.getenv("HOME") .. "/.vim/swap"
opt.undodir = os.getenv("HOME") .. "/.vom/undo"

opt.termguicolors = true

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50

-- vim.opt.colorcolumn = "80"

