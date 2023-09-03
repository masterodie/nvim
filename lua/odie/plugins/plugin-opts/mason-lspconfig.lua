local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
require("odie.autocmds")

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
