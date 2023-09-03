return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    cond = not vim.g.started_by_firenvim,
    opts = {
      cmdline = {
        view = "cmdline",
      },
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true,         -- use a classic bottom cmdline for search
        command_palette = true,       -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false,           -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false,       -- add a border to hover docs and signature help
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  {
    "rcarriga/nvim-notify",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      fps = 60,
      render = "compact",
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { border = "none" })
      end,
    },
  },
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
          {
            type = "text",
            val = "Quick links",
            opts = { hl = "SpecialComment", position = "center" },
          },
          { type = "padding", val = 1 },
          dashboard.button("SPC f f", "󰈞  Find file"),
          dashboard.button("SPC f o", "  File History"),
          dashboard.button("SPC f g", "󰊄  Live grep"),
          dashboard.button("SPC M", "  Manage LSP plugins", "<cmd>Mason<CR>"),
          dashboard.button("u", "  Update plugins", "<cmd>Lazy sync<CR>"),
          dashboard.button(
            "c",
            "  Open Config Directory",
            "<cmd>cd ~/.config/nvim/ <CR>"
          ),
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
  {
    "nvim-lualine/lualine.nvim",
    event = "ColorScheme",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = function()
      local colors = require("catppuccin.palettes.mocha")

      return {
        sections = {
          lualine_a = { "mode" },
          lualine_b = {
            { "branch" },
            { "diff" },
          },
          lualine_c = {
            "%=",
            { "filetype", icon_only = true },
            { "filename" },
          },
          lualine_x = {},
          lualine_y = {
            { "encoding" },
            { "fileformat" },
          },
          lualine_z = {
            {
              require("lazy.status").updates,
              cond = require("lazy.status").has_updates,
              color = { fg = colors.red },
            },
            { "progress" },
            { "location" },
          },
        },
        winbar = {
          lualine_x = {
            { "diagnostics" },
            { "filename",   path = 1 },
            { "filetype",   icon_only = true },
          },
        },
        inactive_winbar = {
          lualine_x = {
            { "diagnostics" },
            { "filename",   path = 1 },
            { "filetype",   icon_only = true },
          },
        },
        extensions = { "fugitive", "lazy", "man", "neo-tree", "nvim-dap-ui", "quickfix" },
        options = {
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {
            statusline = {},
            winbar = {
              "help",
              "lazy",
              "neo-tree",
              "dapui_stacks",
              "dapui_watches",
              "dapui_breakpoints",
              "dapui_scopes",
              "dapui_console",
              "dap-repl",
              "fugitive",
            },
          },
          theme = "catppuccin",
        }
      }
    end,
  },
}
