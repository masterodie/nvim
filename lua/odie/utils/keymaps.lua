local M = {}

M.nmap = function(args)
  vim.keymap.set("n", args[1], args[2], args[3])
end

M.vmap = function(args)
  vim.keymap.set("v", args[1], args[2], args[3])
end

return M
