vim.keymap.set("n", "<leader>ds", vim.cmd.CMakeDebug, { desc= "Start Debugging"})
vim.keymap.set("n", "<leader>cb", vim.cmd.CMakeBuild, { desc = "Build Project" })
vim.keymap.set("n", "<leader>cR", vim.cmd.CMakeRun, { desc = "Run Project" })

