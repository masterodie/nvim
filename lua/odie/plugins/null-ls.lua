local null_ls = require("null-ls")
local lspconfig = require("lspconfig")
null_ls.config({
	debug = true,
	default_timeout = 30000,
	sources = {
		--null_ls.builtins.diagnostics.pylint,
		null_ls.builtins.diagnostics.flake8,
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.diagnostics.shellcheck,
		--null_ls.builtins.diagnostics.luacheck,
		null_ls.builtins.formatting.autopep8,
		null_ls.builtins.formatting.eslint,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.stylua,
	},
})

lspconfig['null-ls'].setup({})
