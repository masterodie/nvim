return {
  {
    "ethanholz/nvim-lastplace",
    event = { "BufReadPre" },
    opts = {},
  },
  {
    "tpope/vim-surround",
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "tpope/vim-repeat",
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "tpope/vim-sleuth",
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "echasnovski/mini.move",
    event = { "BufReadPre", "BufNewFile" },
    opts = require("odie.plugins.plugin-opts.minimove"),
  },
  {
    "echasnovski/mini.pairs",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    cond = not vim.g.vscode,
    opts = require("odie.plugins.plugin-opts.vim-illuminate"),
    config = function(_, opts)
      require("illuminate").configure(opts)
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    cond = not vim.g.vscode,
    opts = require("odie.plugins.plugin-opts.indent-blankline"),
  },
  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" },
    cond = not vim.g.vscode,
    opts = require("odie.plugins.plugin-opts.nvim-colorizer"),
  },
  {
    "utilyre/sentiment.nvim",
    version = "*",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },
  {
    "numToStr/Comment.nvim",
    opts = {},
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "kosayoda/nvim-lightbulb",
    event = { "BufReadPre", "BufNewFile" },
    opts = { autocmd = { enabled = true } },
  },
  {
    "weilbith/nvim-code-action-menu",
    event = { "BufReadPre", "BufNewFile" },
    cmd = "CodeActionMenu",
  },
}
