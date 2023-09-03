local keymaps = require("odie.utils.keymaps")

keymaps.nmap({"<leader>ds", vim.cmd.CMakeDebug, { desc= "Start Debugging"} })
keymaps.nmap({"<leader>cb", vim.cmd.CMakeBuild, { desc = "Build Project" } })
keymaps.nmap({"<leader>cR", vim.cmd.CMakeRun, { desc = "Run Project" } })

