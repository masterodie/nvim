return {
  {
    "folke/noice.nvim",
    event = "ColorScheme",
    cond = not vim.g.vscode,
    opts = {
      cmdline = {
        view = "cmdline",
      },
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = true,
        lsp_doc_border = false,
      },
      notify = {
        view = "notify",
      },
    },
    dependencies = {
      "nui.nvim",
      "nvim-notify",
    },
  },
}
