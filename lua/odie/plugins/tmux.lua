return {
  {
    "aserowy/tmux.nvim",
    lazy = false,
    cond = not vim.g.vscode,
    opts = require("odie.plugins.plugin-opts.tmux"),
    config = function(_, opts)
      local ok, tmux = pcall(require, "tmux")
      if ok then
        tmux.setup(opts)
      end
    end,
    keys = function()
      local ok, tmux = pcall(require, "tmux")
      if not ok then
        return {}
      end
      return {
        { "<C-h>", tmux.move_left,     desc = "Window left" },
        { "<C-j>", tmux.move_bottom,   desc = "Window bottom" },
        { "<C-k>", tmux.move_top,      desc = "Window top" },
        { "<C-l>", tmux.move_right,    desc = "Window right" },
        { "<M-h>", tmux.resize_left,   desc = "Resize window left" },
        { "<M-j>", tmux.resize_bottom, desc = "Resize window bottom" },
        { "<M-k>", tmux.resize_top,    desc = "Resize window top" },
        { "<M-l>", tmux.resize_right,  desc = "Resize window right" },
      }
    end,
  },
}
