vim.keymap.set("n", "<C-s>", vim.cmd.write, { desc = "Save File" })

vim.keymap.set("n", "<leader>bn", vim.cmd.bnext, { desc = "[N]ext [B]uffer" })
vim.keymap.set("n", "<leader>bp", vim.cmd.bprevious, { desc = "[P]revious [B]uffer" })

vim.keymap.set("n", "<leader>ws", "<C-w>s", { desc = "Split Window Horizontal" })
vim.keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split Window Vertical" })
vim.keymap.set("n", "<leader>ww", "<C-w>w", { desc = "Move between windows" })
vim.keymap.set("n", "<leader>wt", "<C-w>T", { desc = "Move between tabs" })
vim.keymap.set("n", "<leader>wd", "<C-w>c", { desc = "Close window" })

vim.keymap.set('n', "<leader>bb", vim.cmd.bnext, { desc = "Next buffer" })

--[[
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left Window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to bottom Window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to top Window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right Window" })

vim.keymap.set("n", "<M-h>", "2<C-w><", { desc = "Resize window left" })
vim.keymap.set("n", "<M-j>", "2<C-w>+", { desc = "Resize window up" })
vim.keymap.set("n", "<M-k>", "2<C-w>-", { desc = "Resize window down" })
vim.keymap.set("n", "<M-l>", "2<C-w>>", { desc = "Resize window right" })
]]
