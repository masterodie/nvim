return {
  {
    "nvim-tree/nvim-web-devicons",
    opts = {},
    config = function(_, opts)
      require("nvim-web-devicons").setup(opts)
    end,
  },
  { "elkowar/yuck.vim", lazy = false },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    opts = function()
      local extension_path = vim.env.HOME
        .. "/.vscode-oss/extensions/vadimcn.vscode-lldb-1.9.2-universal/"
      local codelldb_path = extension_path .. "adapter/codelldb"
      local liblldb_path = extension_path .. "lldb/lib/liblldb"
      local this_os = vim.loop.os_uname().sysname

      -- The path in windows is different
      if this_os:find("Windows") then
        codelldb_path = extension_path .. "adapter\\codelldb.exe"
        liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
      else
        -- The liblldb extension is .so for linux and .dylib for macOS
        liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
      end

      return {
        dap = {
          adapter = require("rust-tools.dap").get_codelldb_adapter(
            codelldb_path,
            liblldb_path
          ),
        },
        server = {
          settings = {
            ["rust-analyzer"] = {
              checkOnSave = {
                command = "clippy",
              },
            },
          },
        },
        tools = {
          autoSetHints = true,
          executor = require("rust-tools/executors").termopen,
          runnables = {
            use_telescope = true,
          },
          inlay_hints = {
            show_parameter_hints = true,
            parameter_hints_prefix = "<- ",
            other_hints_prefix = "=> ",
            max_len_align = false,
            max_len_align_padding = 1,
            right_align = false,
            right_align_padding = 7,
          },
          hover_actions = {
            border = "single",
            auto_focus = false,
          },
        },
      }
    end,
    dependencies = {
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap",
      "nvim-telescope/telescope.nvim",
    },
  },
  {
    "saecki/crates.nvim",
    tag = "v0.3.0",
    event = { "BufRead Cargo.toml" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
    config = function()
      local crates = require("crates")
      local mapopts = { silent = true }
      crates.setup({
        null_ls = {
          enabled = true,
          name = "crates.nvim",
        },
      })

      vim.keymap.set("n", "<leader>ct", crates.toggle, mapopts)
      vim.keymap.set("n", "<leader>cr", crates.reload, mapopts)

      vim.keymap.set("n", "<leader>cv", crates.show_versions_popup, mapopts)
      vim.keymap.set("n", "<leader>cf", crates.show_features_popup, mapopts)
      vim.keymap.set("n", "<leader>cd", crates.show_dependencies_popup, mapopts)

      vim.keymap.set("n", "<leader>cu", crates.update_crate, mapopts)
      vim.keymap.set("v", "<leader>cu", crates.update_crates, mapopts)
      vim.keymap.set("n", "<leader>ca", crates.update_all_crates, mapopts)
      vim.keymap.set("n", "<leader>cU", crates.upgrade_crate, mapopts)
      vim.keymap.set("v", "<leader>cU", crates.upgrade_crates, mapopts)
      vim.keymap.set("n", "<leader>cA", crates.upgrade_all_crates, mapopts)

      vim.keymap.set("n", "<leader>cH", crates.open_homepage, mapopts)
      vim.keymap.set("n", "<leader>cR", crates.open_repository, mapopts)
      vim.keymap.set("n", "<leader>cD", crates.open_documentation, mapopts)
      vim.keymap.set("n", "<leader>cC", crates.open_crates_io, mapopts)
    end,
  },
}
