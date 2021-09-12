local null_ls = require("null-ls")
null_ls.config({
	debug = true,
	default_timeout = 10000,
	sources = {
		null_ls.builtins.diagnostics.pylint,
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.diagnostics.shellcheck,
		--null_ls.builtins.diagnostics.luacheck,
		null_ls.builtins.formatting.autopep8,
		null_ls.builtins.formatting.eslint,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.stylua,
	},
})
