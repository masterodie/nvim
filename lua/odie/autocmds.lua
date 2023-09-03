local group = vim.api.nvim_create_augroup("UserKeymaps", {})

vim.api.nvim_create_autocmd("LspAttach", {
  group = group,
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto Defninition" })
    vim.keymap.set(
      "n",
      "gi",
      vim.lsp.buf.implementation,
      { desc = "Goto Implementation" }
    )
    vim.keymap.set(
      "n",
      "gtd",
      vim.lsp.buf.type_definition,
      { desc = "Show Type Definition" }
    )
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Goto References" })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, { desc = "Rename" })
    vim.keymap.set(
      { "n", "v" },
      "<space>ca",
      vim.cmd.CodeActionMenu,
      { desc = "Code action" }
    )
    vim.keymap.set("n", "<space>fm", function()
      vim.lsp.buf.format({ async = true })
    end, { desc = "Format Code" })
  end,
})
