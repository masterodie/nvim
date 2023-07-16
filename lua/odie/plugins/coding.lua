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
    "echasnovski/mini.move",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      mappings = {
        -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
        left = "<M-H>",
        right = "<M-L>",
        down = "<M-J>",
        up = "<M-K>",

        -- Move current line in Normal mode
        line_left = "<M-H>",
        line_right = "<M-L>",
        line_down = "<M-J>",
        line_up = "<M-K>",
      },
    },
  },
  {
    "echasnovski/mini.pairs",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      mappings = {},
    },
  },
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
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    cond = not vim.g.vscode,
    opts = function()
      return {
        char = "┊",
        show_trailing_blankline_indent = false,
        show_end_of_line = true,
        space_char_blankline = " ",
        char_highlight_list = {
          "IndentBlanklineIndent1",
          "IndentBlanklineIndent2",
        },
        space_char_highlight_list = {
          "IndentBlanklineIndent1",
          "IndentBlanklineIndent2",
        },
        show_current_context = true,
        show_current_context_start = true,
      }
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" },
    cond = not vim.g.vscode,
    opts = function()
      return {
        user_default_options = {
          RGB = true,
          RRGGBB = true,
          names = false,
          RRGGBBAA = false,
          AARRGGBB = false,
          rgb_fn = true,
          hsl_fn = true,
          css = true,
          css_fn = true,
          mode = "background",
          tailwind = true,
          sass = { enable = true, parsers = { "css" } },
          virtualtext = "■",
          always_update = false,
        },
      }
    end,
  },
  {
    "utilyre/sentiment.nvim",
    version = "*",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
    },
  },
}
