return {
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    cond = not vim.g.vscode,
    opts = function()
      return {
        providers = {
          "lsp",
          "treesitter",
          "regex",
        },
        large_file_cutoff = 2000,
        large_file_overrides = {
          providers = { "lsp" },
        },
      }
    end,
    config = function(_, opts)
      require("illuminate").configure(opts)
    end,
  },
}

