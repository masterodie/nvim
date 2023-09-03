return {
  {
    -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/playground",
      "RRethy/nvim-treesitter-endwise",
      "windwp/nvim-ts-autotag",
    },
    opts = require("odie.plugins.plugin-opts.nvim-treesitter"),
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
    build = ":TSUpdate",
  },
}
