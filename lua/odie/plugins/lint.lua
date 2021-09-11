require('lint').linters_by_ft = {
  python = {'pylint',},
  javascript = {'eslint',},
  typescript = {'eslint',},
  vue = {'eslint',},
}

vim.api.nvim_exec([[
augroup odie_lint
  autocmd!
  autocmd BufEnter,InsertLeave,BufWritePost * lua require('lint').try_lint()
augroup END
]], true)

