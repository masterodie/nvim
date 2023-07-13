return {
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    keys = {
      { "<leader>xx", vim.cmd.TroubleToggle, "Open Trouble"},
    },
  },
}
