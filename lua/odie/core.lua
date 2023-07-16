require("odie.settings")

local lazy = require("odie.lazy")
local file = require("odie.utils.file")

local spec = {
  { import = "odie.plugins" },
}

local custom_plugins_path = vim.fn.stdpath("config") .. "/lua/odie/custom/plugins"
local custom_plugins_exists = file.exists(custom_plugins_path)


if custom_plugins_exists then
  table.insert(spec, { import = "odie.custom.plugins" })
end

local colorscheme = "gruvbox"

lazy.setup({
  spec = spec,
})

vim.cmd.colorscheme(colorscheme)
