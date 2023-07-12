return {
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
}


