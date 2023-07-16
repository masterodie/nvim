return {
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
      "nvim-lua/plenary.nvim"
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
