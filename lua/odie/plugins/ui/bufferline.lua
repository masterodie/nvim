return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-web-devicons",
    event = { "ColorScheme " },
    cond = not vim.g.vscode,
    opts = {
      options = {
        numbers = function(opts)
          return string.format("%s", opts.raise(opts.ordinal))
        end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            text_align = "center",
            separator = true,
          },
        },
      },
    },
  },
}
