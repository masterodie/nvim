return {
  {
    "aserowy/tmux.nvim",
    lazy = false,
    cond = not vim.g.vscode,
    opts = require("odie.plugins.configs.tmux").opts,
    keys = require('odie.plugins.configs.tmux').keys,
  },
}
