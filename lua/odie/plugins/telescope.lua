return {

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-lua/plenary.nvim",
    },
    event = { "VeryLazy" },
    opts = function()
      return {
        defaults = {
          prompt_prefix = "   ",
          selection_caret = "  ",
          entry_prefix = "  ",
          initial_mode = "insert",
          selection_strategy = "reset",
          sorting_strategy = "ascending",
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.55,
              results_width = 0.8,
            },
            vertical = {
              mirror = true,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },
          file_ignore_patterns = { "node_modules", "vendor" },
          path_display = { "truncate" },
          winblend = 3,
          border = {},
          borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
          color_devicons = true,
          extensions = {
            fzf = {
              fuzzy = true, -- false will only do exact matching
              override_generic_sorter = true, -- override the generic sorter
              override_file_sorter = true, -- override the file sorter
              case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            },
          },
        },
      }
    end,
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
        { "<leader>fg", builtin.live_grep, desc = "Live Grep" },
        { "<leader>fb", builtin.buffers, desc = "Find Buffers" },
        { "<leader>fh", builtin.help_tags, desc = "Find Help Tags" },
        { "<leader>fo", builtin.oldfiles, desc = "Search File History" },
        { "<leader>fM", builtin.man_pages, desc = "Find Man Pages" },
      }
    end,
  },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  {
    "tzachar/fuzzy.nvim",
    dependencies = { "nvim-telescope/telescope-fzf-native.nvim" },
  },
}
