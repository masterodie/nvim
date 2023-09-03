return {

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-lua/plenary.nvim",
    },
    event = { "VeryLazy" },
    opts = require("odie.plugins.plugin-opts.telescope"),
    keys = function()
      local ok, builtin = pcall(require, "telescope.builtin")

      if not ok then
        return {}
      end

      return {
        {
          "<C-p>",
          function()
            builtin.find_files()
          end,
          desc = "Find Files",
        },
        { "<leader>ff", builtin.find_files, desc = "Find Files" },
        { "<leader>fg", builtin.live_grep,  desc = "Live Grep" },
        { "<leader>fb", builtin.buffers,    desc = "Find Buffers" },
        { "<leader>fh", builtin.help_tags,  desc = "Find Help Tags" },
        { "<leader>fo", builtin.oldfiles,   desc = "Search File History" },
        { "<leader>fM", builtin.man_pages,  desc = "Find Man Pages" },
      }
    end,
  },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  {
    "tzachar/fuzzy.nvim",
    dependencies = { "nvim-telescope/telescope-fzf-native.nvim" },
  },
}
