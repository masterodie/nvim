return {
  {
    -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/playground",
      "RRethy/nvim-treesitter-endwise",
      "windwp/nvim-ts-autotag",
    },
    opts = {
      ensure_installed = {
        "vim",
        "regex",
        "lua",
        "bash",
        "markdown",
        "markdown_inline",
        "vimdoc",
        "query",
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      textobjects = {
        select = {
          enable = true,
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = {
              query = "@function.outer",
              desc = "Select outer part of a function region",
            },
            ["if"] = {
              query = "@function.inner",
              desc = "Select outer part of a function region",
            },
            ["ac"] = { query = "@class.outer", "Select outer part of a class region" },
            ["ic"] = {
              query = "@class.inner",
              desc = "Select inner part of a class region",
            },
            ["as"] = {
              query = "@scope",
              query_group = "locals",
              desc = "Select language scope",
            },
          },
        },
      },
      incremental_selection = {
        enable = true,
      },
      endwise = {
        enable = true,
      },
      autotag = {
        enable = true,
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
    build = ":TSUpdate",
  },
}
