return {
  {
    "nvim-lualine/lualine.nvim",
    event = { "ColorScheme" },
    cond = not vim.g.vscode,
    dependencies = { "nvim-web-devicons" },
    opts = function()
      local colors = require("gruvbox.palette").colors
      return {
        extensions = { "neo-tree", "fugitive", "lazy", "man", "nvim-dap-ui", "trouble" },
        sections = {
          lualine_a = { "mode" },
          lualine_b = {
            "branch",
            "diff",
            "diagnostics",
          },
          lualine_c = {
            "filename",
          },
          lualine_x = {
            "filetype",
            "encoding",
            "fileformat",
          },
          lualine_y = {
            {
              require("lazy.status").updates,
              cond = require("lazy.status").has_updates,
              color = { fg = colors.faded_orange },
            },
          },
          lualine_z = {
            "progress",
            "location",
          },
        },
        options = {
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          theme = {
            normal = {
              a = { bg = colors.dark1, fg = colors.light2, gui = "bold" },
              b = { bg = colors.dark2, fg = colors.light0 },
              c = { bg = colors.dark0, fg = colors.light3 },
              x = { bg = colors.dark0, fg = colors.light3 },
              y = { bg = colors.dark2, fg = colors.light0 },
              z = { bg = colors.dark1, fg = colors.light2, gui = "bold" },
            },
            insert = {
              a = { bg = colors.faded_blue, fg = colors.dark0, gui = "bold" },
            },
            visual = {
              a = { bg = colors.faded_yellow, fg = colors.dark0, gui = "bold" },
            },
            replace = {
              a = { bg = colors.bright_red, fg = colors.dark0, gui = "bold" },
            },
            command = {
              a = { bg = colors.faded_green, fg = colors.dark0, gui = "bold" },
            },
            inactive = {
              a = { bg = colors.dark1, fg = colors.light2, gui = "bold" },
            },
          },
        },
      }
    end,
  },
}

