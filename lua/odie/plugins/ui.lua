return {
  {
    "nvim-tree/nvim-web-devicons",
    opts = {},
    config = function(_, opts)
      require("nvim-web-devicons").setup(opts)
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    cond = not vim.g.started_by_firenvim,
    opts = require("odie.plugins.plugin-opts.noice"),
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  {
    "rcarriga/nvim-notify",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    opts = require("odie.plugins.plugin-opts.nvim-notify"),
  },
  {
    "goolord/alpha-nvim",
    event = "ColorScheme",
    dependencies = { "nvim-web-devicons" },
    cond = not vim.g.vscode,
    opts = function()
      return require("odie.plugins.plugin-opts.alpha-nvim")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "ColorScheme",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = require("odie.plugins.plugin-opts.lualine"),
  },
}
