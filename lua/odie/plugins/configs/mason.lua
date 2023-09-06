local M = {}

M.opts = function(_, opts)
  return vim.tbl_deep_extend("force", {
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  }, opts)
end

return M
