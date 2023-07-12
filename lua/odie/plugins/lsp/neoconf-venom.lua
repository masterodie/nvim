return {
  {
    "rafi/neoconf-venom.nvim",
    dependencies = { "plenary.nvim" },
    config = function()
      require("venom").setup()
    end,
  },
}
