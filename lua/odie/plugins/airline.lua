local g = vim.g
g.airline_powerline_fonts = 1
g.airline_theme = 'molokai'
--g.airline_symbols = {}
vim.api.nvim_set_var('airline#extensions#hunks#enabled', 0)
vim.api.nvim_set_var('airline#extensions#hunks#non_zero_only', 1)
vim.api.nvim_set_var('airline#extensions#virtualenv#enabled', 1)
vim.api.nvim_set_var('airline#extensions#nerdtree#enabled', 1)
vim.api.nvim_set_var('airline#extensions#lsp#enabled', 1)
vim.api.nvim_set_var('airline#extensions#whitespace#enabled', 0)
vim.api.nvim_set_var('airline#extensions#whitespace#trailing_format',  '●[%s]')
vim.api.nvim_set_var('airline#extensions#whitespace#trailing_format',  '○[%s]')
--g.airline#extensions#hunks#enabled = 0
--g.airline#extensions#hunks#non_zero_only = 1
--g.airline#extensions#virtualenv#enabled = 1
--g.airline#extensions#ale#enabled = 1
--g.airline#extensions#lsp#enabled = 0
--g.airline#extensions#whitespace#enabled = 0
--g.airline#extensions#whitespace#trailing_format = '●[%s]'
--g.airline#extensions#whitespace#mixed_indent_format = '○[%s]'
