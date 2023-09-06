return {
  {
    "nvim-tree/nvim-web-devicons",
    opts = {},
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    cond = not vim.g.started_by_firenvim,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
      "nvim-telescope/telescope.nvim",
    },
    opts = require("odie.plugins.configs.noice").opts,
    setup = function(plugin, opts)
      require("telescope").load_extension("noice")
      plugin.setup(opts)
    end,
  },
  {
    "rcarriga/nvim-notify",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    opts = require("odie.plugins.configs.nvim-notify").opts,
  },
  {
    "goolord/alpha-nvim",
    event = "ColorScheme",
    dependencies = { "nvim-web-devicons" },
    cond = not vim.g.vscode,
    opts = require("odie.plugins.configs.alpha-nvim").opts,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "ColorScheme",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = require("odie.plugins.configs.lualine").opts,
  },
}
