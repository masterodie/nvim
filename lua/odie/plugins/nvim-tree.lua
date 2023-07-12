local g = vim.g
local nvim_tree = require("nvim-tree")

nvim_tree.setup({
	filters = {
		custom = { ".git", "node_modules", ".cache", "__pycache__", ".venv" },
	},
	open_on_setup = true,
	update_focused_file = {
		enable = true,
	},
})

g.nvim_tree_side = "left"
g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 1
g.nvim_tree_group_empty = 1

g.nvim_tree_show_icons = {
	git = 1,
	folders = 1,
	files = 1,
	folder_arrows = 1,
}

g.nvim_tree_icons = {
	default = "",
	symlink = "",
	git = {
		unstaged = "✗",
		staged = "✓",
		unmerged = "",
		renamed = "➜",
		untracked = "★",
		deleted = "",
		ignored = "◌",
	},
	folder = {
		arrow_open = "",
		arrow_closed = "",
		default = "",
		open = "",
		empty = "",
		empty_open = "",
		symlink = "",
		symlink_open = "",
	},
	lsp = {
		hint = "",
		info = "",
		warning = "",
		error = "",
	},
}
