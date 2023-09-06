return {

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-lua/plenary.nvim",
    },
    event = { "VeryLazy" },
    opts = require("odie.plugins.configs.telescope").opts,
    keys = require("odie.plugins.configs.telescope").keys,
  },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  {
    "tzachar/fuzzy.nvim",
    dependencies = { "nvim-telescope/telescope-fzf-native.nvim" },
  },
}
