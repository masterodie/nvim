local null_ls = require('null-ls')
null_ls.config({
  sources = {
    null_ls.builtins.diagnostics.pylint,
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.formatting.autopep8,
    null_ls.builtins.formatting.eslint,
    null_ls.builtins.formatting.prettier,
  }

})

