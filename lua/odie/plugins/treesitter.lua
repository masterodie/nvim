local treesitter = require("nvim-treesitter.configs")
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

parser_config.html.used_by = { "htmldjango", "html_tags" }

treesitter.setup({
	highlight = {
		enable = true,
		custom_captures = {},
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},
	autotag = {
		enable = true,
		filetypes = {
			"html",
			"xml",
			"javascript",
			"javascriptreact",
			"typescriptreact",
			"svelte",
			"vue",
		},
	},
})
