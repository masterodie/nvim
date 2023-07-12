return {
  {
    "mfussenegger/nvim-dap",
    cmd = { "DapShowLog", "DapContinue", "DapToggleBreakpoint" },
    dependencies = {
      "mason-nvim-dap.nvim",
		"rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-telescope/telescope-dap.nvim",
    },
    cond = not vim.g.vscode,
    config = function()
      require("nvim-dap-virtual-text").setup()

      local colors = require('gruvbox.palette').colors

      vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg =colors.neutral_red, bg = colors.dark0})
      vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = colors.neutral_blue, bg = colors.dark0})
      vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = colors.bright_green, bg = colors.dark0})

      vim.fn.sign_define(
        "DapBreakpoint",
        { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "DapBreakpoint" }
      )
      vim.fn.sign_define(
        "DapBreakpointCondition",
        { text = "ﳁ", texthl = "DapBreakpoint", linehl = "", numhl = "DapBreakpoint" }
      )
      vim.fn.sign_define(
        "DapBreakpointRejected",
        { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "DapBreakpoint" }
      )
      vim.fn.sign_define(
        "DapLogPoint",
        { text = "", texthl = "DapLogPoint", linehl = "", numhl = "DapLogPoint" }
      )
      vim.fn.sign_define(
        "DapStopped",
        { text = "", texthl = "DapStopped", linehl = "", numhl = "DapStopped" }
      )
    end,
    keys = {
      { "<leader>db", vim.cmd.DapToggleBreakpoint, desc = "[D]ebug [B]reakpoint" },
      { "<leader>dc", vim.cmd.DapContinue,         desc = "[D]ebug [C]ontinue" },
      { "<leader>dn", vim.cmd.DapStepOver,         desc = "[D]ebug step o[V]er" },
      { "<leader>di", vim.cmd.DapStepIn,           desc = "[D]ebug step [I]n" },
      { "<leader>do", vim.cmd.DapStepOut,          desc = "[D]ebug step [O]ut" },
      { "<leader>dt", vim.cmd.DapTerminate,        desc = "[D]ebug [T]erminate" },
      { "<leader>dr", vim.cmd.DapToggleRepl,       desc = "[D]ebug Toggle [R]EPL" },
    },
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = { "nvim-treesitter" },
  },
  {
    "nvim-telescope/telescope-dap.nvim",
    config = function()
      require("telescope").load_extension("dap")
    end,
  },
}

