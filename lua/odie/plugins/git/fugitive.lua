return {
  {
    "tpope/vim-fugitive",
    cmd = { "Git" },
    cond = not vim.g.vscode,
    dependencies = {
      "tpope/vim-rhubarb",
    },
    keys = {
      { "<leader>gc", "<cmd>Git commit<cr>", desc = "Create [Git] [C]omit" },
      { "<leader>gs", "<cmd>Nerdtree git_status<cr>", desc = "Show [Git] [S]tatus" },
    },
  },
}
