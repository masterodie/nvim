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
  },
  {
    "williamboman/mason.nvim",
    version = "1.*",
    cmd = { "Mason" },
    opts = require("odie.plugins.configs.mason").opts,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    version = "1.*",
    opts = require("odie.plugins.configs.mason-lspconfig").opts,
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "Trouble", "TroubleToggle" },
    opts = {},
    keys = {
      { "<leader>xx", vim.cmd.TroubleToggle, desc = "Open diagnostics" },
    },
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
    config = function(_, _)
      require("venom").setup()
    end,
  },
  {
    "folke/neodev.nvim",
    opts = {},
  },
}
