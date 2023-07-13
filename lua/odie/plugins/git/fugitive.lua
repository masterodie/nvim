return {
  {
    "tpope/vim-fugitive",
    cmd = { "Git" },
    cond = not vim.g.vscode,
    dependencies = {
      "tpope/vim-rhubarb",
    },
    keys = {
      { "<leader>gc", function() vim.cmd.Git("commit") end, desc = "Create Git Commit" },
      { "<leader>gs", vim.cmd.Git, desc = "Show Git Status" },
      { "<leader>gP", function() vim.cmd.Git("push") end, desc = "Git Push" },
    },
  },
}
