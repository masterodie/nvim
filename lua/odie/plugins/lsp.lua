return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "folke/neoconf.nvim",
      "folke/neodev.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local group = vim.api.nvim_create_augroup("UserKeymaps", {})

      vim.api.nvim_create_autocmd("LspAttach", {
        group = group,
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          vim.keymap.set(
            "n",
            "gD",
            vim.lsp.buf.declaration,
            { desc = "Goto Declaration" }
          )
          vim.keymap.set(
            "n",
            "gd",
            vim.lsp.buf.definition,
            { desc = "Goto Defninition" }
          )
          vim.keymap.set(
            "n",
            "gi",
            vim.lsp.buf.implementation,
            { desc = "Goto Implementation" }
          )
          vim.keymap.set(
            "n",
            "gtd",
            vim.lsp.buf.type_definition,
            { desc = "Show Type Definition" }
          )
          vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Goto References" })
          vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
          vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, {desc = "Rename" })
          vim.keymap.set(
            { "n", "v" },
            "<space>ca",
            vim.cmd.CodeActionMenu,
            { desc = "Code action" }
          )
          vim.keymap.set("n", "<space>fm", function()
            vim.lsp.buf.format({ async = true })
          end, { desc = "Format Code" })
        end,
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    version = "1.*",
    cmd = { "Mason" },
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
    version = "1.*",
    opts = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      return {
        ensure_installed = {
          "lua_ls",
          "jsonls",
          "efm",
        },
        handlers = {
          function(server_name) -- default handler (optional)
            lspconfig[server_name].setup({
              capabilities = capabilities,
            })
          end,
          ["rust_analyzer"] = function() end,
          ["efm"] = function()
            local languages = require("efmls-configs.defaults").languages()
            local efmls_config = {
              filetypes = vim.tbl_keys(languages),
              settings = {
                rootMarkers = { ".git/" },
                languages = languages,
              },
              init_options = {
                documentFormatting = true,
                documentRangeFormatting = true,
              },
            }
            lspconfig.efm.setup(vim.tbl_extend("force", efmls_config, {
              capabilities = capabilities,
            }))
          end,
          ["clangd"] = function()
            local config = {
              capabilities = vim.tbl_deep_extend("force", capabilities, {
                offsetEncoding = { "utf-16" },
                general = {
                  positionEncodings = { "utf-16" },
                },
              }),
              offset_encoding = "utf-16",
              on_new_config = function(new_config, _)
                local status, cmake = pcall(require, "cmake-tools")
                if status then
                  cmake.clangd_on_new_config(new_config)
                end
              end,
            }
            lspconfig.clangd.setup(config)
          end,
        },
      }
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "Trouble", "TroubleToggle" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    "creativenull/efmls-configs-nvim",
    dependencies = { "neovim/nvim-lspconfig" },
  },
  {
    "folke/neoconf.nvim",
    cmd = "Neoconf",
    dependencies = {
      "rafi/neoconf-venom.nvim",
    },
    opts = {},
  },
  {
    "rafi/neoconf-venom.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    config = function()
      require("venom").setup()
    end,
  },
  {
    "folke/neodev.nvim",
    opts = {},
  },
}
