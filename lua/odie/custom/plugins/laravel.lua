return {
  {
    "adalessa/laravel.nvim",
    lazy = false,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim",
      "tpope/vim-dotenv",
      "MunifTanjim/nui.nvim",
    },
    event = { "BufReadPre", "BufNewFile" },
    cond = not vim.g.vscode,
    cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
    keys = {
      { "<leader>la", ":Laravel artisan<cr>" },
      { "<leader>lr", ":Laravel routes<cr>" },
      {
        "<leader>lt",
        function()
          require("laravel.tinker").send_to_tinker()
        end,
        mode = "v",
        desc = "Laravel Application Routes",
      },
    },
    config = function()
      require("laravel").setup()
      require("telescope").load_extension("laravel")
    end,
  },
}
