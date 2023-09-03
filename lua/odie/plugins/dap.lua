return {
  {
    "mfussenegger/nvim-dap",
    cmd = { "DapShowLog", "DapContinue", "DapToggleBreakpoint" },
    dependencies = {
      "williamboman/mason.nvim",
      "jay-babu/mason-nvim-dap.nvim",
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-telescope/telescope-dap.nvim",
    },
    cond = not vim.g.vscode,
    config = function(_, opts)
      require("odie.plugins.plugin-configs.nvim-dap")(_, opts)
    end,
    keys = {
      { "<leader>db", vim.cmd.DapToggleBreakpoint, desc = "Toggle Debug Breakpoint" },
      { "<leader>dc", vim.cmd.DapContinue,         desc = "Debug Continue" },
      { "<leader>dn", vim.cmd.DapStepOver,         desc = "Debug Step Over" },
      { "<leader>di", vim.cmd.DapStepIn,           desc = "Debug Step In" },
      { "<leader>do", vim.cmd.DapStepOut,          desc = "Debug Step Out" },
      { "<leader>dt", vim.cmd.DapTerminate,        desc = "Debug Terminate" },
      { "<leader>dr", vim.cmd.DapToggleRepl,       desc = "Debug Toggle REPL" },
    },
  },
  {

    "mfussenegger/nvim-dap-python",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = { "nvim-treesitter" },
    opts = {},
  },
  {
    "nvim-telescope/telescope-dap.nvim",
    config = function()
      require("telescope").load_extension("dap")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    opts = {},
    config = function(plug, opts)
      require("odie.plugins.plugin-configs.nvim-dap")(plug, opts)
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
          desc = "Toggle Debug UI",
        },
      }
    end,
  },
  {
    "mason-nvim-dap.nvim",
    version = "2.*",
    cmd = { "DapInstall", "DapUninstall" },
    opts = {
      handlers = {},
    },
  },
}
