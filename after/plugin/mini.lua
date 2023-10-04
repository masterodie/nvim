require("mini.move").setup({
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
})
require("mini.comment").setup()
require("mini.pairs").setup()
require("mini.cursorword").setup()
require("mini.surround").setup({
    custom_surroundings = {
        ["("] = { output = { left = "( ", right = " )" } },
        ["["] = { output = { left = "[ ", right = " ]" } },
        ["{"] = { output = { left = "{ ", right = " }" } },
        ["<"] = { output = { left = "< ", right = " >" } },
    },
    mappings = {
        add = "ys",
        delete = "ds",
        find = "fs",
        find_left = "Fs",
        highlight = "",
        replace = "cs",
        update_n_lines = "",
    },
    search_method = "cover_or_next",
})
