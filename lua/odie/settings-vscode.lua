local o = vim.opt
local g = vim.g

o.autoindent = true
o.smartindent = true

vim.api.nvim_exec(
	[[
augroup odie_settings
  autocmd!
  autocmd BufEnter * silent! set autoindent smartindent
augroup END
]],
	true
)
