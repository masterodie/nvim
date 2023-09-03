local k = require("odie.utils.keymaps")

local mapopts = function(desc)
  return k.options({ desc = desc })
end

k.nmap({ "<leader>xx", vim.diagnostic.open_float, mapopts("Open floating diagnostics") })
k.nmap({ "<leader>xq", vim.diagnostic.setloclist, mapopts("Set Locationlost diagnostics") })
k.nmap({
  "<leader><leader>x",
  function()
    vim.cmd([[source %]])
  end,
  mapopts("Source current file")
})

-- k.nmap({ "<leader>ws", vim.cmd.split, mapopts("Split Window Horizontal") })
-- k.nmap({ "<leader>wv", vim.cmd.vsplit, mapopts("Split Window Vertical") })
-- k.nmap({ "<leader>wc", vim.cmd.close, mapopts("Close Window") })
--k.nmap({ '<C-h>', '<C-w>h' })
--k.nmap({ '<C-l>', '<C-w>l' })
--k.nmap({ '<C-j>', '<C-w>j' })
--k.nmap({ '<C-k>', '<C-w>k' })

k.nmap({ "<leader>P", vim.cmd.Lazy, mapopts("Open Lazy Plugin manager") })

local wk = require("which-key")

wk.register({
  ["<leader>f"] = { name = "+file"},
  ["<leader>p"] = { name = "+package"},
  ["<leader>c"] = { name = "+code"},
  ["<leader>x"] = { name = "+diagnostics"},
  ["<leader>d"] = { name = "+debug"},
  ["<leader>g"] = { name = "+git"},
  ["<leader>w"] = { name = "+workspace"},
}, {})
