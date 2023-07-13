return {
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
    },
    opts = function()
      local null_ls = require("null-ls")
      return {
        ensure_installed = {
          "stylua",
          "shellharden",
        },
        handlers = {
          function(source, methods)
            require("mason-null-ls").default_setup(source, methods)
          end,
          phpmd = function(source, methods)
            if not null_ls.is_registered(source) then
              vim.tbl_map(function(type)
                null_ls.register(
                  null_ls.builtins[type][source].with({
                    extra_args = { "phpmd-ruleset.xml" },
                  })
                )
              end, methods)
            end
          end,
        },
      }
    end,
  },
}
