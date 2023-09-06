local M = {}

M.opts = function(_, opts)
  return vim.tbl_deep_extend("force", {
    providers = {
      "lsp",
      "treesitter",
      "regex",
    },
    large_file_cutoff = 2000,
    large_file_overrides = {
      providers = { "lsp" },
    },
  }, opts)
end

return M
