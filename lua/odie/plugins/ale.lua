local g = vim.g
g.ale_disable_lsp = 1
g.ale_fix_on_save = 1
g.ale_completion_autoimport = 1
g.ale_set_highlights = 1
g.ale_python_auto_pipenv = 1
g.ale_fixers = {
  javascript = {'eslint', 'prettier'},
  vue = {'eslint', 'prettier'},
  python = {'autopep8',},
}
g.ale_linters = {
  python = {'pylint',},
}

