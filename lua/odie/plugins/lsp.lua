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
    config = function()
      local group = vim.api.nvim_create_augroup("UserKeymaps", {})

      vim.api.nvim_create_autocmd("LspAttach", {
        group = group,
        callback = function(ev)
          local k = require("odie.utils.keymaps")
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local mapopts = function(desc)
            return k.options({ buffer = ev.buf, desc = desc })
          end
          k.nmap({ "gD", vim.lsp.buf.declaration, mapopts("Goto Declaration") })
          k.nmap({ "gd", vim.lsp.buf.definition, mapopts("Goto Definition") })
          k.nmap({ "K", vim.lsp.buf.hover, mapopts("Hover") })
          k.nmap({ "gi", vim.lsp.buf.implementation, mapopts("Goto Implementation") })
          k.nmap({
            "<leader>k",
            vim.lsp.buf.signature_help,
            mapopts("Show Signature Help"),
          })
          k.nmap({
            "<space>wa",
            vim.lsp.buf.add_workspace_folder,
            mapopts("Add Workspace Folder"),
          })
          k.nmap({
            "<space>wr",
            vim.lsp.buf.remove_workspace_folder,
            mapopts("Remove Workspace Folder"),
          })
          k.nmap({
            "<space>wl",
            function()
              print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end,
            mapopts("List Workspace Folders"),
          })
          k.nmap({
            "<space>D",
            vim.lsp.buf.type_definition,
            mapopts("Show Type Definition"),
          })
          k.nmap({ "<space>rn", vim.lsp.buf.rename, mapopts("Rename") })
          k.map({
            { "n", "v" },
            "<space>ca",
            vim.lsp.buf.code_action,
            mapopts("Code action"),
          })
          k.nmap({ "gr", vim.lsp.buf.references, mapopts("Goto references") })
          k.nmap({
            "<space>fm",
            function()
              vim.lsp.buf.format({ async = true })
            end,
            mapopts("Format Code"),
          })
        end,
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    version = "1.*",
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
}
