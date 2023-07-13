return {
  {
    -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function(_, opts)
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.blade = {
        install_info = {
          url = "https://github.com/EmranMR/tree-sitter-blade", -- local path or git repo
          files = { "src/parser.c" }, -- note that some parsers also require src/scanner.c or src/scanner.cc
          -- optional entries:
          branch = "main", -- default branch in case of git repo if different from master
          generate_requires_npm = false, -- if stand-alone parser without npm dependencies
          requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
        },
        filetype = "blade",
      }
      require("nvim-treesitter.configs").setup(opts)
    end,
    opts = function()
      return {
        ensure_installed = {
          "html",
          "vim",
          "regex",
          "lua",
          "bash",
          "markdown",
          "markdown_inline",
          "vimdoc",
          "query",
          "blade",
          "jsonc",
          "php",
          "phpdoc",
        },
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
        },
        endwise = {
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
      }
    end,
    build = ":TSUpdate",
  },
}
