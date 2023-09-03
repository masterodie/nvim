return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    event = { "ColorScheme" },
    branch = "v3.x",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-tree/nvim-web-devicons" },
      { "MunifTanjim/nui.nvim" },
    },
    keys = {
      { "<leader>e",  "<cmd>Neotree toggle<cr>",     desc = "Toggle File Explorer" },
      { "<leader>fe", "<cmd>Neotree toggle<cr>",     desc = "Toggle File Explorer" },
      { "<leader>ge", "<cmd>Neotree git_status<cr>", desc = "Toggle Git Explorer" },
    },
    opts = require("odie.plugins.plugin-opts.neo-tree"),
  },
}
