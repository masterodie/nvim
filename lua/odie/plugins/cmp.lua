return {
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-emoji",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "f3fora/cmp-spell",
      {
        'tzachar/cmp-fuzzy-path',
        dependencies = { 'tzachar/fuzzy.nvim' }
      },
      {"onsails/lspkind.nvim"},
    },
    config = function()
      local ls = require('luasnip')
      local cmp = require("cmp")
      local lspkind = require("lspkind")

      cmp.setup({
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
            ellipsis_char = "…",
            menu = {
              nvim_lsp = "[LSP]",
              luasnip = "[Snippet]",
              buffer = "[Buffer]",
              path = "[Path]",
              nvim_lua = "[Lua]",
              emoji = "[Emoji]",
            },
          }),
        },
        completion = {
          completeopt = "menu,menuone",
        },
        window = {
          completion = {
            side_padding = 0,
            scrollbar = false,
          },
          documentation = {},
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<C-k>"] = function() ls.expand() end,
          ["<C-l>"] = function() ls.jump(1) end,
          ["<C-j>"] = function() ls.jump(-1) end,
        }),
        sources = cmp.config.sources({
          { name = "luasnip" },
          { name = "nvim_lsp" },
          { name = "spell" },
          { name = "buffer" },
          { name = "fuzzy_path" },
          { name = "emoji" },
        }),
      })

      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "fuzzy_path" },
        }, {
          { name = "cmdline" },
        }),
      })
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "1.*",
    config = function()
      local ls = require('luasnip')

      require("luasnip.loaders.from_vscode").lazy_load()

      vim.keymap.set({ "i" }, "<C-K>", function()
        ls.expand()
      end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<C-L>", function()
        ls.jump(1)
      end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<C-J>", function()
        ls.jump(-1)
      end, { silent = true })

      vim.keymap.set({ "i", "s" }, "<C-E>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end, { silent = true })
    end,
  },
}
