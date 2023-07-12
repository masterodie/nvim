
if (vim.g.vscode) then
  require("odie.plugins-vscode")
  require("odie.settings-vscode")
else
  require("odie.plugins")
  require("odie.settings")
end
