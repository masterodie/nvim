-- Yank Hightlight
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = "*",
})

-- Text Conceal
local conceal_group = vim.api.nvim_create_augroup("conceal", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    group = conceal_group,
    pattern = { "*.md", "*.json", "*.norg" },
    callback = function()
        vim.opt.conceallevel = 3
    end,
})

vim.api.nvim_create_autocmd({ "BufLeave", "BufWinLeave" }, {
    group = conceal_group,
    pattern = { "*.md", "*.json", "*.norg" },
    callback = function()
        vim.opt.conceallevel = 0
    end,
})

-- Remember cursor position
vim.api.nvim_create_autocmd("BufRead", {
    callback = function(opts)
        vim.api.nvim_create_autocmd("BufWinEnter", {
            once = true,
            buffer = opts.buf,
            callback = function()
                local ft = vim.bo[opts.buf].filetype
                local last_known_line = vim.api.nvim_buf_get_mark(opts.buf, '"')[1]
                if
                    not (ft:match("commit") and ft:match("rebase"))
                    and last_known_line > 1
                    and last_known_line <= vim.api.nvim_buf_line_count(opts.buf)
                then
                    vim.api.nvim_feedkeys([[g`"]], "nx", false)
                end
            end,
        })
    end,
})

-- LSP Attach
local lsp_attach_augroup = vim.api.nvim_create_augroup("lsp_attach", { clear = true })
vim.api.nvim_create_autocmd("LspAttach", {
    group = lsp_attach_augroup,
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto Defninition" })
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Goto Implementation" })
        vim.keymap.set("n", "gtd", vim.lsp.buf.type_definition, { desc = "Show Type Definition" })
        vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Goto References" })
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.cmd.CodeActionMenu, { desc = "Code action" })
        vim.keymap.set("n", "<leader>fm", function()
            vim.lsp.buf.format({ async = true })
        end, { desc = "Format Code" })
    end,
})

