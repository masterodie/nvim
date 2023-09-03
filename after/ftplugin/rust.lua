local keymaps = require("odie.utils.keymaps")

keymaps.nmap({"<leader>ds", vim.cmd.RustDebuggables, { desc= "Start Debugging"} })

vim.cmd.compiler('cargo')
