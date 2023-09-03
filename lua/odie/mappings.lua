vim.keymap.set("n", "<leader><leader>x", function()
  vim.cmd([[source %]])
end, { desc = "Source current file" })

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

local wk = require("which-key")

wk.register({
  ["<leader>f"] = { name = "+file" },
  ["<leader>p"] = { name = "+package" },
  ["<leader>c"] = { name = "+code" },
  ["<leader>x"] = { name = "+diagnostics" },
  ["<leader>d"] = { name = "+debug" },
  ["<leader>g"] = { name = "+git" },
  ["<leader>w"] = { name = "+workspace" },
  ["<leader>r"] = { name = "+refactor" },
}, {})
