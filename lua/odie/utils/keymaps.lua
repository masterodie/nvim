local M = {}

M.map = function(args)
  vim.keymap.set(args[1], args[2], args[3], args[4])
end

M.nmap = function(args)
  M.map({ "n", args[1], args[2], args[3] })
end

M.imap = function(args)
  M.map({ "i", args[1], args[2], args[3] })
end

M.vmap = function(args)
  M.map({ "v", args[1], args[2], args[3] })
end

M.options = function(opts)
  return vim.tbl_deep_extend("force", { silent = true }, opts)
end

return M
