return {
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "folke/neodev.nvim",
      "folke/neoconf.nvim",
      "rafi/neoconf-venom.nvim",
    },
    opts = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      if not vim.g.vscode then
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
      end

      return {
        ensure_installed = {
          "lua_ls",
        },
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup({
              capabilities = capabilities,
            })
          end,
          ["cssls"] = function()
            require("lspconfig").cssls.setup({
              capabilities = capabilities,
              settings = {
                css = {
                  lint = {
                    unknownAtRules = "ignore",
                  },
                },
              },
            })
          end,
          ["emmet_ls"] = function()
            require("lspconfig").emmet_ls.setup({
              capabilities = capabilities,
              filetypes = {
                "astro",
                "css",
                "eruby",
                "html",
                "htmldjango",
                "javascriptreact",
                "less",
                "pug",
                "sass",
                "scss",
                "svelte",
                "typescriptreact",
                "vue",
                "php",
                "blade",
              },
            })
          end,
          ["intelephense"] = function()
            require("lspconfig").intelephense.setup({
              capabilities = capabilities,
              filetypes = {
                "php",
                "blade",
              },
            })
          end,
        },
      }
    end,
  },
}
