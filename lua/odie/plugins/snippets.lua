return {
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "1.*",
    config = function()
      local ls = require('luasnip')
      require("luasnip.loaders.from_vscode").lazy_load()


      vim.keymap.set("i", "<C-K>", function()
        ls.expand()
      end, { silent = true })
      vim.keymap.set({ "i",  "s" }, "<C-L>", function()
        ls.jump(1)
      end, { silent = true })
      vim.keymap.set({ "i",  "s" }, "<C-J>", function()
        ls.jump(-1)
      end, { silent = true })

      vim.keymap.set({ "i",  "s" }, "<C-E>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end, { silent = true })

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
    end,
  },
}
