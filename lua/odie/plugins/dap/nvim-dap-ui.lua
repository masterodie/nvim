return {
  {
    "rcarriga/nvim-dap-ui",
    opts = {},
    config = function(_, opts)
      local dap = require("dap")
      local dapui = require("dapui")

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      dapui.setup(opts)
    end,
    keys = function()
      local ok, _ = pcall(require, "dapui")
      if not ok then
        return {}
      end
      local dapui = require("dapui")
      return {
        {
          "<leader>du",
          function()
            dapui.toggle()
          end,
          desc = "[D]ebug [U]I Toggle",
        },
      }
    end,
  },
}
