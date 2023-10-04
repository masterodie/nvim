require("gopher").setup({
    commands = {
        go = "go",
        gomodifytags = "gomodifytags",
        gotests = "gotests", -- also you can set custom command path
        impl = "impl",
        iferr = "iferr",
        dlv = "dlv",
    },
})
require("gopher.dap").setup()
