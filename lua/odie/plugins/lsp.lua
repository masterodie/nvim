return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "folke/neoconf.nvim",
      "folke/neodev.nvim",
      "jose-elias-alvarez/null-ls.nvim",
      "williamboman/mason-lspconfig.nvim",
      "jay-babu/mason-null-ls.nvim",
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "williamboman/mason.nvim",
    version = '1.*',
    cmd = { "Mason" },
    keys = {
      { "<leader>M", vim.cmd.Mason, desc = "Manage LSP Plugins" },
    },
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    version = '1.*',
    opts = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      return {
        ensure_installed = {
          "lua_ls",
          "jsonls",
        },
        handlers = {
          function(server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup({
              capabilities = capabilities,
            })
          end,
        },
      }
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    version = "2.*",
    opts = {
      ensure_installed = {
        "stylua",
      },
      handlers = {},
    },
  },
}
