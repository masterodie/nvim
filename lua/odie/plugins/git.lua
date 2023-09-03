return {
  {
    "tpope/vim-fugitive",
    cmd = { "Git" },
    cond = not vim.g.vscode,
    dependencies = {
      "tpope/vim-rhubarb",
    },
    keys = {
      {
        "<leader>gc",
        function()
          vim.cmd.Git("commit")
        end,
        desc = "Create Git Commit",
      },
      { "<leader>gs", vim.cmd.Git, desc = "Show Git Status" },
      {
        "<leader>gP",
        function()
          vim.cmd.Git("push")
        end,
        desc = "Git Push",
      },
    },
  },
  {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = require("odie.plugins.plugin-opts.gitsigns"),
  },
}
