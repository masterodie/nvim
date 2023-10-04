local nvim_lsp = require("lspconfig")

require("mason").setup()
require("mason-lspconfig").setup()

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
