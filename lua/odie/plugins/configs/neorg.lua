local M = {
  "nvim-neorg/neorg",
}

M.build = ":Neorg sync-parsers"

M.dependencies = { "nvim-lua/plenary.nvim" }

M.cmd = { "Neorg " }

M.config = function()
  require("neorg").setup({
    load = {
      ["core.defaults"] = {}, -- Loads default behaviour
      ["core.concealer"] = {}, -- Adds pretty icons to your documents
      ["core.dirman"] = { -- Manages Neorg workspaces
        config = {
          workspaces = {
            notes = "~/Notes"
          },
          default_workspace = "notes"
        },
      },
      ["core.completion"] = {
        config = {
          engine = "nvim-cmp",
        }
      },
      ["core.summary"] = {}, -- Adds pretty icons to your documents
    },
  })
end

M.keys = function()
  return {
    {"<leader>ni", function() vim.cmd.Neorg("index") end, desc = "Open notes"},
    {"<leader>nc", function() vim.cmd.Neorg("return") end, desc = "Close notes"},
  }
end

return M
