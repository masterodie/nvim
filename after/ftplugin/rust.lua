vim.keymap.set("n", "<leader>ds", vim.cmd.RustDebuggables, { desc= "Start Debugging"})
vim.keymap.set("n", "<leader>dl", vim.cmd.RustLastDebug, { desc= "Start Debugging"})

vim.cmd.compiler('cargo')
