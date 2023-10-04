local telescope = require("telescope")
telescope.setup({
    defaults = {
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
                results_width = 0.8,
            },
            vertical = {
                mirror = true,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
        },
        file_ignore_patterns = { "node_modules", "vendor" },
        path_display = { "truncate" },
        winblend = 3,
        border = {},
        borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
        color_devicons = true,
        extensions = {
            fzf = {
                fuzzy = true,       -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true, -- override the file sorter
                case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            },
        },
    },
})

-- Enable telescope fzf native, if installed
telescope.load_extension("fzf")
telescope.load_extension("noice")
telescope.load_extension("dap")

-- See `:help telescope.builtin`
vim.keymap.set("n", "<leader>fo", require("telescope.builtin").oldfiles, { desc = "Find recently opened files" })
vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, { desc = "] Find existing buffers" })
vim.keymap.set("n", "<leader>gf", require("telescope.builtin").git_files, { desc = "Search Git Files" })
vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "Search Files" })
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "Search Help" })
vim.keymap.set("n", "<leader>fG", require("telescope.builtin").grep_string, { desc = "Search current Word" })
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, { desc = "Search by Grep" })
vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "Search Diagnostics" })
vim.keymap.set("n", "<leader>fr", require("telescope.builtin").resume, { desc = "Search Resume" })
