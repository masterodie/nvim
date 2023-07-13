local M = {}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

M.defaults = {
  spec = {
    { import = "odie.plugins" },
    {
      import = "odie.custom.plugins",
      cond = vim.loop.fs_stat(vim.fn.stdpath("config") .. "/lua/custom/plugins/init.lua"),
    },
  },
  defaults = {
    lazy = true,
  },
  checker = {
    enabled = true,
  },
  install = {
    colorscheme = { "gruvbox" },
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        --"matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
}

---@param leader string|nil
---@param opts LazyConfig|nil
M.setup = function(leader, opts)
  local ok, lazy = pcall(require, "lazy")
  if not ok then
    return
  end

  vim.g.mapleader = leader or " "
  vim.g.localmapleader = leader or " "

  lazy.setup(vim.tbl_deep_extend("force", M.defaults, opts or {}))
end

return M
