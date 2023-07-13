return {
  -- Fuzzy Finder (files, lsp, etc)
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
    },
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
              mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },
          file_ignore_patterns = { "node_modules", "vendor" },
          path_display = { "truncate" },
          winblend = 0,
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
      local ok, _ = pcall(require, "telescope.builtin")
      if not ok then
        return {}
      end
      return {
        {
          "<leader>gf",
          require("telescope.builtin").git_files,
          desc = "Search [G]it [F]iles",
        },
        {
          "<C-p>",
          require("telescope.builtin").find_files,
          desc = "[F]ind [F]iles",
        },
        {
          "<leader>ff",
          require("telescope.builtin").find_files,
          desc = "[F]ind [F]iles",
        },
        {
          "<leader>fg",
          require("telescope.builtin").live_grep,
          desc = "[F]ind by [G]rep",
        },
        {
          "<leader>fd",
          require("telescope.builtin").diagnostics,
          desc = "[F]ind [D]iagnostics",
        },
        {
          "<leader>fh",
          require("telescope.builtin").oldfiles,
          desc = "[F]ind [H]istory",
        },
        {
          "<leader>fb",
          require("telescope.builtin").buffers,
          desc = "[F]ind [B]uffers",
        },
        {
          "<leader>fm",
          function()
            require("telescope.builtin").man_pages({ sections = { "ALL" } })
          end,
          desc = "[F]ind [M]an Page",
        },
        {
          "<leader>sh",
          require("telescope.builtin").help_tags,
          desc = "[S]earch [H]elp",
        },
        {
          "<leader>sn",
          require("telescope.builtin").notify,
          desc = "[S]earch recent [N]otifications",
        },
        {
          "<leader>fw",
          function()
            require("telescope.builtin").grep_string({ search = vim.fn.expand("<cword>") })
          end,
          desc = "[F]ind [W]ord under cursor",
        },
      }
    end,
  },
}
