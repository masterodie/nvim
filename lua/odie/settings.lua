local indent_size = 4

vim.opt.termguicolors = true

vim.opt.whichwrap:append("b,s,<,>,[,],h,l")
vim.opt.backspace = "indent,eol,start"

vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.shiftwidth = indent_size
vim.opt.tabstop = indent_size
vim.opt.softtabstop = indent_size

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.scrolloff = 8
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.startofline = false

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.visualbell = true
vim.opt.errorbells = false

vim.opt.textwidth = 80
vim.opt.colorcolumn = { 80 }

vim.opt.cursorline = true

vim.opt.undodir = vim.fn.stdpath("state") .. "/undo"
vim.opt.undofile = true
vim.opt.backupdir = vim.fn.stdpath("state") .. "/backup"
vim.opt.backup = true

vim.opt.mouse = "a"
vim.opt.selectmode = "mouse"
vim.opt.mousemoveevent = true

vim.opt.timeoutlen = 300

vim.opt.list = true
vim.opt.listchars:append("eol:↴")
vim.opt.listchars:append("space:.")

vim.opt.spell = true
vim.opt.spelllang = { "de", "en_us" }
vim.opt.helplang = "de"

vim.opt.laststatus = 3

vim.opt.conceallevel = 0
vim.opt.concealcursor = "nc"

vim.opt.foldlevel = 0

vim.diagnostic.config({
    virtual_text = true,
    severity_sort = true,
})
