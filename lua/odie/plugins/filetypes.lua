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
    ft = { "rust", "cpp" },
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
      crates.setup({
        null_ls = {
          enabled = true,
          name = "crates.nvim",
        },
      })

      local mapopts = function(desc)
        return { silent = true, desc = desc }
      end

      vim.keymap.set("n", "<leader>pt", crates.toggle, mapopts("Crate Toggle"))
      vim.keymap.set("n", "<leader>pr", crates.reload, mapopts("Crate Reload"))

      vim.keymap.set("n", "<leader>pv", crates.show_versions_popup, mapopts("Crate Show Version Popup"))
      vim.keymap.set("n", "<leader>pf", crates.show_features_popup, mapopts("Crate show features Popup"))
      vim.keymap.set("n", "<leader>pd", crates.show_dependencies_popup, mapopts("Crate Show Dependency Popup"))

      vim.keymap.set("n", "<leader>pu", crates.update_crate, mapopts("Update Crate"))
      vim.keymap.set("v", "<leader>pu", crates.update_crates, mapopts("Update Crates"))
      vim.keymap.set("n", "<leader>pa", crates.update_all_crates, mapopts("Update All Crates"))
      vim.keymap.set("n", "<leader>pU", crates.upgrade_crate, mapopts("Upgrade Crate"))
      vim.keymap.set("v", "<leader>pU", crates.upgrade_crates, mapopts("Upgrade Crates"))
      vim.keymap.set("n", "<leader>pA", crates.upgrade_all_crates, mapopts("Upgrade All Crates"))

      vim.keymap.set("n", "<leader>pH", crates.open_homepage, mapopts("Open Crate Homepage"))
      vim.keymap.set("n", "<leader>pR", crates.open_repository, mapopts("Open Crate Repository"))
      vim.keymap.set("n", "<leader>pD", crates.open_documentation, mapopts("Open Crate Documentation"))
      vim.keymap.set("n", "<leader>pC", crates.open_crates_io, mapopts("Open crates.io for Crate"))
    end,
  },
  {
    "Civitasv/cmake-tools.nvim",
    lazy = false,
    opts = {
      cmake_build_directory = "build"
    }
  }
}
