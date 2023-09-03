local crates = require("crates")
crates.setup({
  null_ls = {
    enabled = true,
    name = "crates.nvim",
  },
})

local mapopts = function(desc)
  return { silent = true, desc = desc }
end

vim.keymap.set("n", "<leader>pt", crates.toggle, mapopts("Crate Toggle"))
vim.keymap.set("n", "<leader>pr", crates.reload, mapopts("Crate Reload"))

vim.keymap.set(
  "n",
  "<leader>pv",
  crates.show_versions_popup,
  mapopts("Crate Show Version Popup")
)
vim.keymap.set(
  "n",
  "<leader>pf",
  crates.show_features_popup,
  mapopts("Crate show features Popup")
)
vim.keymap.set(
  "n",
  "<leader>pd",
  crates.show_dependencies_popup,
  mapopts("Crate Show Dependency Popup")
)

vim.keymap.set("n", "<leader>pu", crates.update_crate, mapopts("Update Crate"))
vim.keymap.set("v", "<leader>pu", crates.update_crates, mapopts("Update Crates"))
vim.keymap.set("n", "<leader>pa", crates.update_all_crates, mapopts("Update All Crates"))
vim.keymap.set("n", "<leader>pU", crates.upgrade_crate, mapopts("Upgrade Crate"))
vim.keymap.set("v", "<leader>pU", crates.upgrade_crates, mapopts("Upgrade Crates"))
vim.keymap.set(
  "n",
  "<leader>pA",
  crates.upgrade_all_crates,
  mapopts("Upgrade All Crates")
)

vim.keymap.set("n", "<leader>pH", crates.open_homepage, mapopts("Open Crate Homepage"))
vim.keymap.set(
  "n",
  "<leader>pR",
  crates.open_repository,
  mapopts("Open Crate Repository")
)
vim.keymap.set(
  "n",
  "<leader>pD",
  crates.open_documentation,
  mapopts("Open Crate Documentation")
)
vim.keymap.set(
  "n",
  "<leader>pC",
  crates.open_crates_io,
  mapopts("Open crates.io for Crate")
)
