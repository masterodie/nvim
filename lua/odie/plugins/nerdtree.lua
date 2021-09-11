local g = vim.g
g.NERDTreeIgnore={ 'node_modules$', '\\.git$', '\\.log$', '\\.venv$', '__pycache__$', '\\~$' }
g.NERDTreeShowHidden=1

vim.api.nvim_exec([[
augroup odie_nerdtree
  autocmd!
  "autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 | let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
  "autocmd StdinReadPre * let s:std_in=1
  "autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | execute 'NERDTreeToggle' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

  " Exit Vim if NERDTree is the only window remaining in the only tab.
  autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
augroup END
]], true)

