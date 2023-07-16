local M = {}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local ok, lazy = pcall(require, "lazy")

if not ok then
  return
end


M.default_settings = {
  defaults = {
    lazy = true,
  },
  checker = {
    enabled = true,
  },
  installer = {
    colorscheme = { "gruvbox" },
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
}

--- @param opts LazyConfig
M.setup = function(opts)
  lazy.setup(vim.tbl_deep_extend("force", M.default_settings, opts))
end

return M
