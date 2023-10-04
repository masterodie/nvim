require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = {  -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = false, -- disables setting the background color.
    show_end_of_buffer = false,  -- shows the '~' characters after the end of buffers
    term_colors = false,         -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = false,         -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.05,       -- percentage of the shade to apply to the inactive window
    },
    no_italic = false,           -- Force no italic
    no_bold = false,             -- Force no bold
    no_underline = false,        -- Force no underline
    styles = {                   -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {},
    integrations = {
        cmp = true,
        gitsigns = true,
        neotree = true,
        treesitter = true,
        --notify = false,
        mini = true,
        fidget = true,
        noice = true,
        indent_blankline = {
            enabled = true,
        },
        mason = false,
        rainbow_delimiters = true,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
    custom_highlights = function(colors)
        local bg1 = colors.mantle
        local bg2 = colors.crust
        local fg0 = colors.text
        local green = colors.green
        local red = colors.red
        return {
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
            TelescopeSelection = { bg = bg2, fg = colors.text },
            TelescopeResultsDiffAdd = { fg = fg0 },
            TelescopeResultsDiffChange = { fg = fg0 },
            TelescopeResultsDiffDelete = { fg = fg0 },
            NotifyBackground = { bg = bg2 },
        }
    end,
})

vim.cmd.colorscheme("catppuccin")
