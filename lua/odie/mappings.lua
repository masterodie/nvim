local k = require("odie.utils.keymaps")

k.nmap({ "<leader>xx", vim.diagnostic.open_float })
k.nmap({ "<leader>xq", vim.diagnostic.setloclist })
k.nmap({
  "<leader><leader>x",
  function()
    vim.cmd([[source %]])
  end,
})

k.nmap({ "<leader>ws", vim.cmd.split })
k.nmap({ "<leader>wv", vim.cmd.vsplit })
k.nmap({ "<leader>wc", vim.cmd.close })
--k.nmap({ '<C-h>', '<C-w>h' })
--k.nmap({ '<C-l>', '<C-w>l' })
--k.nmap({ '<C-j>', '<C-w>j' })
--k.nmap({ '<C-k>', '<C-w>k' })

k.nmap({ "<leader>P", vim.cmd.Lazy })

local group = vim.api.nvim_create_augroup("UserKeymaps", {})

vim.api.nvim_create_autocmd("LspAttach", {
  group = group,
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    k.nmap({ "gD", vim.lsp.buf.declaration, opts })
    k.nmap({ "gd", vim.lsp.buf.definition, opts })
    k.nmap({ "K", vim.lsp.buf.hover, opts })
    k.nmap({ "gi", vim.lsp.buf.implementation, opts })
    k.nmap({ "<leader>k", vim.lsp.buf.signature_help, opts })
    k.nmap({ "<space>wa", vim.lsp.buf.add_workspace_folder, opts })
    k.nmap({ "<space>wr", vim.lsp.buf.remove_workspace_folder, opts })
    k.nmap({
      "<space>wl",
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      opts,
    })
    k.nmap({ "<space>D", vim.lsp.buf.type_definition, opts })
    k.nmap({ "<space>rn", vim.lsp.buf.rename, opts })
    k.map({ {"n", "v"}, "<space>ca", vim.lsp.buf.code_action, opts })
    k.nmap({ "gr", vim.lsp.buf.references, opts })
    k.nmap({
      "<space>fm",
      function()
        vim.lsp.buf.format({ async = true })
      end,
      opts,
    })
  end,
})
