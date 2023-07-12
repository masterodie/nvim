local treesitter = require("nvim-treesitter.configs")
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

-- parser_config.html.used_by = { "htmldjango", "html_tags" }
parser_config.filetype_by_parsername = {
  htmldjango = "html,",
  html_tags = "html,",
  gohtmltmpl = "gotmpl",
  gotexttmltmpl = "gotmpl",
  gotmltmpl = "gotmpl",
  yaml = "gotmpl",
}

parser_config.gotmpl = {
  install_info = {
    url = "https://github.com/ngalaiko/tree-sitter-go-template",
    files = {"src/parser.c"}
  },
  filetype = "gotmpl",
}

treesitter.setup({
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})
