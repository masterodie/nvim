return {
  {
    "tpope/vim-fugitive",
    cmd = { "Git" },
    cond = not vim.g.vscode,
    dependencies = {
      "tpope/vim-rhubarb",
    },
    keys = require('odie.plugins.configs.fugitive').keys,
  },
  {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = require("odie.plugins.configs.gitsigns").opts,
  },
}
