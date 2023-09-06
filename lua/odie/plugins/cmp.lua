return {
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-emoji",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "saecki/crates.nvim",
      "tzachar/cmp-fuzzy-path",
      "onsails/lspkind.nvim",
    },
    config = require("odie.plugins.configs.nvim-cmp").config,
  },
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "1.*",
    config = require("odie.plugins.configs.luasnip").config,
  },
  {
    "tzachar/cmp-fuzzy-path",
    dependencies = { "tzachar/fuzzy.nvim" },
  },
}
