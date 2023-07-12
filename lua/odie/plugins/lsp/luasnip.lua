return {
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    opts = function()
      return {
        history = true,
        updateevents = "TextChanged,TextChangedI",
        enable_autosnippets = true,
      }
    end,
    config = function(_, opts)
      local ls = require("luasnip")

      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_lua").lazy_load()

      local s = ls.snippet
      local i = ls.insert_node
      local fmt = require("luasnip.extras.fmt").fmt

      ls.add_snippets("editorconfig", {
        s(
          "root",
          fmt(
            [[
            root = {root_value}

            [*]
            end_of_line = lf
            charset = utf-8
            indent_style = space
            indent_size = {indent_size}
            insert_final_newline = true
            trim_trailing_whitespace = true
            {exit}
          ]],
            {
              root_value = i(1, "true"),
              indent_size = i(2, "2"),
              exit = i(0),
            }
          )
        ),
        s(
          "[",
          fmt(
            [[
            [*{extension}]
            indent_size = {indent_size}
            {exit}
          ]],
            {
              extension = i(1, ".lua"),
              indent_size = i(2, "2"),
              exit = i(0),
            }
          )
        ),
      })

      ls.config.set_config(opts)
    end,
  },
}
