return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    event = { "ColorScheme" },
    branch = "v3.x",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-tree/nvim-web-devicons" },
      { "MunifTanjim/nui.nvim" },
    },
    opts = require("odie.plugins.configs.neo-tree").opts,
    keys = require("odie.plugins.configs.neo-tree").keys,
  },
}
