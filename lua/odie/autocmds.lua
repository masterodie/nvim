local group = vim.api.nvim_create_augroup("database", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = { "FileType sql,mysql,plsql" },
  command = function()
    require("cmp").setup.buffer({ sources = { { name = "vim-dadbod-completion" } } })
  end,
})
