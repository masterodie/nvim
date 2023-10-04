require("nvim-treesitter.configs").setup({
    auto_install = false,
    sync_install = false,
    ignore_install = {},
    modules = {},
    ensure_installed = {},
    highlight = {
        enable = true,
    },
    indent = {
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
    incremental_selection = {
        enable = true,
    },
    endwise = {
        enable = true,
    },
    autotag = {
        enable = true,
    },
})
