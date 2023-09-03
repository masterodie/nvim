return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "folke/neoconf.nvim",
      "folke/neodev.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("odie.autocmds")
    end,
  },
  {
    "williamboman/mason.nvim",
    version = "1.*",
    cmd = { "Mason" },
    opts = require("odie.plugins.plugin-opts.mason"),
  },
  {
    "williamboman/mason-lspconfig.nvim",
    version = "1.*",
    opts = require("odie.plugins.plugin-opts.mason-lspconfig"),
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "Trouble", "TroubleToggle" },
    opts = {},
  },
  {
    "creativenull/efmls-configs-nvim",
    dependencies = { "neovim/nvim-lspconfig" },
  },
  {
    "folke/neoconf.nvim",
    cmd = "Neoconf",
    dependencies = {
      "rafi/neoconf-venom.nvim",
    },
    opts = {},
  },
  {
    "rafi/neoconf-venom.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("venom").setup()
    end,
  },
  {
    "folke/neodev.nvim",
    opts = {},
  },
}
