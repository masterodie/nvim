local treesitter= require ('nvim-treesitter.configs')

treesitter.setup {
  highlight = {
    enable = true,
    custom_captures = {
    },
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  },
}
