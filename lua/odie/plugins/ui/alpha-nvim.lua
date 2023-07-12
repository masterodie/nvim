return {
  {
    "goolord/alpha-nvim",
    event = "ColorScheme",
    dependencies = { "nvim-web-devicons" },
    cond = not vim.g.vscode,
    opts = function()
      local header = {
        type = "text",
        val = {
          [[                 _       ]],
          [[ ___ ___ ___ _ _|_|_____ ]],
          [[|   | -_| . | | | |     |]],
          [[|_|_|___|___|\_/|_|_|_|_|]],
        },
        opts = {
          position = "center",
          hl = "Type",
        },
      }

      local config = require("alpha.themes.theta").config

      local dashboard = require("alpha.themes.dashboard")
      local buttons = {
        type = "group",
        val = {
          { type = "text",    val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
          { type = "padding", val = 1 },
          dashboard.button("SPC f f", "󰈞  Find file"),
          dashboard.button("SPC f h", "  File History"),
          dashboard.button("SPC f g", "󰊄  Live grep"),
          dashboard.button("c", "  Open Config Directory", "<cmd>cd ~/.config/nvim/ <CR>"),
          dashboard.button("u", "  Update plugins", "<cmd>Lazy sync<CR>"),
          dashboard.button("l", "  Manage LSP plugins", "<cmd>Mason<CR>"),
          dashboard.button("q", "󰅚  Quit", "<cmd>qa<CR>"),
        },
        position = "center",
      }

      local layout = {
        { type = "padding", val = 2 },
        header,
        { type = "padding", val = 2 },
        buttons,
      }

      config.layout = layout
      return config
    end,
  },
}
