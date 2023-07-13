vim.opt.whichwrap:append("b,s,<,>,[,],h,l")
vim.opt.backspace = "indent,eol,start"

vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smarttab = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.history = 1000
vim.opt.undolevels = 1000

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.opt.startofline = false

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.visualbell = true
vim.opt.errorbells = false

vim.opt.showcmd = true

vim.opt.textwidth = 80
vim.opt.colorcolumn = { 80 }
vim.opt.cursorline = true

vim.opt.termguicolors = true

vim.opt.undodir = vim.fn.stdpath("state") .. "/undo"
vim.opt.undofile = true

vim.opt.backupdir = vim.fn.stdpath("state") .. "/backup"
vim.opt.backup = true

vim.opt.mouse = "a"
vim.opt.selectmode = "mouse"
vim.opt.mousemoveevent = true

vim.opt.timeoutlen = 150

vim.opt.list = true
vim.opt.listchars:append("eol:↴")
vim.opt.listchars:append("space:.")

vim.opt.spell = true
vim.opt.spelllang = { "de", "en_us" }
