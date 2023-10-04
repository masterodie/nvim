local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { "folke/lazy.nvim",                     version = "*" },
    { "catppuccin/nvim",                     version = "*",    priority = 1000 },
    { "folke/which-key.nvim",                version = "*" },
    { "MunifTanjim/nui.nvim",                version = "*" },
    { "nvim-neorg/neorg",                    version = "*" },
    { "aserowy/tmux.nvim",                   version = "*" },
    { "echasnovski/mini.nvim",               branch = "stable" },
    { "lukas-reineke/indent-blankline.nvim", version = "*" },
    { "lewis6991/gitsigns.nvim",             version = "*" },
    { "dhruvasagar/vim-table-mode",          version = "*" },
    { "simrat39/rust-tools.nvim",            version = "*" },
    { "Saecki/crates.nvim",                  version = "*" },
    { "olexsmir/gopher.nvim",                version = "*" },
    { "leoluz/nvim-dap-go",                  version = "*" },
    { "mfussenegger/nvim-dap-python",        version = "*" },
    { "mbbill/undotree",                     version = "*" },
    { "mfussenegger/nvim-dap",               version = "*" },
    { "NvChad/nvim-colorizer.lua",           version = "*" },
    { "kosayoda/nvim-lightbulb",             version = "*" },
    { "nvim-tree/nvim-web-devicons",         version = "*" },
    { "nvim-lua/plenary.nvim",               version = "*" },
    { "tpope/vim-dadbod",                    version = "*" },
    { "weilbith/nvim-code-action-menu",      version = "*" },
    { "folke/neodev.nvim",                   version = "*" },
    {
        "williamboman/mason-lspconfig.nvim",
        version = "*",
        dependencies = { "mason.nvim" },
    },
    {
        "L3MON4D3/LuaSnip",
        version = "*",
        dependencies = {
            { "rafamadriz/friendly-snippets" },
        },
    },
    {
        "nvim-telescope/telescope.nvim",
        version = "*",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build =
        "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
        version = "*",
    },
    {
        "nvim-telescope/telescope-dap.nvim",
        version = "*",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-telescope/telescope.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        version = "*",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
    },
    {
        "nvim-lualine/lualine.nvim",
        version = "*",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },
    {
        "hrsh7th/nvim-cmp",
        version = "*",
        dependencies = {
            { "neovim/nvim-lspconfig" },
            { "hrsh7th/cmp-nvim-lsp",     version = "*" },
            { "hrsh7th/cmp-buffer",       version = "*" },
            { "hrsh7th/cmp-path",         version = "*" },
            { "hrsh7th/cmp-cmdline",      version = "*" },
            { "saadparwaiz1/cmp_luasnip", version = "*" },
            { "onsails/lspkind.nvim",     version = "*" },
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        version = "*",
        dependencies = {
            { "RRethy/nvim-treesitter-endwise",                     version = "*" },
            { "windwp/nvim-ts-autotag",                             version = "*" },
            { "https://gitlab.com/HiPhish/rainbow-delimiters.nvim", version = "*" },
            { "nvim-treesitter/nvim-treesitter-textobjects",        version = "*" },
        },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "williamboman/mason.nvim", version = "*" },
            { "folke/neodev.nvim",       version = "*" },
        },
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        version = "*",
        dependencies = { "mason.nvim" },
    },
    {
        "folke/noice.nvim",
        version = "*",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
    },
    {
        "rcarriga/nvim-dap-ui",
        version = "*",
        dependencies = { "mfussenegger/nvim-dap", version = "*" },
    },
    {
        "creativenull/efmls-configs-nvim",
        dependencies = { "neovim/nvim-lspconfig" },
    },
    {
        "folke/trouble.nvim",
        version = "*",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        version = "*",
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        version = "*",
    },
    {
        "kristijanhusak/vim-dadbod-ui",
        version = "*",
        dependencies = {
            { "tpope/vim-dadbod" },
        },
    },
    {
        "nvim-orgmode/orgmode",
        version = "*",
        dependencies = {
            { "nvim-treesitter/nvim-treesitter" },
        },
        event = "VeryLazy",
    },
    {
        "nvim-neorg/neorg-telescope",
        version = "*",
        dependencies = { { "nvim-lua/plenary.nvim" }, { "nvim-neorg/neorg-telescope" } },
    },
}, {
    defaults = {
        lazy = false,
    },
    checker = {
        enabled = true,
    },
    installer = {
        colorscheme = { "catppuccin-mocha" },
    },
    performance = {
        rtp = {
            disabled_plugins = {
                "2html_plugin",
                "tohtml",
                "getscript",
                "getscriptPlugin",
                "gzip",
                "logipat",
                "netrw",
                "netrwPlugin",
                "netrwSettings",
                "netrwFileHandlers",
                "matchit",
                "tar",
                "tarPlugin",
                "rrhelper",
                "spellfile_plugin",
                "vimball",
                "vimballPlugin",
                "zip",
                "zipPlugin",
                "tutor",
                "rplugin",
                "syntax",
                "synmenu",
                "optwin",
                "compiler",
                "bugreport",
                "ftplugin",
            },
        },
    },
})
