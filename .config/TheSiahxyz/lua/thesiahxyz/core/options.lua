vim.g.have_nerd_font = true
vim.opt.backup = false
vim.opt.breakindent = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.inccommand = "split"
vim.opt.incsearch = true
vim.opt.isfname:append("@-@")
vim.opt.list = true
vim.opt.listchars = { tab = "  ", trail = " ", nbsp = " " }
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.shiftwidth = 4
vim.opt.showmode = false
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.timeoutlen = 500
vim.opt.updatetime = 500
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.config/vim/undo"
vim.opt.wrap = false
