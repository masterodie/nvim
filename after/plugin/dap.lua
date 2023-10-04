local dapui = require("dapui")
local dap = require("dap")
dapui.setup()

require("dap.ext.vscode").load_launchjs(nil, { rt_lldb = { "rust" } })

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "DapBreakpoint" })
vim.fn.sign_define(
    "DapBreakpointCondition",
    { text = "ﳁ", texthl = "DapBreakpoint", linehl = "", numhl = "DapBreakpoint" }
)
vim.fn.sign_define(
    "DapBreakpointRejected",
    { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "DapBreakpoint" }
)
vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DapLogPoint", linehl = "", numhl = "DapLogPoint" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "", numhl = "DapStopped" })

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

vim.keymap.set("n", "<leader>db", vim.cmd.DapToggleBreakpoint, { desc = "Toggle Debug Breakpoint" })
vim.keymap.set("n", "<leader>dc", vim.cmd.DapContinue, { desc = "Debug Continue" })
vim.keymap.set("n", "<leader>dn", vim.cmd.DapStepOver, { desc = "Debug Step Over" })
vim.keymap.set("n", "<leader>di", vim.cmd.DapStepIn, { desc = "Debug Step In" })
vim.keymap.set("n", "<leader>do", vim.cmd.DapStepOut, { desc = "Debug Step Out" })
vim.keymap.set("n", "<leader>dt", vim.cmd.DapTerminate, { desc = "Debug Terminate" })
vim.keymap.set("n", "<leader>dr", vim.cmd.DapToggleRepl, { desc = "Debug Toggle REPL" })
vim.keymap.set("n", "<leader>du", function()
    require("dapui").toggle({})
end, { desc = "Toggle Debug UI" })
