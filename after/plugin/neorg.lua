local neorg = require("neorg")

local workspace_root = vim.env.NORG_ROOT
if workspace_root == nil then
    workspace_root = "~/Sync/norg"
end

neorg.setup({
    load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {
            config = {
                init_open_folds = "auto",
            },
        },            -- Adds pretty icons to your documents
        ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
                workspaces = {
                    notes = workspace_root .. "/notes",
                },
                default_workspace = "notes",
            },
        },
        ["core.completion"] = {
            config = {
                engine = "nvim-cmp",
            },
        },
        ["core.summary"] = {},
        ["core.manoeuvre"] = {},
        ["core.tangle"] = {},
        ["core.export"] = {
            config = {
                export_dir = "~/Sync/notes-export",
            },
        },
        ["core.export.markdown"] = {},
        ["core.esupports.metagen"] = {
            config = {
                type = "auto",
            },
        },
        ["core.ui.calendar"] = {},  -- Available with nvim 0.10+
        ["core.integrations.telescope"] = {},
    },
})

vim.keymap.set("n", "<leader>ni", function()
    vim.cmd.Neorg("index")
end, { desc = "Toggle Notes" })
