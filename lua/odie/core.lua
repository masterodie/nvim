return {
  setup = function(options)
    require("odie.settings")
    local lazy = require("odie.lazy")

    lazy.setup({
      spec = {
        { import = "odie.plugins" },
      },
      installer = {
        colorscheme = { options.colorscheme },
      },
    })

    require("odie.mappings")

    vim.cmd.colorscheme(options.colorscheme)
  end,
}
