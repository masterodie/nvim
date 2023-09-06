local M = {}

M.keys = function(_, keys)
  return vim.tbl_deep_extend("force", {
    {
      "<leader>gc",
      function()
        vim.cmd.Git("commit")
      end,
      desc = "Create Git Commit",
    },
    { "<leader>gs", vim.cmd.Git, desc = "Show Git Status" },
    {
      "<leader>gP",
      function()
        vim.cmd.Git("push")
      end,
      desc = "Git Push",
    },
  }, keys)
end

return M
