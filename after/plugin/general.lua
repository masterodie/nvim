require("gitsigns").setup()
require("nvim-web-devicons").setup()
require("colorizer").setup({})
require("todo-comments").setup()
require("nvim-dap-virtual-text").setup({})
require("luasnip.loaders.from_vscode").lazy_load()
require("tmux").setup({
    resize = {
        resize_step_x = 4,
        resize_step_y = 2,
    },
})
require("nvim-lightbulb").setup({
    autocmd = { enabled = true },
})
