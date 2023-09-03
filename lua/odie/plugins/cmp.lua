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
      {
        "tzachar/cmp-fuzzy-path",
        dependencies = { "tzachar/fuzzy.nvim" },
      },
      { "onsails/lspkind.nvim" },
    },
    config = function()
      require("odie.plugins.plugin-configs.nvim-cmp")
    end,
  },
}
