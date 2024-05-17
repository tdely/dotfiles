vim.opt.guicursor = 'a:block,r:hor25'

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.mouse = ''

vim.opt.statusline = [[%f[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L %P]]
vim.opt.cmdheight = 2

vim.opt.encoding = 'UTF-8'
vim.opt.fenc = 'UTF-8'

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv('HOME') .. '/.config/nvim/undodir'
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append '@-@'

vim.opt.updatetime = 50

vim.opt.colorcolumn = '80'

vim.g.mapleader = ' '
vim.opt.timeoutlen = 500

vim.cmd([[match ErrorMsg '\s\+$']])
