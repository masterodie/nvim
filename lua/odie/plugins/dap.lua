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
    config = require("odie.plugins.configs.nvim-dap").config,
    keys = require('odie.plugins.configs.nvim-dap').keys,
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
    "mason-nvim-dap.nvim",
    version = "2.*",
    cmd = { "DapInstall", "DapUninstall" },
    opts = {
      handlers = {},
    },
  },
}
