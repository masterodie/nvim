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

