return {
  { "elkowar/yuck.vim", lazy = false },
  {
    "simrat39/rust-tools.nvim",
    ft = { "rust", "cpp" },
    opts = require("odie.plugins.configs.rust-tools").opts,
    config = require("odie.plugins.configs.rust-tools").config,
    keys = require("odie.plugins.configs.rust-tools").keys,
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
    opts = require("odie.plugins.configs.crates").opts,
    config = require("odie.plugins.configs.crates").config,
    keys = require("odie.plugins.configs.crates").keys,
  },
  {
    "Civitasv/cmake-tools.nvim",
    ft = { "cpp", "c" },
    opts = require("odie.plugins.configs.cmake-tools").opts,
    keys = require("odie.plugins.configs.cmake-tools").keys,
  },
}
