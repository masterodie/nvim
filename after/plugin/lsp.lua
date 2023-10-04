local nvim_lsp = require("lspconfig")

require("mason").setup()
require("mason-lspconfig").setup()

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

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local efm_languages = require("efmls-configs.defaults").languages()
efm_languages = vim.tbl_extend("force", efm_languages, {
    go = {
        require("efmls-configs.formatters.gofumpt"),
        require("efmls-configs.formatters.goimports"),
        require("efmls-configs.formatters.golines"),
    },
    python = {
        require("efmls-configs.formatters.ruff"),
    },
    json = {
        require("efmls-configs.formatters.jq"),
    },
    lua = {
        require("efmls-configs.formatters.stylua"),
    },
})

require("mason-lspconfig").setup_handlers({
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function(server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup({
            capabilities = capabilities,
        })
    end,
    ["efm"] = function()
        require("lspconfig").efm.setup({
            capabilities = capabilities,
            filetypes = vim.tbl_keys(efm_languages),
            settings = {
                languages = efm_languages,
            },
            init_options = {
                documentFormatting = true,
                documentRangeFormatting = true,
            },
        })
    end,
    ["lua_ls"] = function()
        require("lspconfig").lua_ls.setup({
            Lua = {
                workspace = { checkThirdParty = false },
                telemetry = { enable = false },
            },
        })
    end,
    ["gopls"] = function()
        require("lspconfig").gopls.setup({
            settings = {
                gopls = {
                    gofumpt = true,
                    staticcheck = true,
                    completeUnimported = true,
                    usePlaceholders = true,
                    analyses = {
                        unusedparams = true,
                    },
                },
            },
        })
    end,
})
