return {
  { "elkowar/yuck.vim", lazy = false },
  {
    "simrat39/rust-tools.nvim",
    ft = { "rust", "cpp" },
    opts = function()
      return require("odie.plugins.plugin-opts.rust-tools")
    end,
    dependencies = {
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap",
      "nvim-telescope/telescope.nvim",
    },
  },
  {
    "saecki/crates.nvim",
    tag = "v0.3.0",
    event = { "BufRead Cargo.toml" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
    config = function()
      require("odie.plugins.plugin-configs.crates")
    end,
  },
  {
    "Civitasv/cmake-tools.nvim",
    lazy = false,
    opts = require 'odie.plugins.plugin-opts.cmake-tools',
  },
}
