return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      local palette = require("gruvbox.palette")

      local fg0 = palette.colors.light0
      local bg1 = palette.colors.dark1
      local bg2 = palette.colors.dark2
      local green = palette.colors.neutral_green
      local red = palette.colors.neutral_red

      require("gruvbox").setup({
        overrides = {
          TelescopeBorder = { fg = bg1, bg = bg1 },
          TelescopeNormal = { bg = bg1 },
          TelescopePreviewBorder = { fg = bg1, bg = bg1 },
          TelescopePreviewNormal = { bg = bg1 },
          TelescopePreviewTitle = { fg = fg0, bg = green },
          TelescopePromptBorder = { fg = bg2, bg = bg2 },
          TelescopePromptNormal = { fg = fg0, bg = bg2 },
          TelescopePromptPrefix = { fg = red, bg = bg2 },
          TelescopePromptTitle = { fg = fg0, bg = red },
          TelescopeResultsBorder = { fg = bg1, bg = bg1 },
          TelescopeResultsNormal = { bg = bg1 },
          TelescopeResultsTitle = { fg = bg1, bg = bg1 },
          TelescopeSelection = { bg = bg2, fg = fg0 },
          TelescopeResultsDiffAdd = { fg = fg0 },
          TelescopeResultsDiffChange = { fg = fg0 },
          TelescopeResultsDiffDelete = { fg = fg0 },
          NotifyBackground = { bg = bg1 },
          NotifyERRORBody = { bg = bg1 },
          NotifyWARNBody = { bg = bg1 },
          NotifyINFOBody = { bg = bg1 },
          NotifyDEBUGBody = { bg = bg1 },
          NotifyTRACEBody = { bg = bg1 },
        },
      })
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require('catppuccin').setup({
        flavour = "mocha",
        transparent_background = false,
        term_colors = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          neotree = true,
          treesitter = true,
          notify = true,
          mason = true,
          noice = true,
          dap = {
            enabled = true,
            enable_ui = true,
          },
          lsp_trouble = true,
          illuminate = true,
          which_key = true,
        },
        custom_highlights = function(colors)
          local bg1 = colors.mantle
          local bg2 = colors.crust
          local fg0 = colors.surface0
          local green = colors.green
          local red = colors.red
          return {

            TelescopeBorder = { fg = bg1, bg = bg1 },
            TelescopeNormal = { bg = bg1 },
            TelescopePreviewBorder = { fg = bg1, bg = bg1 },
            TelescopePreviewNormal = { bg = bg1 },
            TelescopePreviewTitle = { fg = fg0, bg = green },
            TelescopePromptBorder = { fg = bg2, bg = bg2 },
            TelescopePromptNormal = { fg = fg0, bg = bg2 },
            TelescopePromptPrefix = { fg = red, bg = bg2 },
            TelescopePromptTitle = { fg = fg0, bg = red },
            TelescopeResultsBorder = { fg = bg1, bg = bg1 },
            TelescopeResultsNormal = { bg = bg1 },
            TelescopeResultsTitle = { fg = bg1, bg = bg1 },
            TelescopeSelection = { bg = bg2, fg = fg0 },
            TelescopeResultsDiffAdd = { fg = fg0 },
            TelescopeResultsDiffChange = { fg = fg0 },
            TelescopeResultsDiffDelete = { fg = fg0 },
          }
        end

      })
    end,
  },
}
