local M = {
  "nvim-orgmode/orgmode",
}

M.dependencies = {
  "akinsho/org-bullets.nvim",
}

M.lazy = false

M.opts = {}

M.setup = function(_, opts)
  local orgmode = require("orgmode")
  orgmode.setup(opts)
end

return M
