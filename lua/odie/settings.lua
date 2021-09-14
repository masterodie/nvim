require("odie.utils")

local o = vim.opt
local g = vim.g

local vim_path = vim.fn.stdpath("config")
local vim_data_path = vim.fn.stdpath("data")

o.whichwrap:append("b,s,<,>,[,],h,l")
o.completeopt = "menuone,noselect"
o.backspace = "indent,eol,start"
o.autoindent = true
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2
o.expandtab = true
o.smarttab = true
o.wildmenu = true
o.wildmode = "list:longest"
o.hlsearch = true
o.ignorecase = true
o.smartcase = true
o.incsearch = true
o.laststatus = 2
o.history = 1000
o.scrolloff = 5
o.sidescrolloff = 5
o.undolevels = 1000
o.startofline = false
o.hidden = true
o.autoread = true
o.backup = true
o.cpoptions:append("d")
o.number = true
o.visualbell = true
o.errorbells = false
o.showcmd = true
o.colorcolumn = "80"
o.timeoutlen = 300
o.termguicolors = true
o.relativenumber = true
o.cursorline = true
o.mouse = "a"
o.selectmode = "mouse"
o.undofile = true

local backupdir = vim_data_path .. "/backup"
local undodir = vim_data_path .. "/undo"
local directory = vim_data_path .. "/tmp"

if not (isdir(backupdir)) then
	os.execute("mkdir " .. backupdir)
end

if not (isdir(undodir)) then
	os.execute("mkdir " .. undodir)
end

if not (isdir(directory)) then
	os.execute("mkdir " .. directory)
end

o.backupdir = backupdir
o.undodir = undodir
o.directory = directory

g.mapleader = " "
g.maplocalleader = ","
g.python3_host_prog = "/usr/bin/python"
g.python_host_prog = "/usr/bin/python2"

g.gruvbox_italic = 1
g.gruvbox_contrast_dark = "hard"

g.sonokai_style = "shusia"
g.sonokai_enable_italic = 1
g.sonokai_disable_italic_comment = 1

vim.cmd("colorscheme sonokai")

vim.api.nvim_exec(
	[[
augroup odie_settings
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  autocmd BufWritePre * :%s/\s\+$//e
augroup END
]],
	true
)
