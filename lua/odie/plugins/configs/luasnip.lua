local M = {}

M.config = function(_, _)
  require("luasnip.loaders.from_vscode").lazy_load()
  require("odie.snippets")
end

return M
